//
//  ZTRequestModel.h
//  ZTRequest
//
//  Created by mygame on 15/9/28.
//  Copyright © 2015年 youwoxing. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <AFNetworking/AFNetworking.h>
//#import "TCMacroProtocol.h"
//#import "TCRespBaseModel.h"

static NSString *const TCPOST = @"POST"; ///< POST请求
static NSString *const TCGET  = @"GET"; ///< GET请求

typedef NS_ENUM(NSInteger, ZTReachabilityWWANStatus) {
    ZTReachabilityWWANStatusNone = 0,///< Not Reachable vis WWAN
    ZTReachabilityWWANStatusWiFi = 1,///< Reachable vis WiFi
    ZTReachabilityWWANStatus2G   = 2,///< Reachable via 2G (GPRS/EDGE)       10~100Kbps
    ZTReachabilityWWANStatus3G   = 3,///< Reachable via 3G (WCDMA/HSDPA/...) 1~10Mbps
    ZTReachabilityWWANStatus4G   = 4,///< Reachable via 4G (eHRPD/LTE)       100Mbps
};

@protocol ZTRequestModelProtocol
@required

@property (strong, nonatomic) NSString *hostUrl; ///< host+port

@property (assign, nonatomic) NSUInteger reachabilityStatus; ///< ZTReachabilityWWANStatus

/**
 *  请求异常处理（包括：服务器维护，鉴权失败，该用户已经被拉黑）
 *
 *  @param responseObject 错误 HTTP 请求结果
 */
+ (void)checkResponseObject:(id)responseObject;
@end

/// 协议请求model
@interface ZTRequestModel : NSObject


//- (AFHTTPSessionManager *)manager;
//
///// 请求URLString的MD5
//- (NSString *)requestMD5Url;
//
///// 请求URLString
////- (NSString *)requestUrl;
//
///// 协议PHP服务 Common BaseUrl
//- (NSString *)protocolCommonBaseUrl;
//
///// 协议PHP服务BaseUrl
//- (NSString *)protocolBaseUrl;
//
///// 协议PHP服务BaseUrl
//+ (NSString *)getProtocolBaseUrl;
//
///// 设置HTTP请求头
//- (void)setHTTPReqHeaderParas:(NSDictionary *)paras;
//
///// 取消http请求
//- (void)cancelRequest;
//
//#pragma mark - HTTP 请求方法
///**
// 通用接口请求方法
//
// @param baseURL 请求URL
// @param HTTPMethod 请求方法GET/POST
// @param parameters 请求参数
// @param extendBody 文件上传自动以body @{@"filename": @[@"image1",…,@"image4"], @"postFile":@[image1,…,image4], @"fileType":@"image/jpg"}
// @param downloadProgress 加载进度
// @param success 成功回调（queryURLString=完整请求URL, responseObject=NSDictionary）
// @param failure 失败回调（queryURLString=完整请求URL, error=错误描述去error.localizedDescription即可）
// */
//- (void)queryWithBaseURL:(NSString *)baseURL
//              HTTPMethod:(NSString *)HTTPMethod
//              parameters:(id)parameters
//              extendBody:(id)extendBody
//                progress:(void (^)(NSProgress *downloadProgress))downloadProgress
//                 success:(void (^)(NSString *queryURL, id responseObject))success
//                 failure:(void (^)(NSString *queryURL, NSError *error))failure;
//
//
///**
// 带进度 NSProgress HTTP请求基础方法-只支持GET、POST，且POST不支持文件、图片上传
//
// @param baseURL 请求URL
// @param HTTPMethod 请求方法GET/POST
// @param parameters 请求参数
// @param downloadProgress 加载进度
// @param success 成功回调（queryURLString=完整请求URL, responseObject=NSDictionary）
// @param failure 失败回调（queryURLString=完整请求URL, error=错误描述去error.localizedDescription即可）
// */
//- (void)queryWithBaseURL:(NSString *)baseURL
//              HTTPMethod:(NSString *)HTTPMethod
//              parameters:(id)parameters
//                progress:(void (^)(NSProgress *downloadProgress))downloadProgress
//                 success:(void (^)(NSString *queryURL, id responseObject))success
//                 failure:(void (^)(NSString *queryURL, NSError *error))failure;
//
//
///**
// 带进度 aProgress HTTP请求基础方法-只支持GET、POST，且POST不支持文件、图片上传
//
// @param baseURL 请求URL
// @param HTTPMethod 请求方法GET/POST
// @param parameters 请求参数
// @param progressCallback 加载进度回调
// @param success 成功回调（queryURLString=完整请求URL, responseObject=NSDictionary）
// @param failure 失败回调（queryURLString=完整请求URL, error=错误描述去error.localizedDescription即可）
// */
//- (void)queryWithBaseURL:(NSString *)baseURL
//              HTTPMethod:(NSString *)HTTPMethod
//              parameters:(id)parameters
//        progressCallback:(void (^)(float aProgress))progressCallback
//                 success:(void (^)(NSString *queryURL, id responseObject))success
//                 failure:(void (^)(NSString *queryURL, NSError *error))failure;
//
//
///**
// HTTP请求基础方法-只支持GET、POST，且POST不支持文件、图片上传
//
// @param baseURL 请求URL
// @param HTTPMethod 请求方法GET/POST
// @param parameters 请求参数
// @param success 成功回调（queryURLString=完整请求URL, responseObject=NSDictionary）
// @param failure 失败回调（queryURLString=完整请求URL, error=错误描述去error.localizedDescription即可）
// */
//- (void)queryWithBaseURL:(NSString *)baseURL
//              HTTPMethod:(NSString *)HTTPMethod
//              parameters:(id)parameters
//                 success:(void (^)(NSString * queryURL, id responseObject))success
//                 failure:(void (^)(NSString * queryURL, NSError *error))failure;
@end



