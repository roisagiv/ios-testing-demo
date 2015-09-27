//
//  ContactTableViewCell.m
//  Contacts
//
//  Created by Roi Sagiv on 9/26/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "ContactTableViewCell.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@implementation ContactTableViewCell

- (void)configureWithContact:(Contact *)contact {
  self.contactNameLabel.text = [NSString
      stringWithFormat:@"%@ %@", contact.name.first, contact.name.last];

  self.contactEmailLabel.text = contact.email;

  [self.contactImageView
      setImageWithURL:[NSURL URLWithString:contact.picture.thumbnail]];
}

@end
