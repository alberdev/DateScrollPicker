//
//  DateScrollPicker.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 13/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit

open class DateScrollPicker: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    /// Date scroll manager
    private var manager = DateScrollManager()
    
    /// Selected item
    private var selectedIndexPath: IndexPath?
    
    /// Collection items
    private var dateItems = [DateScrollItem]()
    
    /////////////////////////////////////////////////////////////////////////////
    /// The object that provides the data for the field view
    /// - Note: The data source must adopt the `AnimatedFieldDataSource` protocol.
    weak open var dataSource: DateScrollPickerDataSource?
    
    /// //////////////////////////////////////////////////////////////////////////
    /// The object that acts as the delegate of the date scroll picker view. The delegate
    /// object is responsible for managing selection behavior and interactions with
    /// individual items.
    /// - Note: The delegate must adopt the `DateScrollPickerDelegate` protocol.
     weak open var delegate: DateScrollPickerDelegate?
    
    /// //////////////////////////////////////////////////////////////////////////
    /// Object that configure `DateScrollPicker` view. You can setup `DateScrollPicker` with
    /// your own parameters. See also `DateScrollPickerFormat` implementation.
    open var format = DateScrollPickerFormat() {
        didSet {
            if !format.separatorEnabled {
                dateItems = dateItems.filter({ $0.separator == false })
                collectionView.reloadData()
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    open override func draw(_ rect: CGRect) {
        // selectToday(animated: false)
    }
    
    private func commonInit() {
        _ = fromNib()
        setupView()
        setupInitialDays()
        setupCollection()
    }
    
    private func setupView() {
        backgroundColor = .clear
        manager.format = format
    }
    
    private func setupInitialDays() {
        let monthStartDate = Date().firstDateOfMonth().addMonth(-12)!
        let monthEndDate = Date().firstDateOfMonth().addMonth(12)!
        var currentDate = monthStartDate
        
        while currentDate < monthEndDate {
            if currentDate == currentDate.firstDateOfMonth() {
                dateItems.append(DateScrollItem(date: currentDate, selected: false, separator: true))
            }
            dateItems.append(DateScrollItem(date: currentDate, selected: false, separator: false))
            currentDate = currentDate.addDays(1)!
        }
    }
    
    private func setupCollection() {
        let bundle = Bundle(for: self.classForCoder)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DateViewCell", bundle: bundle), forCellWithReuseIdentifier: "DateViewCell")
        collectionView.register(UINib(nibName: "SeparatorViewCell", bundle: bundle), forCellWithReuseIdentifier: "SeparatorViewCell")
    }
}

// MARK: PUBLIC

extension DateScrollPicker: DateScrollPickerInterface {
    
    open func selectToday(animated: Bool? = nil) {
        selectDate(Date.today(), animated: animated)
    }
    
    open func selectDate(_ date: Date, animated: Bool? = nil) {
        guard let indexPath = indexPath(date: date.plain()) else { return }
        selectItemAt(indexPath)
        scrollToDate(dateItems[indexPath.item].date, animated: animated)
    }
    
    open func scrollToDate(_ date: Date, animated: Bool? = nil) {
        guard let indexPath = indexPath(date: date.plain()) else { return }
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated ?? true)
    }
}

// MARK: ACTIONS

extension DateScrollPicker {
    
    private func indexPath(date: Date) -> IndexPath? {
        guard let index = dateItems.firstIndex(where: {$0.date == date && $0.separator == false }) else { return nil }
        return IndexPath(item: index, section: 0)
    }
    
    private func selectItemAt(_ indexPath: IndexPath) {
        
        guard selectedIndexPath != indexPath else { return }
        
        // Selected cell
        let cell = collectionView.cellForItem(at: indexPath) as? DateViewCell
        
        // Animate selection
        if format.animatedSelection {
            cell?.animateSelection(completion: nil)
        }
        
        // Make item selected
        dateItems.indices.forEach({ dateItems[$0].selected = false })
        dateItems[indexPath.item].selected = true
        
        // Select new indexPath
        var items = [indexPath]
        if let selectedIndexPath = selectedIndexPath { items.append(selectedIndexPath) }
        collectionView.reloadItems(at: items)
        // collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
        selectedIndexPath = indexPath
    }
    
    private func insertNewItems(_ insert: DateInsertType) {
        guard let collectionView = collectionView, !manager.loadingMore else { return }
        manager.loadingMore = true
        
        var newDays = [DateScrollItem]()
        switch insert {
        case .previous:
            newDays = manager.insertPreviousMonthDays(current: dateItems)
            dateItems.insert(contentsOf: newDays, at: 0)
        case .next:
            newDays = manager.insertNextMonthDays(current: dateItems)
            dateItems.append(contentsOf: newDays)
        }
        
        manager.insert(insert, count: newDays.count, inCollectionView: collectionView)
    }
}

// MARK: COLLECTION DELEGATES

extension DateScrollPicker: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateItems.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if dateItems[indexPath.item].separator {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeparatorViewCell", for: indexPath) as! SeparatorViewCell
            cell.format = format
            cell.date = dateItems[indexPath.item].date
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateViewCell", for: indexPath) as! DateViewCell
            cell.dataSource = self
            cell.format = format
            cell.date = dateItems[indexPath.item].date
            cell.isOn = dateItems[indexPath.item].selected
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !dateItems[indexPath.item].separator && indexPath != selectedIndexPath {
            selectDate(dateItems[indexPath.item].date)
            // selectItemAt(indexPath)
            delegate?.dateScrollPicker(self, didSelectDate: dateItems[indexPath.item].date)
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if collectionView.contentOffset.x < 10 {
            insertNewItems(.previous)
        }
        if collectionView.contentOffset.x > collectionView!.contentSize.width - collectionView.frame.size.width {
            insertNewItems(.next)
        }
        if format.fadeEnabled {
            collectionView.updateFadeCells()
        }
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if format.fadeEnabled {
            collectionView.updateFadeCells()
        }
    }
}

extension DateScrollPicker: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / CGFloat(format.days), height: collectionView.frame.size.height)
    }
}

extension DateScrollPicker: DateViewCellDataSource {
    
    func dateViewCell(_ dateViewCell: DateViewCell, topAttributedStringByDate date: Date) -> NSAttributedString? {
        return dataSource?.dateScrollPicker(self, topAttributedStringByDate: date) ?? NSAttributedString(string: date.format(dateFormat: format.topDateFormat).uppercased())
    }
    
    func dateViewCell(_ dateViewCell: DateViewCell, mediumAttributedStringByDate date: Date) -> NSAttributedString? {
        return dataSource?.dateScrollPicker(self, mediumAttributedStringByDate: date) ?? NSAttributedString(string: date.format(dateFormat: format.mediumDateFormat).uppercased())
    }
    
    func dateViewCell(_ dateViewCell: DateViewCell, bottomAttributedStringByDate date: Date) -> NSAttributedString? {
        return dataSource?.dateScrollPicker(self, bottomAttributedStringByDate: date) ?? NSAttributedString(string: date.format(dateFormat: format.bottomDateFormat).uppercased())
    }
    
    func dateViewCell(_ dateViewCell: DateViewCell, dataAttributedStringByDate date: Date) -> NSAttributedString? {
        return dataSource?.dateScrollPicker(self, dataAttributedStringByDate: date)
    }
    
    func dateViewCell(_ dateViewCell: DateViewCell, dotColorByDate date: Date) -> UIColor? {
        return dataSource?.dateScrollPicker(self, dotColorByDate: date)
    }
}
