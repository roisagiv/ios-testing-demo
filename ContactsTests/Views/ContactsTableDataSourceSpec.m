//
//  ContactsTableDataSourceSpec.m
//  Contacts
//
//  Created by Roi Sagiv on 9/27/15.
//  Copyright 2015 roisagiv. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <Foundry/Foundry.h>
#import <OCMock/OCMock.h>

#import "ContactsTableDataSource.h"

#import "ContactTableViewCell.h"

@interface Contact (ContactsTableDataSource)<TGFoundryObject>
@end

@implementation Contact (ContactsTableDataSource)
+ (NSDictionary *)foundryBuildSpecs {
  return @{};
}
@end

SpecBegin(ContactsTableDataSource)

    describe(@"ContactsTableDataSource", ^{
      __block NSArray<Contact *> *contacts;
      __block ContactsTableDataSource *dataSource;
      __block UITableView *tableView;

      before(^{
        contacts = [Contact foundryBuildNumber:20];
        dataSource = [[ContactsTableDataSource alloc] init];
        tableView = [UITableView new];
      });

      context(@"numberOfRowsInSection", ^{

        it(@"should have 0 rows at first", ^{
          NSInteger rows =
              [dataSource tableView:[UITableView new] numberOfRowsInSection:0];

          expect(rows).to.equal(0);
        });

        it(@"should have the same number of rows as contacts array", ^{
          [dataSource tableView:tableView configureWithContacts:contacts];

          NSInteger rows =
              [dataSource tableView:[UITableView new] numberOfRowsInSection:0];

          expect(rows).to.equal(contacts.count);
        });

      });

      context(@"configureWithContacts", ^{

        it(@"should call reloadData on tableView", ^{
          id mockTableView = OCMClassMock(UITableView.class);

          [dataSource tableView:mockTableView configureWithContacts:contacts];

          [[mockTableView verify] reloadData];
        });

      });

      context(@"cellForRowAtIndexPath", ^{

        it(@"should call configureWithContact on cell", ^{

          id mockTableView = OCMClassMock(UITableView.class);
          [dataSource tableView:mockTableView configureWithContacts:contacts];

          id mockTableViewCell = OCMClassMock(ContactTableViewCell.class);
          OCMStub(
              [mockTableView dequeueReusableCellWithIdentifier:
                                 NSStringFromClass(ContactTableViewCell.class)
                                                  forIndexPath:[OCMArg any]])
              .andReturn(mockTableViewCell);

          for (NSInteger index; index < contacts.count; index++) {
            NSIndexPath *indexPath =
                [NSIndexPath indexPathForRow:index inSection:0];

            [dataSource tableView:mockTableView
                cellForRowAtIndexPath:indexPath];

            [[mockTableView verify]
                dequeueReusableCellWithIdentifier:NSStringFromClass(
                                                      ContactTableViewCell
                                                          .class)
                                     forIndexPath:indexPath];

            Contact *contact = [contacts objectAtIndex:index];
            [[mockTableViewCell verify] configureWithContact:contact];
          }

        });

      });

    });

SpecEnd
