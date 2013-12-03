R_Delegation
=================

R_Delegation is a small example project of using Delegates & Notifications.
These are two ways to pass messages between objects. The main difference:
- With delegates, one designated object receives a message. Also Delegates are usually implemented using protocols.
- With notifications any number of objects can receive notifications when they are posted.

Also, because i like using blocks instead of selectors when setting up notifications, i created a small category for making it a bit more elegant and clean.

Usage for delegates
=============

ViewController.h
-------------
```Objective-C
//assign R_DelegateProtocol to controller
@interface ViewController : UIViewController <R_DelegateProtocol>
```

ViewController.m
-------------
```Objective-C
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //call send message method
    [self sendMessageThroughDelegate];
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
```

Usage for notifications
=============

ViewController.h
-------------
```Objective-C
#import "R_BlockNotifications.h"
#import "R_Notification.h"

@interface ViewController : UIViewController{
    //create notification observer id
    id _myNotificationObserver;
}
```

ViewController.m
-------------
```Objective-C
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
    // call send message method
    [self sendMessageThroughNotification];
}

- (void)dealloc{
    // remove _myNotificationObserver
    [[NSNotificationCenter defaultCenter] removeObserverAtAddress:&_myNotificationObserver];
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
```

License
--------

This code is under the BSD license.
