//
//  BaseModel.m
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


#pragma mark - NSCoding

-(id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.ID = [coder decodeObjectForKey:@"id"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.ID forKey:@"id"];
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    BaseModel *result = [[[self class] allocWithZone:zone] init];
    result.ID = self.ID;

    return result;
}

@end
