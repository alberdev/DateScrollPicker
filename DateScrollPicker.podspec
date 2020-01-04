#
# Be sure to run `pod lib lint DateScrollPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name              = 'DateScrollPicker'
s.summary           = 'Fully customizable date scroll view with picker feature for iOS written in Swift 5'
s.description       = 'DateScrollPicker create a view with a UICollectionView. This collection has infinite cells with dates. You can customize all this cells with your own fonts and colors.'
s.version           = '1.0.2'

# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.license           = { :type => 'MIT', :file => 'LICENSE' }

# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.author            = { 'Alberto Aznar' => 'info@alberdev.com' }
s.homepage          = 'https://github.com/alberdev/DateScrollPicker'
s.social_media_url  = 'https://twitter.com/alberdev'

# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.source            = { :git => 'https://github.com/alberdev/DateScrollPicker.git', :tag => s.version.to_s }

# ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.framework         = 'UIKit'

# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.source_files      = 'DateScrollPicker/**/*'

# ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

#s.resources         = 'DateScrollPicker/Cell/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'

# ――― Swift Version ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.swift_version     = '5.0'

end
