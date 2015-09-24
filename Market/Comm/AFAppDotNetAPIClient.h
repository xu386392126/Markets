//
//  AFAppDotNetAPIClient.h
//  LiHai
//
//  Created by YAO on 15/4/15.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@protocol AFDelegate;

@interface AFAppDotNetAPIClient : AFHTTPRequestOperationManager

@property (nonatomic, weak) id <AFDelegate> delegate;


+ (instancetype)sharedClient;
+ (instancetype)postSharedClient;
//- (instancetype)initWithBaseURL:(NSURL *)url;

- (void)getAsynchronous:(NSString *)path parameter:(NSDictionary *)dic;

- (void)postAsynchronous:(NSString *)path parameter:(id)dic;

@end


@protocol AFDelegate <NSObject>

@optional
- (void)httpRequestStarted:(AFAppDotNetAPIClient *)client;
-(void)httpRequestFinished:(AFAppDotNetAPIClient *)client result:(NSDictionary *)dic;
-(void)httpRequestFailed:(AFAppDotNetAPIClient *)client didFailWithError:(NSError *)error;

@end