//
//  ContactsTableDataSource.h
//  Contacts
//
//  Created by Roi Sagiv on 9/27/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactsTableDataSource : NSObject<UITableViewDataSource>

- (void)tableView:(nonnull UITableView *)tableView
    configureWithContacts:(nonnull NSArray<Contact *> *)contacts;

@end
