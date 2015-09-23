//
//  OHHTTPStubs+Helper.m
//  Contacts
//
//  Created by Roi Sagiv on 9/23/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "OHHTTPStubs+Helper.h"
#import <AFNetworking/AFNetworking.h>

@implementation OHHTTPStubs (Helper)

+ (void)stubJSONResponseAtPath:(NSString *)path withResponse:(id)response {
  [OHHTTPStubs stubJSONResponseAtPath:path
                         withResponse:response
                        andStatusCode:200];
}

+ (void)stubJSONResponseAtPath:(NSString *)path
                  withResponse:(id)response
                 andStatusCode:(NSInteger)code;
{
  [OHHTTPStubs stubJSONResponseAtPath:path
                           withParams:nil
                         withResponse:response
                        andStatusCode:code];
}

+ (void)stubJSONResponseAtPath:(NSString *)path
                    withParams:(NSDictionary *)params
                  withResponse:(id)response {
  [OHHTTPStubs stubJSONResponseAtPath:path
                           withParams:params
                         withResponse:response
                        andStatusCode:200];
}

+ (void)stubJSONResponseAtPath:(NSString *)path
                    withParams:(NSDictionary *)params
                  withResponse:(id)response
                 andStatusCode:(NSInteger)code {
  [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
    NSURLComponents *requestComponents =
        [NSURLComponents componentsWithURL:request.URL
                   resolvingAgainstBaseURL:NO];
    NSString *urlString = path;

    // Append the params dict as a query string
    if (params) {
      AFHTTPRequestSerializer *serializer =
          [[AFHTTPRequestSerializer alloc] init];
      NSURLRequest *request = [serializer requestWithMethod:@"GET"
                                                  URLString:urlString
                                                 parameters:params
                                                      error:nil];
      urlString = [urlString stringByAppendingFormat:@"?%@", request.URL.query];
    }

    NSURL *stubbedURL = [NSURL URLWithString:urlString];
    NSURLComponents *stubbedComponents =
        [NSURLComponents componentsWithURL:stubbedURL
                   resolvingAgainstBaseURL:NO];

    BOOL pathsMatch =
        [requestComponents.path isEqualToString:stubbedComponents.path];
    BOOL queriesMatch =
        params
            ? [requestComponents.query isEqualToString:stubbedComponents.query]
            : YES;
    return (pathsMatch && queriesMatch);

  } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
    NSData *data =
        [NSJSONSerialization dataWithJSONObject:response options:0 error:nil];
    return [OHHTTPStubsResponse responseWithData:data
                                      statusCode:(int)code
                                         headers:@{
                                           @"Content-Type" : @"application/json"
                                         }];
  }];
}
@end
