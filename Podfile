platform:ios,'8.0'
#use_frameworks!
inhibit_all_warnings!

target 'CLPDemo' do
    pod 'AFNetworking', ‘2.5.4’
    pod 'AFDownloadRequestOperation', '2.0.1'
    pod 'Masonry', '0.6.3'
    pod 'Mantle', '2.0.5'
    pod 'MSWeakTimer', '~> 1.1.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
end
end
end
