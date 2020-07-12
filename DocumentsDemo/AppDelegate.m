//
//  AppDelegate.m
//  DocumentsDemo
//
//  Created by Han Mingjie on 2020/7/12.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}



- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
    
    //get permission for the file
    [url startAccessingSecurityScopedResource];
    
    //copy file to target
    NSString *target_file = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"swap.dat"];
    NSError *error = nil;
    BOOL success = [[NSFileManager defaultManager] copyItemAtURL:url toURL:[NSURL fileURLWithPath:target_file] error:&error];
    if (!success){
        NSLog(@"save file error.");
    }
    
    //close permission
    [url stopAccessingSecurityScopedResource];
    
    
    //TODO something for the file.
    return true;
}



@end
