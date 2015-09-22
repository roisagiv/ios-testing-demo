//
//  Contact.h
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class ContactName;
@class ContactPicture;

@interface Contact : MTLModel<MTLJSONSerializing>

@property(strong, nonatomic) ContactName* name;
@property(strong, nonatomic) NSString* email;
@property(strong, nonatomic) ContactPicture* picture;

@end

@interface ContactName : MTLModel<MTLJSONSerializing>

@property(strong, nonatomic) NSString* title;
@property(strong, nonatomic) NSString* first;
@property(strong, nonatomic) NSString* last;

@end

@interface ContactPicture : MTLModel<MTLJSONSerializing>

@property(strong, nonatomic) NSString* large;
@property(strong, nonatomic) NSString* medium;
@property(strong, nonatomic) NSString* thumbnail;

@end
