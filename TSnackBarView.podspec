#
# Be sure to run `pod lib lint TSnackBarView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TSnackBarView'
  s.version          = '1.0.0'
  s.summary          = 'TSnackBarView is a simple and flexible UI component fully written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'TSnackBarView is a simple and flexible UI component fully written in Swift. TSnackBarView helps you to show snackbar easily with 3 styles: normal, successful and error'

  s.homepage         = 'https://github.com/fanta1ty/TSnackBarView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanta1ty' => 'thinhnguyen12389@gmail.com' }
  s.source           = { :git => 'https://github.com/fanta1ty/TSnackBarView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target   = '10.0'
  s.swift_version           = '5.0'
  s.source_files            = 'TSnackBarView/Classes/**/*'
  s.resources               = 'TSnackBarView/Assets/*.xcassets'
  # s.resource_bundles = {
  #   'TSnackBarView' => ['TSnackBarView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