#pragma mark - NSError(HTTPRequest)
/* ------ HTTP请求-错误描述 ------ */
static NSString *const TCErrorResponse     = @"TCErrorResponse";///< 协议请求失败的数据
static NSString *const TCErrorDomain       = @"com.toucool.error.response";///< 错误标识码
static NSString *const TCUnkownError       = @"数据到外太空去了~";///< 未知错误
static NSString *const TCNoReachilityError = @"网络君情绪低落，去安抚一下吧~";///< 无网络提示
static NSString *const TCRequestParasError = @"请求参数错误~";///< 请求参数错误！
static NSString *const TCHTTPNoDataError   = @"获取失败~";///< 请求PHP成功，原因可能是：没有更多信息/参数错误/头信息错误
static NSString *const TCHTTPRespDataError = @"返回类型错误~";///< 返回类型错误
/**
 HTTP请求错误代码编号
 */
typedef enum : NSUInteger {
    TCErrorUnKnow = 9876,   ///< 错误code
    TCErrorNoReachility,    ///< 没有网络
    TCErrorRequestParas,    ///< 请求参数错误
    TCErrorHTTPNoData,      ///< 请求PHP成功，原因可能是：没有更多信息/参数错误/头信息错误
} TCErrorCode;

@interface NSError (Request)
/// 未知错误
+ (instancetype)UnknownError;

/// 没有网络
+ (instancetype)noReachilityError;

/// 没有更多信息/参数错误/HTTP头信息错误
+ (instancetype)noDataError;

/// 请求参数错误
+ (instancetype)requestParasError;

/// HTTP请求数据返回失败
+ (instancetype)errorWithResponseObject:(id)responseObject;

/**
 *  错误描述
 *
 *  @param code 错误代码
 *  @param desc 错误描述
 *
 *  @return NSError
 */
+ (instancetype)errorWithCode:(TCErrorCode)code desc:(NSString *)desc;
@end
