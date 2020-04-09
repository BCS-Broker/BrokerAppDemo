platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!
 

source 'https://github.com/CocoaPods/Specs.git'

target :BrokerAppDemo do
  pod 'BrokerApp'
  pod 'APICore', '3.0.4'
end


post_install do |installer|
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
       
      if config.name == 'Debug' || config.name == 'Develop'
        config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
        config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
      else
        config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf-with-dsym'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
      config.build_settings['VALID_ARCHS'] = 'arm64 arm64e'
      config.build_settings['VALID_ARCHS[sdk=iphoneos*]'] = 'arm64 arm64e'
      config.build_settings['VALID_ARCHS[sdk=iphonesimulator*]'] = 'x86_64'
    end
  end
end


