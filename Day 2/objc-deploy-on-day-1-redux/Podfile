source 'https://github.com/CocoaPods/Specs'

platform :ios, '8.0'
inhibit_all_warnings!  # Don't wanna spook the kids


pod 'Masonry'
pod 'FontAwesomeKit/IonIcons'


target :unit_tests, :exclusive => true do
  link_with 'UnitTests'

  pod 'Specta', '~> 1.0'
  pod 'Expecta', '~> 1.0'
end