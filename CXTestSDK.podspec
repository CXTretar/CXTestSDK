#
# Be sure to run `pod lib lint CXTestSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CXTestSDK'
  s.version          = '0.1.3'
  s.summary          = 'A short description of CXTestSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/CXTretar/CXTestSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CXTretar' => 'misscxuan@163.com' }
  s.source           = { :git => 'https://github.com/CXTretar/CXTestSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CXTestSDK/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CXTestSDK' => ['CXTestSDK/Assets/*.png']
  # }

  s.public_header_files = 'CXTestSDK/Classes/Headers/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
                              
  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'SVProgressHUD'
  s.dependency 'MBProgressHUD'
end
