Pod::Spec.new do |s|
    s.name             = 'libra-ios'
    s.version          = '0.1.0'
    s.summary          = ''
    
    s.description      = <<-DESC
    DESC
    
    s.homepage         = 'https://github.com/hweiguang/libra-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Wei Guang Heng' => 'weiguang747@gmail.com' }
    s.source           = { :git => 'https://github.com/hweiguang/libra-ios.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '13.0'
    s.source_files = 'Sources/*'
 
end