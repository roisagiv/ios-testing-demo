//
//  OHHTTPStubs+Helper.h
//  Contacts
//
//  Created by Roi Sagiv on 9/23/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <OHHTTPStubs/OHHTTPStubs.h>

/*!
 *  Code taken from the wonderful Artsy Eigen open sourced application
 */
@interface OHHTTPStubs (Helper)

/// Stubs a path and returns a dictionary as it's json representation with a 200
/// status code
+ (void)stubJSONResponseAtPath:(NSString *)path withResponse:(id)response;

/// Stubs a path and returns a dictionary as it's json representation with a
/// custom status code
+ (void)stubJSONResponseAtPath:(NSString *)path
                  withResponse:(id)response
                 andStatusCode:(NSInteger)code;

/// Stubs a path, looking for specific params and returns a dictionary as it's
/// json representation with a status code of 200
+ (void)stubJSONResponseAtPath:(NSString *)path
                    withParams:(NSDictionary *)params
                  withResponse:(id)response;

/// Stubs a path, looking for specific params and returns a dictionary as it's
/// json representation with a custom status code
+ (void)stubJSONResponseAtPath:(NSString *)path
                    withParams:(NSDictionary *)params
                  withResponse:(id)response
                 andStatusCode:(NSInteger)code;

@end
