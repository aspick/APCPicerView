Pod::Spec.new do |s|
  s.name         = "APCPickerView"
  s.version      = "0.0.1"
  s.summary      = "Add touch begin and end detection to UIPickerView"
  s.homepage     = "https://github.com/aspick/APCPickerView"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "" => "" }

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/aspick/APCPickerView.git", :tag => '0.0.2'}

  s.source_files  = 'APCPickerView/*.{h,m}'

  s.requires_arc = true
end
