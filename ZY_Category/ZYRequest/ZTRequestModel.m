//
//  ZTRequestModel.m
//  ZTRequest
//
//  Created by mygame on 15/9/28.
//  Copyright © 2015年 youwoxing. All rights reserved.
//

#import "ZTRequestModel.h"
//#import "TCManager+AppInfo.h"
//#import <BFKit/BFCryptor.h>
//#import "AppDelegate.h"
//#import "TCNavigationVC.h"

#if DEBUG
static NSString *const PYTHONROOTURL = @"http://safetest.tou-cool.com:8080/"; /// 测试服url
#else
static NSString *const PYTHONROOTURL = @"http://studentsafe.tou-cool.com:8080/"; /// 正式服url
#endif

/* HTTP Header */
static NSString *const kHTTPHeaderToken     = @"token";///< 登入 token

@interface NSObject (AFRequestURL)
- (NSString *)requestURLString;
@end

@implementation NSObject (AFRequestURL)

- (NSString *)requestURLString {
    // 本来是写NSURLSessionTask的category，但是iOS7会莫名的crash，因此暂时改成成NSObject的category
    return [(NSURLSessionTask *)self originalRequest] ? [(NSURLSessionTask *)self originalRequest].URL.absoluteString : [(NSURLSessionTask *)self currentRequest].URL.absoluteString;
}

@end


