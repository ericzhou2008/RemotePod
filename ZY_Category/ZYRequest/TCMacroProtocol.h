//
//  TCMacroProtocol.h
//  TouCool
//
//  Created by 周勇 on 2017/7/13.
//  Copyright © 2017年 TouCool. All rights reserved.
//

#ifndef TCMacroProtocol_h
#define TCMacroProtocol_h
#import <Foundation/Foundation.h>

static NSString *const TCPlatform                                    = @"ios";///< 平台

static NSString *const TCResponseCode                                = @"code";///< 返回code key
static NSString *const TCResponseMsg                                 = @"msg";///< 返回msg key
static NSString *const TCResponseTs                                  = @"ts";///< 返回ts key

static NSString *const TCPostBodyKey                                 = @"postBody";///< postBody 上传文件内容key @{@"filename": @[@"file1", @"file2", @"file3"], @"file":@[image1, image12, image13], @"fileType":@"image/jpg"}
static NSString *const TCPostNameKey                                 = @"postname";///< postname 上传文件名key 服务器接收名称
static NSString *const TCPostFileKey                                 = @"postFile";///< postFile 上传文件内容key

static NSString *const TCPostFileTypeKey                             = @"fileType";///< fileType 文件类型
static NSString *const TCPostFileTypeImageKey                        = @"image/jpg";///< image/jpg 上传文件类型-图片 @"video/mp4" @"image/png" @"image/jpg" @"multipart/form-data"
static NSString *const TCPostFileTypeAudioKey                        = @"application/octet-stream";///< application/octet-stream 上传文件类型-音频 @"application/octer-stream" @"application/octet-stream" @"amr/mp3/wmr"
static NSString *const TCPostFileTypeVideoKey                        = @"video/mp4";///< 上传文件类型-视频 @"video/mp4"
static NSString *const TCPostFileTypeDocumentKey                     = @"document";///< 上传文件类型-文档

/* ------ CODE ------ */
static NSUInteger const TCCODE_SUCCESS                               = 0;///< 0：正常
static NSString *const TCMethodSchool_list                           = @"school/list";///< GET-common/school/list 获取学校列表

#endif /* TCMacroProtocol_h */






