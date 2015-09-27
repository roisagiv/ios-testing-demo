//
//  ContactsTableDataSource.m
//  Contacts
//
//  Created by Roi Sagiv on 9/27/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "ContactsTableDataSource.h"
#import "ContactTableViewCell.h"

@interface ContactsTableDataSource ()

@property(nonatomic, strong) NSArray<Contact *> *contacts;

@end

@implementation ContactsTableDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ContactTableViewCell *cell = [tableView
      dequeueReusableCellWithIdentifier:NSStringFromClass(
                                            ContactTableViewCell.class)
                           forIndexPath:indexPath];

  Contact *contact = [self.contacts objectAtIndex:indexPath.row];
  [cell configureWithContact:contact];

  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.contacts.count;
}

- (void)tableView:(UITableView *)tableView
    configureWithContacts:(NSArray<Contact *> *)contacts {
  self.contacts = contacts;
  [tableView reloadData];
}

@end
