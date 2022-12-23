Pod::Spec.new do |s|
  s.name             = 'PatrolAutomator'
  s.version          = '0.10.6'
  s.summary          = 'Patrol native automator based on XCUITest.'
  s.description      = <<-DESC
Runs tests that use flutter_test and patrol APIs as native iOS integration tests.
                       DESC
  s.homepage         = 'https://leancode.pl'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Bartek Pacia' => 'bartek.pacia@leancode.pl' }
  s.source           = { :http => 'https://github.com/leancodepl/patrol/tree/master/packages/patrol' }
  s.source_files = 'Classes/**/*'
  # s.public_header_files = 'Classes/**/*'
  s.framework = 'XCTest' # weak_framework
  s.ios.framework  = 'UIKit'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  
  s.dependency 'gRPC-Swift', '~> 1.8.0' # This is the last version published on CocoaPods.
                                        # Newer ones are only available on SPM.
end
