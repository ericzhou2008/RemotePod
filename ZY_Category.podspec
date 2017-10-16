#
#  Be sure to run `pod spec lint QFToolBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    
    s.name         = "ZY_Category"
    s.version      = "0.0.1"
    s.summary      = "all kinds of categories for iOS develop"    
    s.description  = <<-DESC
    this project provide all kinds of categories for iOS developer
    DESC
    
    s.homepage     = "https://github.com/ericzhou2008/ZY_Category"
        
    s.license      = { :type => "MIT", :file => "LICENSE" }
    
    s.author       = { "ericzhou2008" => "ericzhou2008@126.com" }
    
    s.platform     = :ios
    
    s.source       = { :git => "https://github.com/ericzhou2008/ZY_Category.git", :tag => "0.0.1" }
    # s.source_files = "ZY_Category/ZYUIKit/*.{h,m}", "ZY_Category/ZYRequest/*.{h,m}"
    s.frameworks   = "AddressBook"
    # s.resources    = "Source/Languages/**"    
    # s.source_files = "Classes", "ZY_Category/Classes/UIKit/*.{h,m}"
    # s.exclude_files = "Classes/Exclude"
    # s.public_header_files = "ZY_Category/Classes/UIKit/UI_Categories.h", "ZY_Category/Classes/**/*.h"
    
    # 例子如下：
    # https://github.com/yongqianvip/iOS_Category.git
    # s.public_header_files = "iOS_Category/Classes/UIKit/UI_Categories.h"，"iOS_Category/Classes/Foundation/Foundation_Category.h"，"iOS_Category/Classes/**/*.h"

    s.subspec 'ZYUIKit' do |kit|
        kit.source_files = 'ZY_Category/ZYUIKit/*.{h,m}'
      # kit.dependency 'ZY_Category/ZYUIKit'
    end

    s.subspec 'ZYRequest' do |req|
      # req.dependency 'ZY_Category/ZYRequest'
      req.source_files = 'ZY_Category/ZYRequest/*.{h,m}'
      # req.dependency 'AFNetworking', '~> 3.1.0'
    end

    s.requires_arc = true
    
end
