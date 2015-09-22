//
//  Contact.m
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright © 2015 roisagiv. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+ (NSValueTransformer *)nameJSONTransformer {
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:ContactName.class];
}

+ (NSValueTransformer *)pictureJSONTransformer {
  return
      [MTLJSONAdapter dictionaryTransformerWithModelClass:ContactPicture.class];
}

@end

/*!
 *
 */
@implementation ContactName

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

@end

/*!
 *
 */
@implementation ContactPicture

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

@end
