//
//  ViewController.h
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomUserAPI.h"
#import "ContactsTableDataSource.h"

@interface ViewController : UIViewController

@property(weak, nonatomic) IBOutlet UITableView* tableView;

+ (instancetype)viewControllerWithRandomUserAPI:(RandomUserAPI*)randomUserAPI
                     andContactsTableDataSource:
                         (ContactsTableDataSource*)dataSource;

@end
