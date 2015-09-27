//
//  ContactTableViewCell.h
//  Contacts
//
//  Created by Roi Sagiv on 9/26/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactTableViewCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UILabel* contactNameLabel;
@property(weak, nonatomic) IBOutlet UIImageView* contactImageView;
@property(weak, nonatomic) IBOutlet UILabel* contactEmailLabel;

- (void)configureWithContact:(Contact*)contact;

@end
