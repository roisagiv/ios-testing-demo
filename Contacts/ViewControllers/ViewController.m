//
//  ViewController.m
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) RandomUserAPI *randomUserApi;
@property(nonatomic, strong) ContactsTableDataSource *dataSource;

@end

@implementation ViewController

+ (instancetype)viewControllerWithRandomUserAPI:(RandomUserAPI *)randomUserAPI
                     andContactsTableDataSource:
                         (ContactsTableDataSource *)dataSource {
  UIStoryboard *mainStoryboard =
      [UIStoryboard storyboardWithName:@"Main" bundle:nil];

  ViewController *viewController = [mainStoryboard
      instantiateViewControllerWithIdentifier:NSStringFromClass(
                                                  [ViewController class])];

  if (viewController) {
    viewController.randomUserApi = randomUserAPI;
    viewController.dataSource = dataSource;
  }

  return viewController;
}

- (void)viewDidLoad {
  self.tableView.dataSource = self.dataSource;

  [self.randomUserApi getUsers:^(NSArray<Contact *> *users) {

    [self.dataSource tableView:self.tableView configureWithContacts:users];

  } failure:^(NSError *error){
  }];
}

@end
