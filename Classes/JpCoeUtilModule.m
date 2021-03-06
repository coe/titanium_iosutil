/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import <LocalAuthentication/LocalAuthentication.h>

#import "JpCoeUtilModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation JpCoeUtilModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"d70654b5-e155-4490-8e30-230267a2d531";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"jp.coe.util";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);

}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(NSArray*)getFontList:(id)args
{
//    NSArray *array = [UIFont familyNames];
//    int count = [array count];
//    for (int i = 0; i < count; i++) {
//        NSLog(@"%@", [UIFont fontNamesForFamilyName:[array objectAtIndex:i]]);
//    }
    return [UIFont familyNames];
    
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(NSNumber*)getToolbarHeight:(id)args{
    UIToolbar *toolbar = [UIToolbar new];
    [toolbar sizeToFit];
    CGRect frame = toolbar.frame;
    [toolbar release];
    return NUMDOUBLE(frame.size.height);
}

/*
 タッチIDが使えるかどうか
 */
-(NSNumber*)isTouchID:(id)args{
    LAContext *myContext = [[[LAContext alloc] init] autorelease];
    NSError *authError = nil;
    
    return NUMBOOL([UIViewController instancesRespondToSelector:@selector(showDetailViewController:sender:)] && [myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]
                   );
}


@end
