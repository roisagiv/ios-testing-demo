//
//  RandomUserAPISpec.m
//  Contacts
//
//  Created by Roi Sagiv on 9/23/15.
//  Copyright 2015 roisagiv. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "RandomUserAPI.h"

#import "OHHTTPStubs+Helper.h"
#import "JsonFixtures.h"

SpecBegin(RandomUserAPI)

    describe(@"RandomUserAPI", ^{

      afterEach(^{
        [OHHTTPStubs removeAllStubs];
      });

      context(@"getUsers succeed with status 200OK", ^{

        before(^{
          [OHHTTPStubs stubJSONResponseAtPath:@"/"
                                   withParams:@{
                                     @"results" : @10
                                   }
                                 withResponse:@{}];
        });

        it(@"calls the success block", ^{
          waitUntil(^(DoneCallback done) {
            RandomUserAPI* api = [[RandomUserAPI alloc] init];
            [api getUsers:^(NSArray<Contact*>* users) {
              done();
            } failure:^(NSError* error){
                // do nothing
            }];
          });
        });

      });

      context(@"getUsers fails with status other than 200OK", ^{

        before(^{
          [OHHTTPStubs stubJSONResponseAtPath:@"/"
                                   withParams:@{
                                     @"results" : @10
                                   }

                                 withResponse:@{}
                                andStatusCode:404];
        });

        it(@"calls the failure block", ^{
          waitUntil(^(DoneCallback done) {
            RandomUserAPI* api = [[RandomUserAPI alloc] init];
            [api getUsers:^(NSArray<Contact*>* users) {
              // do nothing
            } failure:^(NSError* error) {
              done();
            }];
          });
        });

      });

      context(@"getUsers parses response into array of contacts", ^{

        before(^{
          id json =
              [JsonFixtures JSONFromLocalFileWithName:@"randomuser.me.example"];
          [OHHTTPStubs stubJSONResponseAtPath:@"/"
                                   withParams:@{
                                     @"results" : @10
                                   }
                                 withResponse:json];
        });

        it(@"returns array of 10 contacts", ^{
          waitUntil(^(DoneCallback done) {
            RandomUserAPI* api = [[RandomUserAPI alloc] init];
            [api getUsers:^(NSArray<Contact*>* users) {

              expect(users).to.haveLengthOf(10);
              expect([users objectAtIndex:1].name.first).to.equal(@"paul");

              done();
            } failure:^(NSError* error){
                // do nothing
            }];
          });
        });
      });

    });

SpecEnd