@implementation ZTRequestModel
//{
//    AFHTTPSessionManager *_manager;
//}
//
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self configManager];
//    }
//    return self;
//}
//
//- (void)dealloc
//{
//    NSLog(@"%@-%s", NSStringFromClass([self class]),  __PRETTY_FUNCTION__);
//}
//
//#pragma mark - HTTP 请求方法
//
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
//                 failure:(void (^)(NSString *queryURL, NSError *error))failure {
//    // 判断是否为空
//    if (self.manager == nil) {
////        if (extendBody) {
////            [self form_configManager];
////        }
////        else {
//            [self configManager];
////        }
//    }
//
////    // 网络判断
////    if (kTCReachabilityStatus == TCReachabilityWWANStatusNone) {
////        TCMain_async_safe2(failure, nil, [NSError noReachilityError]);
////        return;
////    }
//
//    // 网络请求
//    if (extendBody) { // 表单形式-文件上传
//
//        [self.manager POST:baseURL
//                parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//                    // 上传文件
//                    NSDictionary *postBody = extendBody;
//                    if (postBody.count) {
//                        NSString *exten = @"jpg";
//                        NSArray *names = postBody[TCPostNameKey];
//                        NSString *type = postBody[TCPostFileTypeKey];
//                        for (NSInteger i = 0; i < names.count; i++) {
//                            id body = [postBody[TCPostFileKey] safeObjectAtIndex:i];
//                            if (!body) {
//                                continue;
//                            }
//                            NSData *bodyData = nil;
//                            if ([type isEqualToString:TCPostFileTypeImageKey]) {
//                                if ([body isKindOfClass:[UIImage class]]) {
//                                    bodyData = UIImageJPEGRepresentation(body, 1);
//                                }
//                                else if ([body isKindOfClass:[NSData class]]){
//                                    bodyData = body;
//                                }
//                                else {
//                                    NSLog(@"图片数据类型错误 body=%@", body);
//                                }
//                                NSLog(@"上传图片");
//                            }
//                            else if ([type isEqualToString:TCPostFileTypeAudioKey]) {
//                                NSLog(@"上传音频");
//                                exten = @"m4a";
//                                bodyData = body;
//                            }
//                            else if ([type isEqualToString:TCPostFileTypeVideoKey]) {
//                                NSLog(@"上传视频");
//                                exten = @"mp4";
//                                bodyData = body;
//                            }
//                            else if ([type isEqualToString:TCPostFileTypeDocumentKey]) {
//                                NSLog(@"上传文档");
//                                exten = @"zip";
//                                bodyData = body;
//                            }
//                            [formData appendPartWithFileData:bodyData
//                                                        name:names[i]
//                                                    fileName:TCFormatStr(@"%@_%@_%lld.%@", ShareUserInfo.mobile, names[i],(uint64_t)([[NSDate date] timeIntervalSince1970] * 1000), exten)
//                                                    mimeType:type];
//                        }
//                    }
//                }
//                  progress:downloadProgress
//                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                       TCSafeCallblock2(success, [task requestURLString], responseObject);
//
//                       // 权限、服务器检测
//                       [ZTRequestModel checkResponseObject:responseObject];
//                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                       TCSafeCallblock2(failure, [task requestURLString], error);
//                   }];
//#ifdef DEBUG
//        NSMutableString *str = [NSMutableString string];
//        if ([parameters isKindOfClass:[NSDictionary class]]) {
//            NSArray *keys = [parameters allKeys];
//            for (NSUInteger i = 0; i < keys.count; i++) {
//                NSString *key = keys[i];
//                [str appendString:i == 0 ? @"?" : @"&"];
//                [str appendFormat:@"%@=%@", key, parameters[key]];
//            }
//        }
//        NSLog(@"POST-Form-Request-Url=%@%@", [self requestUrl], str);
//#endif
//    }
//    else {
//
//        if ([HTTPMethod isEqualToString:TCGET]) { // get请求
//
//            [self.manager GET:baseURL parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                TCSafeCallblock2(success, [task requestURLString], responseObject);
//
//                // 权限、服务器检测
//                [ZTRequestModel checkResponseObject:responseObject];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                TCSafeCallblock2(failure, [task requestURLString], error);
//            }];
//            NSLog(@"GET-Request-Url=%@", [self requestUrl]);
//
//        }
//        else {  // 非Form形式的POST请求
//
//            [self.manager POST:baseURL parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                TCSafeCallblock2(success, [task requestURLString], responseObject);
//
//                // 权限、服务器检测
//                [ZTRequestModel checkResponseObject:responseObject];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                TCSafeCallblock2(failure, [task requestURLString], error);
//            }];
//#ifdef DEBUG
//            NSMutableString *str = [NSMutableString string];
//            if ([parameters isKindOfClass:[NSDictionary class]]) {
//                NSArray *keys = [parameters allKeys];
//                for (NSUInteger i = 0; i < keys.count; i++) {
//                    NSString *key = keys[i];
//                    [str appendString:i == 0 ? @"?" : @"&"];
//                    [str appendFormat:@"%@=%@", key, parameters[key]];
//                }
//            }
//            NSLog(@"POST-Request-Url=%@%@", [self requestUrl], str);
//#endif
//        }
//    }
//
//}
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
//                 failure:(void (^)(NSString *queryURL, NSError *error))failure {
//    [self queryWithBaseURL:baseURL HTTPMethod:HTTPMethod parameters:parameters extendBody:nil progress:downloadProgress success:success failure:failure];
//}
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
//                 success:(void (^)(NSString *queryURLString, id responseObject))success
//                 failure:(void (^)(NSString *queryURLString, NSError *error))failure {
//
//    [self queryWithBaseURL:baseURL HTTPMethod:HTTPMethod parameters:parameters extendBody:nil progress:^(NSProgress *downloadProgress) {
//        if (progressCallback) {
//            progressCallback(downloadProgress.completedUnitCount/((double)(downloadProgress.totalUnitCount)));
//        }
//    } success:success failure:failure];
//}
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
//                 failure:(void (^)(NSString * queryURL, NSError *error))failure {
//    [self queryWithBaseURL:baseURL HTTPMethod:HTTPMethod parameters:parameters progress:nil success:success failure:failure];
//}
//
//#pragma mark - utils
///**
// *  请求异常处理（包括：服务器维护，鉴权失败，该用户已经被拉黑）
// *
// *  @param responseObject 错误 HTTP 请求结果
// */
//+ (void)checkResponseObject:(id)responseObject {
//    NSDictionary *resp = responseObject;
//    if ([responseObject isKindOfClass:[NSData class]]) {
//        NSString *respString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        resp = [respString containerDataFromString];
//    }
//
//    TCCHECK([resp isKindOfClass:[NSDictionary class]]);
//
//    // 服务异常处理-显示登入界面
//    if ([resp[TCResponseCode] integerValue] == TCCODE_FAIL_SIGN_VERIFY_FAIL) {
//        NSString *msg = responseObject[TCResponseMsg];
//        TCShowHint(msg ? msg : @"token错误或失效");
//        [kTCRootVC tc_showLoginVC];
//    }
//}
//
//#pragma mark - getter
///// 请求URLString的MD5
//- (NSString *)requestMD5Url {
//    return [self requestUrl] ? [BFCryptor MD5:[self requestUrl]] : nil;
//}
//
///// 请求URLString
//- (NSString *)requestUrl {
//    if (self.manager.tasks.count == 0) {
//        return nil;
//    }
//
//    return [(NSURLSessionTask *)[self.manager.dataTasks lastObject] requestURLString];
//}
//
//- (AFHTTPSessionManager *)manager {
//    return _manager;
//}
//
///// 协议PHP服务 Common BaseUrl
//- (NSString *)protocolCommonBaseUrl {
//    return [PYTHONROOTURL stringByAppendingString:ShareManager.commonPathUrl];
//}
//
///// 协议PHP服务BaseUrl
//- (NSString *)protocolBaseUrl {
//    return [PYTHONROOTURL stringByAppendingString:ShareManager.basePathUrl];
//}
//
///// 协议PHP服务BaseUrl
//+ (NSString *)getProtocolBaseUrl {
//    return [PYTHONROOTURL stringByAppendingString:ShareManager.basePathUrl];
//}
//
//#pragma mark - setter
//- (NSArray<NSString *> *)tc_acceptableContentTypes {
//    return @[@"application/x-www-form-urlencoded", @"application/json", @"text/json", @"text/javascript", @"text/plain", @"audio/x-wav", @"text/html"];
//}
//
//- (void)form_configManager {
//    _manager = [AFHTTPSessionManager manager];
//    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    _manager.requestSerializer.timeoutInterval         = TCHTTPTimeout;
//    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:[self tc_acceptableContentTypes]];
//    [self setHTTPReqHeaderParas:nil];
//}
//
//- (void)configManager {
//    _manager = [AFHTTPSessionManager manager];
//    _manager.requestSerializer.timeoutInterval         = TCHTTPTimeout;
//    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:[self tc_acceptableContentTypes]];
//    [self setHTTPReqHeaderParas:nil];
//}
//
///**
// *  设置HTTP请求头
// *
// *  @param paras header 信息
// */
//- (void)setHTTPReqHeaderParas:(NSDictionary *)paras {
//    if (paras == nil) {
//        if (ShareUserInfo.loginToken.length) {
//            NSLog(@"ShareUserInfo.loginToken=%@", ShareUserInfo.loginToken);
//
//            [_manager.requestSerializer setValue:ShareUserInfo.loginToken forHTTPHeaderField:kHTTPHeaderToken];
//        }
//    }
//    else {
//        for (NSString *key in [paras allKeys]) {
//            [_manager.requestSerializer setValue:paras[key] forHTTPHeaderField:key];
//        }
//    }
//}
//
///// 取消http请求
//- (void)cancelRequest
//{
//    [self.manager.operationQueue cancelAllOperations];
//}
@end



