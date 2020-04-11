
// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

#define kAppName @"WUBATongCheng"


%hook PodWBCloudReflectionFaceVerify_AFHTTPSessionManager

+ (id)manager{
    %log;
    return %orig;
}


- (NSURLSessionDataTask *)POST:(NSString *)URLString
parameters:(id)parameters
progress:(void (^)(NSProgress *))uploadProgress
success:(void (^)(NSURLSessionDataTask *, id))success
failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{

    void (^my_success)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject){

        NSMutableString *myResult = [[NSMutableString alloc] init];
        if (URLString) {
            [myResult appendString:URLString];
            [myResult appendString:@"\n\n"];
        }

        [myResult appendString:@"POST"];
        [myResult appendString:@"\n\n"];

        NSError *parseError = nil;
        if(parameters){
            NSMutableString *strParamsForm = [NSMutableString new];
            NSMutableArray *paramsList = [NSMutableArray new];
            [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSString *str1 = [NSString stringWithFormat:@"%@=%@&",key,obj];
                [strParamsForm appendString:str1];

                NSString *str2 = [NSString stringWithFormat:@"%@: %@",key,obj];
                [paramsList addObject:str2];
            }];
            NSString *strList = [paramsList componentsJoinedByString:@"\n"];

            if (strParamsForm.length > 1) {
                NSString *aString = [strParamsForm substringToIndex:strParamsForm.length - 1];
                [myResult appendString:aString];
            } else {
                [myResult appendString:strParamsForm];
            }

            [myResult appendString:@"\n\n"];

            [myResult appendString:strList];
            [myResult appendString:@"\n\n"];


            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&parseError];
            if (!parseError) {
                NSString *jsonParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                [myResult appendString:jsonParams];
            }
            [myResult appendString:@"\n\n"];
        }


        if(responseObject){
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&parseError];
            if (!parseError) {
                NSString *jsonResponse = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                [myResult appendString:jsonResponse];
            }
        }
        NSURL *url = [[NSURL alloc] initWithString:URLString];
        NSString *path = [url path];
        path = [path stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
        double timeInterval  = [NSDate timeIntervalSinceReferenceDate];
        NSString *file = [NSString stringWithFormat:@"/var/mobile/%@_API_POST_%@_%f.txt", kAppName, path, timeInterval];
        [myResult writeToFile:file atomically:NO encoding:4 error:NULL];

        success(task, responseObject);
    };

    return %orig(URLString, parameters, uploadProgress, my_success, failure);

}



- (NSURLSessionDataTask *)GET:(NSString *)URLString
parameters:(id)parameters
progress:(id)downloadProgress
success:(void (^)(NSURLSessionDataTask *, id))success
failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{

    void (^my_success)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject){

        NSMutableString *myResult = [[NSMutableString alloc] init];
        if (URLString) {
            [myResult appendString:URLString];
            [myResult appendString:@"\n\n"];
        }

        [myResult appendString:@"GET"];
        [myResult appendString:@"\n\n"];

        NSError *parseError = nil;
        if(parameters){

            NSMutableString *strParamsForm = [NSMutableString new];
            NSMutableArray *paramsList = [NSMutableArray new];
            [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSString *str1 = [NSString stringWithFormat:@"%@=%@&",key,obj];
                NSString *str2 = [NSString stringWithFormat:@"%@: %@",key,obj];
                [strParamsForm appendString:str1];
                [paramsList addObject:str2];
            }];
            NSString *strList = [paramsList componentsJoinedByString:@"\n"];


            if (strParamsForm.length > 1) {
                NSString *aString = [strParamsForm substringToIndex:strParamsForm.length - 1];
                [myResult appendString:aString];
            } else {
                [myResult appendString:strParamsForm];
            }

            [myResult appendString:@"\n\n"];

            [myResult appendString:strList];
            [myResult appendString:@"\n\n"];

            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&parseError];
            if (!parseError) {
                NSString *jsonParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                [myResult appendString:jsonParams];
            }
            [myResult appendString:@"\n\n"];
        }



        if(responseObject){
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&parseError];
            if (!parseError) {
                NSString *jsonResponse = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                [myResult appendString:jsonResponse];
            }
        }

        NSURL *url = [[NSURL alloc] initWithString:URLString];
        NSString *path = [url path];
        path = [path stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

        double timeInterval  = [NSDate timeIntervalSinceReferenceDate];
        NSString *file = [NSString stringWithFormat:@"/var/mobile/%@_API_GET_%@_%f.txt", kAppName, path, timeInterval];
        [myResult writeToFile:file atomically:NO encoding:4 error:NULL];

        success(task, responseObject);
    };

    return %orig(URLString, parameters, downloadProgress, my_success, failure);
}

%end
