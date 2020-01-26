platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!
 

source 'https://github.com/CocoaPods/Specs.git'

target :BrokerAppDemo do
  pod 'BrokerApp', '~> 1.0.2'
end


post_install do |installer|
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
   	  config.build_settings['SWIFT_VERSION'] = '5.0'

      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
  
end

