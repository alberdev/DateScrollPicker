//
//  ViewController.swift
//  DateScrollPicker
//
//  Created by Alberto Aznar de los Ríos on 13/11/2019.
//  Copyright © 2019 Alberto Aznar de los Ríos. All rights reserved.
//

import UIKit
import DateScrollPicker

class ViewController: UIViewController {

    @IBOutlet weak var dateScrollPicker: DateScrollPicker!
    @IBOutlet weak var dateScrollPicker2: DateScrollPicker!
    @IBOutlet weak var dateScrollPicker3: DateScrollPicker!
    @IBOutlet weak var dateScrollPicker4: DateScrollPicker!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
        setupScrollPicker1()
        setupScrollPicker2()
        setupScrollPicker3()
        setupScrollPicker4()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// HANDLERS

extension ViewController {
    
    @objc func didPressTodayButton(_ sender: UIButton) {
        dateScrollPicker.selectToday()
        dateScrollPicker2.selectToday()
        dateScrollPicker3.selectToday()
        dateScrollPicker4.selectToday()
    }
}

// VIEW

extension ViewController {
    
    private func setupView() {
        navigationController?.navigationBar.barStyle = .black
        view.applyGradient(withColours: [UIColor(hex: "3a54e9"), UIColor(hex: "510094")], gradientOrientation: .vertical)
        detailView.layer.cornerRadius = 20
        detailView.clipsToBounds = true
        detailDateLabel.text = Date().format(dateFormat: "EEEE, dd MMMM yyyy")
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        let todayButton = UIBarButtonItem(
            title: "Today",
            style: .plain,
            target: self,
            action: #selector(didPressTodayButton))
        
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont(name: "Volte-Regular2", size: 18)!]
        
        todayButton.setTitleTextAttributes(titleAttributes, for: .normal)
        todayButton.tintColor = .white
        navigationItem.rightBarButtonItem = todayButton
    }
    
    private func setupScrollPicker1() {
        var format = DateScrollPickerFormat()
        format.topTextColor = UIColor.white.withAlphaComponent(0.1)
        format.topTextSelectedColor = UIColor.white.withAlphaComponent(0.3)
        format.mediumTextColor = UIColor.white.withAlphaComponent(0.3)
        format.bottomTextColor = UIColor.white.withAlphaComponent(0.3)
        format.topFont = UIFont(name: "Volte-Regular2", size: 16)!
        format.mediumFont = UIFont(name: "Volte-Regular3", size: 36)!
        format.bottomFont = UIFont(name: "Volte-Regular2", size: 16)!
        format.dayBackgroundColor = UIColor.white.withAlphaComponent(0.1)
        format.dayBackgroundSelectedColor = UIColor(hex: "ed1e79")
        format.separatorTopTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBottomTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        format.separatorTopFont = UIFont(name: "Volte-Regular3", size: 22)!
        format.separatorBottomFont = UIFont(name: "Volte-Regular2", size: 20)!
        dateScrollPicker.format = format
        dateScrollPicker.delegate = self
    }
    
    private func setupScrollPicker2() {
        var format = DateScrollPickerFormat()
        format.days = 4
        format.topDateFormat = ""
        format.bottomDateFormat = "MMMM"
        format.topTextColor = UIColor.white.withAlphaComponent(0.1)
        format.mediumTextColor = UIColor.white.withAlphaComponent(0.3)
        format.bottomTextColor = UIColor.white.withAlphaComponent(0.3)
        format.topFont = UIFont(name: "Volte-Regular2", size: 16)!
        format.bottomFont = UIFont(name: "Volte-Regular2", size: 12)!
        format.dayBackgroundColor = UIColor.white.withAlphaComponent(0.1)
        format.dayBackgroundSelectedColor = UIColor(hex: "ed1e79")
        format.separatorTopTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBottomTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        format.separatorTopFont = UIFont(name: "Volte-Regular3", size: 22)!
        format.separatorTopFont = UIFont(name: "Volte-Regular2", size: 20)!
        dateScrollPicker2.format = format
        dateScrollPicker2.delegate = self
        dateScrollPicker2.dataSource = self
    }
    
