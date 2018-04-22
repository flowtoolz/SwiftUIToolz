 Pod::Spec.new do |s|
    
    # meta infos
    s.name             = "UIToolz"
    s.version          = "1.0.0"
    s.summary          = "Re-usable UI code"
    s.description      = "A collection of re-usable UI code based on UIKit and AppKit"
    s.homepage         = "https://flowtoolz.com"
    s.license          = 'commercial'
    s.author           = { "Flowtoolz" => "contact@flowtoolz.com" }
    s.source           = {  :git => "https://github.com/flowtoolz/UIToolz.git",
                            :tag => s.version.to_s }
    
    # to be sure
    s.requires_arc = true
    
    # minimum platform SDKs
    s.platforms = {:ios => "9.0", :osx => "10.10", :tvos => "9.0"}

    # minimum deployment targets
    s.ios.deployment_target  = '9.0'
    s.osx.deployment_target = '10.10'
    s.tvos.deployment_target = '9.0'

    # sources
    s.ios.source_files = 'Code/uikit/**/*.swift'
    s.tvos.source_files = 'Code/uikit/**/*.swift'
    s.osx.source_files = 'Code/appkit/**/*.swift'

    # dependencies
    s.dependency 'PureLayout', '3.0.2'
    s.dependency 'SwiftyToolz', '1.0.0'
end
