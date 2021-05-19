#
# Be sure to run `pod lib lint SwiftyNewsKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
# 1. new code update github
# 2. local not code : pod repo add SwiftyNewsKit  https://github.com/DanielZSY/SwiftyNewsKit.git
#    local uodate code: cd ~/.cocoapods/repos/SwiftyNewsKit. Then execute: pod repo update SwiftyNewsKit
# 3. pod repo push SwiftyNewsKit SwiftyNewsKit.podspec --allow-warnings --sources='https://github.com/CocoaPods/Specs.git'
# 4. pod trunk push SwiftyNewsKit.podspec --allow-warnings
# 5. pod install or pod update on you project execute

Pod::Spec.new do |s|
  s.name             = 'SwiftyNewsKit'
  s.version          = '0.0.1'
  s.summary          = 'SwiftyNewsKit'
  s.module_name      = 'SwiftyNewsKit'
  
  s.homepage         = 'https://github.com/DanielZSY/SwiftyNewsKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DanielZSY' => 'danielzsy@163.com' }
  s.source           = { :git => 'https://github.com/DanielZSY/SwiftyNewsKit.git', :tag => s.version.to_s }
  
  s.platform              = :ios, '10.0'
  s.swift_versions        = "5"
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '5.0' }
  
  s.frameworks    = 'UIKit'
  s.libraries     = 'z', 'sqlite3', 'c++'
  s.source_files  = 'SwiftyNewsKit/**/*.{swift,h,m}'
  s.resources = ['SwiftyNewsKit/Assets/**/*.strings']
  s.ios.resource_bundle = {
       'SwiftyNewsKit' => 'SwiftyNewsKit/Assets/Assets.xcassets'
   }
  s.dependency 'SwiftyUIKit'
  s.dependency 'SwiftyLocalKit'
  s.dependency 'SwiftyPlayerKit'
end
