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
  return nil;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return 0;
}

- (void)tableView:(UITableView *)tableView
    configureWithContacts:(NSArray<Contact *> *)contacts {
}

@end
