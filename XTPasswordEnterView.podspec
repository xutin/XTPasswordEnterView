#
#  Be sure to run `pod spec lint XTPasswordEnterView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
     s.name         = 'XTPasswordEnterView'
	  s.version      = '1.0'
	  s.summary      = 'password enter view for iOS.'
	  s.homepage     = 'https://github.com/xutin/XTPasswordEnterView'
	  s.license      = 'MIT'
	  s.author       = {'xutin' => 'xuting@365qian.com'}
	  s.platform     = :ios, '8.0'
	  s.source       = {:git => 'https://github.com/xutin/XTPasswordEnterView.git', :tag => s.version}
	  s.source_files = ’XTPasswordEnterView/**/*.{h,m}’
	  s.requires_arc = true

end
