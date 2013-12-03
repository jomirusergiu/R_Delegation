//
//  R_Delegate.m
//  R_Delegation
//
//  Created by RocKK on 12/3/13.
//  Copyright (c) 2013 RocKK.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms are permitted
//  provided that the above copyright notice and this paragraph are
//  duplicated in all such forms and that any documentation,
//  advertising materials, and other materials related to such
//  distribution and use acknowledge that the software was developed
//  by the RocKK.  The name of the
//  RocKK may not be used to endorse or promote products derived
//  from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import "R_Delegate.h"

@implementation R_Delegate

-(void)sendMessageTo_R_Delegate{
    // delegate method was called from controller
    NSLog(@"Message sent from controller to R_Delegate");
    
    //set GCD delay block with 2 seconds
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //send response to controller
            [_delegate recieveResponseFromDelegateWithObject:@"R_Delegate"];
    });
}

-(void)dealloc
{
    // set the delegate to nil
    _delegate = nil;
}

@end
