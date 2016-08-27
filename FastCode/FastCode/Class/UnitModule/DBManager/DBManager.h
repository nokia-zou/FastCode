//
//  DBManager.h
//  FastCode
//
//  Created by LP on 16/8/27.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBTable.h"

@interface DBManager : NSObject

+ (DBTable *)tableWithName:(NSString *)name;

@end
