Pod::Spec.new do |s|
  s.name             = 'Gyro'
  s.version          = '0.0.1'
  s.summary          = 'Swifty Rotation Library'
  s.homepage         = 'https://github.com/efremidze/Gyro'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'efremidze' => 'efremidzel@hotmail.com' }
  s.source           = { :git => 'https://github.com/efremidze/Gyro.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/*.swift'
end
