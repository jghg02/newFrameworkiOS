//
//  Utils.m
//  FutureFramework
//
//  Created by Josue Hernandez on 5/19/15.
//  Copyright (c) 2015 Josue Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>
#import "Utils.h"

@implementation Utils : NSObject 


//Add Constraint into View
+(void)fillContainerView:(UIView *)container WithView:(UIView *)view {
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:container
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f constant:0.0f];
    
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:view
                                                                       attribute:NSLayoutAttributeLeading
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:container
                                                                       attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0f constant:0.0f];
    
    
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:view
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:container
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0f constant:0.0f];
    
    
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:view
                                                                      attribute:NSLayoutAttributeTrailing
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:container
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0f constant:0.0f];
    
    
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [container addSubview:view];
    
    [container addConstraint:constraintTop];
    [container addConstraint:constraintRight];
    [container addConstraint:constraintBottom];
    [container addConstraint:constraintLeft];
}


//Getting all constraint of View - This methos return NSMutableArray
+(NSMutableArray *) getFillContainerView:(UIView *)container WithView:(UIView *)view {
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:container
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f constant:0.0f];
    
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:view
                                                                       attribute:NSLayoutAttributeLeading
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:container
                                                                       attribute:NSLayoutAttributeLeading
                                                                      multiplier:1.0f constant:0.0f];
    
    
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:view
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:container
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0f constant:0.0f];
    
    
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:view
                                                                      attribute:NSLayoutAttributeTrailing
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:container
                                                                      attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0f constant:0.0f];
    
    
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [container addSubview:view];
    
    [container addConstraint:constraintTop];
    [container addConstraint:constraintRight];
    [container addConstraint:constraintBottom];
    [container addConstraint:constraintLeft];
    
    NSMutableArray *allConstraints = [[NSMutableArray alloc] init];
    [allConstraints addObject:constraintRight];//Leading
    [allConstraints addObject:constraintLeft];//Trailling
    [allConstraints addObject:constraintTop];
    [allConstraints addObject:constraintBottom];
    
    return allConstraints;
}



@end