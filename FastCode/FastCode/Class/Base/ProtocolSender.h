//
//  ProtocolSender.h
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseProtocol;
@interface ProtocolSender : NSObject

+ (NSURLSessionDataTask *)sendProtocol:(BaseProtocol*)protocol
                                result:(void (^)(BOOL isSuccess, NSError *error))result;


@end
