Pod::Spec.new do |s|

  s.name         = "RemotePod"
  s.version      = "0.0.2"
  s.summary      = "all kinds of categories for iOS develop"

  s.description  = <<-DESC
                        this project provide all kinds of categories for iOS developer
                   DESC

  s.homepage     = "https://github.com/ericzhou2008/RemotePod"


  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author       = { "ericzhou2008" => "ericzhou2008@126.com" }

  s.platform     = :ios

  s.source       = { :git => "https://github.com/ericzhou2008/RemotePod.git", :tag => "0.0.2" }

  s.source_files  = "Classes", "RemotePod/Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "RemotePod/Classes/UIKit/UI_Categories.h", "RemotePod/Classes/**/*.h"
  
  # 例子如下：
  # https://github.com/yongqianvip/iOS_Category.git
  # s.public_header_files = "iOS_Category/Classes/UIKit/UI_Categories.h"，"iOS_Category/Classes/Foundation/Foundation_Category.h"，"iOS_Category/Classes/**/*.h"
  
  s.requires_arc = true

end
