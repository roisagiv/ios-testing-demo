//
//  RandomUserAPI.h
//  Contacts
//
//  Created by Roi Sagiv on 9/23/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface RandomUserAPI : NSObject

- (void)getUsers:(void (^)(NSArray<Contact*>* users))success
         failure:(void (^)(NSError* error))failure;

@end