    private func setupScrollPicker3() {
        var format = DateScrollPickerFormat()
        format.days = 7
        format.topDateFormat = ""
        format.topTextColor = UIColor.white.withAlphaComponent(0.1)
        format.mediumTextColor = UIColor.white.withAlphaComponent(0.3)
        format.bottomTextColor = UIColor.white.withAlphaComponent(0.3)
        format.topFont = UIFont(name: "Volte-Regular2", size: 8)!
        format.mediumFont = UIFont(name: "Volte-Regular3", size: 18)!
        format.bottomFont = UIFont(name: "Volte-Regular2", size: 8)!
        format.dayBackgroundColor = UIColor.white.withAlphaComponent(0.1)
        format.dayBackgroundSelectedColor = UIColor(hex: "ed1e79")
        format.separatorTopTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBottomTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        format.separatorTopFont = UIFont(name: "Volte-Regular3", size: 12)!
        format.separatorBottomFont = UIFont(name: "Volte-Regular2", size: 12)!
        dateScrollPicker3.format = format
        dateScrollPicker3.delegate = self
    }
    
    private func setupScrollPicker4() {
        var format = DateScrollPickerFormat()
        format.days = 5
        format.topDateFormat = "MMM"
        format.bottomDateFormat = "EEEE"
        format.topTextColor = UIColor.white.withAlphaComponent(0.9)
        format.mediumTextColor = UIColor.white.withAlphaComponent(0.9)
        format.bottomTextColor = UIColor.white.withAlphaComponent(0.9)
        format.topFont = UIFont(name: "Volte-Regular2", size: 16)!
        format.bottomFont = UIFont(name: "Volte-Regular2", size: 10)!
        format.dayBackgroundColor = UIColor.black.withAlphaComponent(0.8)
        format.dayBackgroundSelectedColor = UIColor(hex: "00CC14")
        format.separatorTopTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBottomTextColor = UIColor.white.withAlphaComponent(0.6)
        format.separatorBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        format.separatorTopFont = UIFont(name: "Volte-Regular3", size: 22)!
        format.separatorTopFont = UIFont(name: "Volte-Regular2", size: 20)!
        dateScrollPicker4.format = format
        dateScrollPicker4.delegate = self
        dateScrollPicker4.dataSource = self
    }
}

// DELEGATES

extension ViewController: DateScrollPickerDelegate {
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date) {
        detailDateLabel.text = date.format(dateFormat: "EEEE, dd MMMM yyyy")
    }
}

extension ViewController: DateScrollPickerDataSource {
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, mediumAttributedStringByDate date: Date) -> NSAttributedString? {
        if dateScrollPicker === dateScrollPicker2 {
            let attributes1 = [NSAttributedString.Key.font: UIFont(name: "Volte-Regular3", size: 36)!]
            let attributes2 = [NSAttributedString.Key.font: UIFont(name: "Volte-Regular2", size: 10)!]
            let attributed = NSMutableAttributedString(string: date.format(dateFormat: "dd EEE").uppercased())
            attributed.addAttributes(attributes1, range: NSRange(location: 0, length: 2))
            attributed.addAttributes(attributes2, range: NSRange(location: 2, length: 4))
            return attributed
        } else {
            return nil
        }
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dataAttributedStringByDate date: Date) -> NSAttributedString? {
        if dateScrollPicker === dateScrollPicker2 {
            let attributes = [NSAttributedString.Key.font: UIFont(name: "Volte-Regular2", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.white]
            return Date.today() == date ? NSAttributedString(string: "3 events", attributes: attributes) : nil
        } else {
            return nil
        }
    }
    
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, dotColorByDate date: Date) -> UIColor? {
        if Date.today() == date { return .yellow }
        if Date.today().addDays(1) == date { return UIColor(hex: "00FF1A") }
        if Date.today().addDays(-1) == date { return UIColor(hex: "00FF1A") }
        return UIColor.white.withAlphaComponent(0.1)
    }
}
