//
//  JsonFixtures.m
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "JsonFixtures.h"

@implementation JsonFixtures

+ (id)JSONFromLocalFileWithName:(NSString *)name {
  NSData *data = [[self class] dataWithContentsOfLocalFileWithName:name];

  NSError *error = nil;
  id JSON = [NSJSONSerialization JSONObjectWithData:data
                                            options:kNilOptions
                                              error:&error];

  if (error) {
    return nil;
  }

  return JSON;
}

+ (NSString *)contentsOfLocalFileWithName:(NSString *)name {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *filePath = [bundle pathForResource:name ofType:@"json"];

  return [NSString stringWithContentsOfFile:filePath
                                   encoding:NSUTF8StringEncoding
                                      error:nil];
}

+ (NSData *)dataWithContentsOfLocalFileWithName:(NSString *)name {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *filePath = [bundle pathForResource:name ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:filePath];

  return data;
}

@end
