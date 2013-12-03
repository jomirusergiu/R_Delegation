//
//  R_BlockNotifications.h
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

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (R_BlockNotifications)

// Adding Observer with name, object and queue
- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                      object:(id)object
                       queue:(NSOperationQueue *)queue
                  usingBlock:(void (^)(NSNotification *note))block;

// Adding Observer with name and object
- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                      object:(id)object
                  usingBlock:(void (^)(NSNotification *note))block;

// Adding Observer with name, and queue
- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                       queue:(NSOperationQueue *)queue
                  usingBlock:(void (^)(NSNotification *note))block;

// Adding Observer with name
- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                  usingBlock:(void (^)(NSNotification *note))block;

// Removing Observers
- (void)removeObserverAtAddress:(id __strong *)observerAddress;

@end