//
//  Helpers.m
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers



#pragma mark getting Main Thread..and background thread..
+(void)RunOnMainThread:(void (^)(void))block
{
    //Check Recieved Block Of Code whether they are running on main thread or not .if Not then Forcefully make run them on main thread
    if ([NSThread isMainThread]) {
        block();
    }else{
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}
+(void)RunOnBackgroundThread:(void (^)(void))block
{
    if ([NSThread currentThread].isMainThread)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),block);
    }
}

@end
