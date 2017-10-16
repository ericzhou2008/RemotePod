#
#  Be sure to run `pod spec lint QFToolBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    
    s.name         = "ZT_Category"
    s.version      = "0.0.1"
    s.summary      = "all kinds of categories for iOS develop"    
    s.description  = <<-DESC
    this project provide all kinds of categories for iOS developer
    DESC
    
    s.homepage     = "https://github.com/ericzhou2008/ZT_Category"
        
    s.license      = { :type => "MIT", :file => "LICENSE" }
    
    s.author       = { "ericzhou2008" => "ericzhou2008@126.com" }
    
    s.platform     = :ios
    
    s.source       = { :git => "https://github.com/ericzhou2008/ZT_Category.git", :branch => "master" }
    s.source_files = "ZT_Category/**/*.{h,m}"
    s.frameworks   = "AddressBook"
    # s.resources    = "Source/Languages/**"    
    # s.source_files = "Classes", "ZT_Category/Classes/UIKit/*.{h,m}"
    # s.exclude_files = "Classes/Exclude"
    # s.public_header_files = "ZT_Category/Classes/UIKit/UI_Categories.h", "ZT_Category/Classes/**/*.h"
    
    # 例子如下：
    # https://github.com/yongqianvip/iOS_Category.git
    # s.public_header_files = "iOS_Category/Classes/UIKit/UI_Categories.h"，"iOS_Category/Classes/Foundation/Foundation_Category.h"，"iOS_Category/Classes/**/*.h"
    
    # s.subspec 'UIKit' do |kit|
    #     kit.dependency 'UIKit'
    # end

    s.subspec 'ZYUIKit' do |kit|
        kit.source_files = 'ZYUIKit/**/*.{h,m}'
      # kit.dependency 'ZT_Category/ZYUIKit'
    end

    s.subspec 'ZYRequest' do |req|
      # req.dependency 'ZT_Category/ZYRequest'
      req.source_files = 'ZYRequest/**/*.{h,m}'
      req.dependency 'AFNetworking', '~> 3.1.0'
    end

    s.requires_arc = true
    
end
