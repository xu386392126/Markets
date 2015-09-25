//
//  HomeService.m
//  Market
//
//  Created by YAO on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "HomeService.h"

@implementation HomeService


- (void)homeList
{
    AFAppDotNetAPIClient *httpClient = [AFAppDotNetAPIClient sharedClient];
    httpClient.delegate = self;
    [httpClient postAsynchronous:[URLManage sharedManager].h_c_list parameter:nil];
}


- (void)httpRequestStarted:(AFAppDotNetAPIClient *)client
{
    if ([self.delgate respondsToSelector:@selector(requestHomeList)]) {
        
        [self.delgate requestHomeList];
    }
}

-(void)httpRequestFinished:(AFAppDotNetAPIClient *)client result:(NSDictionary *)dic
{
    if (dic.successful) {
        
        HomeListModel *model = [[HomeListModel alloc]initWithDictionary:dic.dictionaryForKey];
        
        if ([self.delgate respondsToSelector:@selector(requestHomeListFinishing:)]) {
            
            [self.delgate requestHomeListFinishing:model];
        }
        
    }else {
        
        if ([self.delgate respondsToSelector:@selector(requestHomeListFailed:)]) {
            
            [self.delgate requestHomeListFailed:dic.errorString];
        }
    }
}

-(void)httpRequestFailed:(AFAppDotNetAPIClient *)client didFailWithError:(NSError *)error
{
    
    if ([self.delgate respondsToSelector:@selector(requestHomeListFailed:)]) {
        
        [self.delgate requestHomeListFailed:error.description];
    }
    
}


@end
