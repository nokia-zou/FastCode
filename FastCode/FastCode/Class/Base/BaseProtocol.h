//
//  BaseProtocol.h
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseProtocol : NSObject

/**
 *  method
 */
@property (nonatomic, strong, readonly) NSString *httpMethod;

/**
 *  host
 */
@property (nonatomic, strong, readonly) NSString *httpPath;

/**
 *  Parameters dic
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *httpParameters;

/**
 *  session
 */
@property (nonatomic, strong, readonly) NSURLSessionDataTask *URLSessionDataTask;

/**
 *  is cancelled
 */
@property(nonatomic, assign, readonly) BOOL isCancelled;

/**
 *  result data
 */
@property(nonatomic, strong, readonly) id resultObject;

/**
 *  init
 *
 *  @param httpPath path
 *
 *  @return BaseProtocol
 */
- (id)initWithHttpPath:(NSString *)httpPath;

/**
 *  parse data
 *
 *  @param result 返回的数据
 *
 *  @return is success
 */
- (BOOL)parse:(id)result;

@end
