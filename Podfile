platform:ios,'8.0'
use_frameworks!
inhibit_all_warnings!

target 'CLPDemo' do
    pod 'Masonry', '0.6.3'
end

target 'CLPSiriIntent' do
    pod 'Masonry', '0.6.3'
end

target 'CLPSiriIntentUI' do
    pod 'Masonry', '0.6.3'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
        end
    end
end
