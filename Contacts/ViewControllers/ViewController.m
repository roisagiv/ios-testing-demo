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
  return nil;
}

- (void)viewDidLoad {
}

@end
