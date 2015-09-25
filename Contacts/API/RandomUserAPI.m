//
//  RandomUserAPI.m
//  Contacts
//
//  Created by Roi Sagiv on 9/23/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "RandomUserAPI.h"
#import <AFNetworking/AFNetworking.h>

@implementation RandomUserAPI

- (void)getUsers:(void (^)(NSArray<Contact *> *))success
         failure:(void (^)(NSError *))failure {
  AFHTTPRequestOperationManager *manager =
      [AFHTTPRequestOperationManager manager];

  [manager GET:@"http://api.randomuser.me/?results=10"
      parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSArray *results = responseObject[@"results"];

        NSMutableArray<Contact *> *contacts =
            [NSMutableArray arrayWithCapacity:[results count]];

        for (id result in results) {
          Contact *contact =
              [Contact contactFromJSONDictionary:result[@"user"]];
          [contacts addObject:contact];
        }

        success(contacts);
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
      }];
}

@end
