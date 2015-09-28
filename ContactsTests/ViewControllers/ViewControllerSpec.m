//
//  ViewControllerSpec.m
//  Contacts
//
//  Created by Roi Sagiv on 9/27/15.
//  Copyright 2015 roisagiv. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <Foundry/Foundry.h>
#import "ViewController.h"

SpecBegin(ViewController)

    describe(@"ViewController", ^{

      context(@"viewControllerWithRandomUserAPI:andContactsTableDataSource", ^{

        it(@"should not return nil", ^{
          ViewController* vc =
              [ViewController viewControllerWithRandomUserAPI:nil
                                   andContactsTableDataSource:nil];

          expect(vc).toNot.beNil();
        });

      });

      context(@"viewDidLoad", ^{

        __block id mockApi;
        __block id mockDataSource;
        __block ViewController* vc;

        before(^{

          mockApi = OCMClassMock(RandomUserAPI.class);
          mockDataSource = OCMClassMock(ContactsTableDataSource.class);
          vc = [ViewController viewControllerWithRandomUserAPI:mockApi
                                    andContactsTableDataSource:mockDataSource];

          [vc beginAppearanceTransition:YES animated:NO];
          vc.view.frame = [UIScreen mainScreen].bounds;
          [vc endAppearanceTransition];

        });

        it(@"should call RandomUserAPI", ^{
          [[mockApi verify] getUsers:[OCMArg any] failure:[OCMArg any]];
        });

        it(@"should set dataSource as tableView dataSource", ^{
          expect(vc.tableView.dataSource).to.equal(mockDataSource);
        });

      });

      context(@"getUsers succeeds", ^{

        __block id mockApi;
        __block id mockDataSource;
        __block ViewController* vc;
        __block NSArray<Contact*>* contacts;

        before(^{

          contacts = [Contact foundryBuildNumber:10];
          mockApi = OCMClassMock(RandomUserAPI.class);
          mockDataSource = OCMClassMock(ContactsTableDataSource.class);
          vc = [ViewController viewControllerWithRandomUserAPI:mockApi
                                    andContactsTableDataSource:mockDataSource];

          [[[mockApi stub] andDo:^(NSInvocation* invocation) {
            void (^getUsersSuccessBlock)(NSArray<Contact*>*);
            // in Objective-C, the first two parameters passed to any function
            // are ‘self’ and ‘_cmd.’
            [invocation getArgument:&getUsersSuccessBlock atIndex:2];
            getUsersSuccessBlock(contacts);

          }] getUsers:[OCMArg any]
               failure:[OCMArg any]];

          [vc beginAppearanceTransition:YES animated:NO];
          vc.view.frame = [UIScreen mainScreen].bounds;
          [vc endAppearanceTransition];

        });

        it(@"configure the data source with contacts", ^{
          [[mockDataSource verify] tableView:vc.tableView
                       configureWithContacts:contacts];
        });

      });

    });

SpecEnd
