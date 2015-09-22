//
//  JsonFixtures.h
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonFixtures : NSObject

+ (id)JSONFromLocalFileWithName:(NSString *)name;

+ (NSString *)contentsOfLocalFileWithName:(NSString *)name;

+ (NSData *)dataWithContentsOfLocalFileWithName:(NSString *)name;

@end
