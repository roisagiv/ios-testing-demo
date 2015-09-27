//
//  ContactTableViewCellSpec.m
//  Contacts
//
//  Created by Roi Sagiv on 9/26/15.
//  Copyright 2015 roisagiv. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "ContactTableViewCell.h"
#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController (ContactTableViewCell)
@end

@implementation ViewController (ContactTableViewCell)
- (void)viewDidLoad {
  // do nothing!
}
@end

/*!
 *  Override AFNetworking/UIKit+AFNetworking.h
 */
@interface UIImageView (ContactTableViewCell)

@property(strong, nonatomic) NSString *imageUrl;

- (void)setImageWithURL:(NSURL *)url;

@end

static const void *ImageUrlKey = &ImageUrlKey;
@implementation UIImageView (ContactTableViewCell)

- (void)setImageWithURL:(NSURL *)url {
  self.imageUrl = [url absoluteString];
}

- (void)setImageUrl:(NSString *)imageUrl {
  objc_setAssociatedObject(self, ImageUrlKey, imageUrl,
                           OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)imageUrl {
  return objc_getAssociatedObject(self, ImageUrlKey);
}

@end

SpecBegin(ContactTableViewCell)

    describe(@"ContactTableViewCell", ^{

      __block ContactTableViewCell *cell;

      beforeEach(^{
        UIStoryboard *mainStoryboard =
            [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [mainStoryboard
            instantiateViewControllerWithIdentifier:@"ViewController"];
        expect(vc.view).toNot.beNil();

        cell = [vc.tableView
            dequeueReusableCellWithIdentifier:NSStringFromClass(
                                                  ContactTableViewCell.class)];
      });

      it(@"should have IBOutlets hooked up", ^{
        expect(cell.contactEmailLabel).toNot.beNil();
        expect(cell.contactImageView).toNot.beNil();
        expect(cell.contactNameLabel).toNot.beNil();
      });

      context(@"configureCellWithContact", ^{

        __block Contact *contact;

        before(^{
          contact = [Contact contactFromJSONDictionary:@{
            @"gender" : @"female",
            @"name" :
                @{@"title" : @"ms", @"first" : @"lola", @"last" : @"davis"},
            @"email" : @"lola.davis@example.com",
            @"picture" : @{
              @"large" : @"https://randomuser.me/api/portraits/women/37.jpg",
              @"medium" :
                  @"https://randomuser.me/api/portraits/med/women/37.jpg",
              @"thumbnail" :
                  @"https://randomuser.me/api/portraits/thumb/women/37.jpg"
            }
          }];

          [cell configureWithContact:contact];
        });

        it(@"sets the contact email label", ^{
          expect(cell.contactEmailLabel.text).to.equal(contact.email);
        });

        it(@"sets the contact name label", ^{
          NSString *expected = [NSString
              stringWithFormat:@"%@ %@", contact.name.first, contact.name.last];
          expect(cell.contactNameLabel.text).to.equal(expected);
        });

        it(@"sets the contact image", ^{
          expect(cell.contactImageView.imageUrl)
              .to.equal(contact.picture.thumbnail);
        });
      });
    });

SpecEnd
