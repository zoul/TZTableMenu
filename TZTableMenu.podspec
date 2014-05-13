#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name         = "TZTableMenu"
  s.version      = "0.1.0"
  s.summary      = "A UITableView data source and delegate well suited to creating table menus"
  s.homepage     = "https://github.com/zoul/TZTableMenu"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Tomáš Znamenáček" => "tomas.znamenacek@gmail.com" }
  s.source       = { :git => "https://github.com/zoul/TZTableMenu.git", :tag => s.version.to_s }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'Library', 'Demo'
end