#pragma mark - NSError(HTTPRequest)
@implementation NSError (Request)
/**
 *  错误描述
 *
 *  @param code     错误代码
 *  @param respDict 返回数据
 *
 *  @return NSError
 */
+ (instancetype)errorWithCode:(TCErrorCode)code respDict:(NSDictionary *)respDict {
    return [self errorWithCode:code desc:respDict[@"msg"] ?: TCUnkownError];
}

/**
 *  错误描述
 *
 *  @param code 错误代码
 *  @param desc 错误描述
 *
 *  @return NSError
 */
+ (instancetype)errorWithCode:(TCErrorCode)code desc:(NSString *)desc {
    return [self errorWithCode:code desc:desc errorResponse:@""];
}

/**
 *  错误描述
 *
 *  @param code        错误代码
 *  @param desc        错误描述
 *  @param errorResponse 请求失败code!=1时返回的数据
 *
 *  @return NSError
 */
+ (instancetype)errorWithCode:(TCErrorCode)code desc:(NSString *)desc errorResponse:(id)errorResponse {
    return [[NSError alloc] initWithDomain:TCErrorDomain
                                      code:code
                                  userInfo:@{NSLocalizedDescriptionKey : (desc ? desc : TCUnkownError),
                                             TCErrorResponse : errorResponse ? errorResponse : @"toucool unexpected error!"}];
}

/**
 *  错误描述
 *
 *  @param code 错误代码
 *
 *  @return NSError
 */
+ (instancetype)errorWithCode:(TCErrorCode)code {
    NSError *error = nil;
    switch (code) {
        case TCErrorUnKnow:
            error = [NSError errorWithCode:code desc:TCUnkownError];
            break;
        case TCErrorHTTPNoData:
            error = [NSError errorWithCode:code desc:TCHTTPNoDataError];
            break;
        case TCErrorNoReachility:
            error = [NSError errorWithCode:code desc:TCNoReachilityError];
            break;
        case TCErrorRequestParas:
            error = [NSError errorWithCode:code desc:TCRequestParasError];
            break;
        default:
            error = [NSError errorWithCode:code desc:TCUnkownError];
            break;
    }
    return error;
}

/// 未知错误
+ (instancetype)UnknownError {
    return [self errorWithCode:TCErrorUnKnow];
}

/// 没有网络
+ (instancetype)noReachilityError {
    return [self errorWithCode:TCErrorNoReachility];
}

/// 没有更多信息/参数错误/HTTP头信息错误
+ (instancetype)noDataError {
    return [self errorWithCode:TCErrorHTTPNoData];
}

/// 请求参数错误
+ (instancetype)requestParasError {
    return [self errorWithCode:TCErrorRequestParas];
}

/// HTTP请求数据返回失败
+ (instancetype)errorWithResponseObject:(id)responseObject {
    if (responseObject == nil || ![responseObject isKindOfClass:[NSDictionary class]]) {
        return [[NSError alloc] initWithDomain:TCErrorDomain code:TCErrorHTTPNoData userInfo:@{NSLocalizedDescriptionKey:TCHTTPRespDataError}];
    }
    
    return [NSError errorWithCode:TCErrorHTTPNoData desc:responseObject[@"msg"] errorResponse:responseObject];
}
@end
