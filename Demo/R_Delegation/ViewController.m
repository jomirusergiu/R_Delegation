//
//  ViewController.m
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

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set _myNotificationObserver through block instead of selector
    [[NSNotificationCenter defaultCenter] addObserverAtAddress:&_myNotificationObserver
                                                       forName:@"R_Notification"
                                                    usingBlock:^(NSNotification *note) {
                                                        [self recieveResponseFromNotificationWith:note];
                                                    }];
    // call send message methods
    [self sendMessageThroughNotification];
    [self sendMessageThroughDelegate];
}

- (void)dealloc{
    // remove _myNotificationObserver
    [[NSNotificationCenter defaultCenter] removeObserverAtAddress:&_myNotificationObserver];
}

- (void)sendMessageThroughDelegate{
    
    // alloc R_Delegate
    R_Delegate *r_Delegate = [R_Delegate new];
    
    // assign delegate
    r_Delegate.delegate = self;
    
    // sending message to delegate
    [r_Delegate sendMessageTo_R_Delegate];
}

- (void)recieveResponseFromDelegateWithObject:(NSString *)delegateName{
    // controller recieved response from delegate
    NSLog(@"Recieved response in controller from %@", delegateName);
}

- (void)sendMessageThroughNotification{
    
    // alloc R_Delegate
    R_Notification *r_Notification = [R_Notification new];
    
    // sending message to notification
    [r_Notification sendMessageTo_R_Notification];
}

- (void)recieveResponseFromNotificationWith:(NSNotification *)note{
    // controller recieved response from notification
    NSLog(@"Received response in controller from %@", [note name]);
}

@end
