//
//  AppDelegate+MOC.h
//  Photomania
//
//  Created by 张忠瑞 on 2017/8/17.
//  Copyright © 2017年 张忠瑞. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (MOC)

- (void)saveContext:(NSManagedObjectContext*)managedObjectContext;

- (NSManagedObjectContext *)createMainQueueManagedObjectContext;



@end
