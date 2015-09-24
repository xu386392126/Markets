//
//  AFAppDotNetAPIClient.m
//  LiHai
//
//  Created by YAO on 15/4/15.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"
#import "URLManage.h"


@implementation AFAppDotNetAPIClient
+ (instancetype)sharedClient {
    
    AFAppDotNetAPIClient *_sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:[URLManage sharedManager].baseUrl]];
    return _sharedClient;
}

+ (instancetype)postSharedClient
{
    AFAppDotNetAPIClient *_sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL2:[NSURL URLWithString:[URLManage sharedManager].baseUrl]];
    return _sharedClient;
}

- (instancetype)initWithBaseURL2:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        
        //self.responseSerializer = [AFJSONResponseSerializer serializer];
        //self.requestSerializer = [AFJSONRequestSerializer serializer];
        //self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-www-form-urlencoded"];
 
    }
    
    return self;
}


- (void)getAsynchronous:(NSString *)path parameter:(NSDictionary *)dic
{
    NSMutableString *parmastring = [NSMutableString string];
    NSArray *allkeys = [dic allKeys];
    for (int i=0; i < [dic count]; i++) {
        
        NSString *key = [allkeys objectAtIndex:i];
        NSString *value = [dic objectForKey:key];
        
        [parmastring appendFormat:@"%@=%@",key,value];
        
        if (i < dic.count - 1) {
            
            [parmastring appendString:@"&"];
        }
    }
    
    NSString *URLString = [NSString stringWithFormat:@"%@?%@%@%@",[URLManage sharedManager].baseUrl,path,parmastring,@"&ostype=2&time=1426960568&tokenid=654321&token=009215c08b7bf168c2ac78fdfb8abc9d"];

    //NSLog(@"%@",URLString);
    
    [self GET:URLString parameters:nil success:^(AFHTTPRequestOperation *operation , id responseObject) {
        
       // NSLog(@"=========1:%@",responseObject);
        NSDictionary *dict = (NSDictionary *)responseObject;
        
        if (dict && ![dict isEqual:[NSNull null]]) {
           // NSLog(@"%@",self.delegate);
            if ([self.delegate respondsToSelector:@selector(httpRequestFinished:result:)]) {
                
                [self.delegate httpRequestFinished:self result:dict];
            }
        }
        
    }failure:^(AFHTTPRequestOperation *operation , NSError *error) {
        
        
        if ([self.delegate respondsToSelector:@selector(httpRequestFailed:didFailWithError:)]) {
            
            [self.delegate httpRequestFailed:self didFailWithError:error];
        }
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(httpRequestStarted:)]) {
        
        [self.delegate httpRequestStarted:self];
    }
}


- (void)postAsynchronous:(NSString *)path parameter:(id)dic
{
   /* UIImage * testing = [UIImage imageNamed:@"ico_myCollect"];
    NSData * imageData = UIImagePNGRepresentation(testing);
    
    
    [self POST:@"" parameters:nil constructingBodyWithBlock:^(id <AFMultipartFormData> formData) {
        
        
        [formData appendPartWithFileData:imageData name:@"image" fileName:@"image.png" mimeType:@"image/png"];
        
        
        
        
        
    }success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    */
    
    [self POST:path parameters:dic success:^(AFHTTPRequestOperation *operation , id responseObject) {
        
        NSDictionary *dict = (NSDictionary *)responseObject;
        
        if (dict && ![dict isEqual:[NSNull null]]) {
            
            if ([self.delegate respondsToSelector:@selector(httpRequestFinished:result:)]) {
                
                [self.delegate httpRequestFinished:self result:dict];
            }
        }
        
    }failure:^(AFHTTPRequestOperation *operation , NSError *error) {
        
        
        if ([self.delegate respondsToSelector:@selector(httpRequestFailed:didFailWithError:)]) {
            
            [self.delegate httpRequestFailed:self didFailWithError:error];
        }
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(httpRequestStarted:)]) {
        
        [self.delegate httpRequestStarted:self];
    }
}

@end
