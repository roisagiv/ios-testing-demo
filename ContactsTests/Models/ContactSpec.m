//
//  ContactSpec.m
//  Contacts
//
//  Created by Roi Sagiv on 9/22/15.
//  Copyright 2015 roisagiv. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

#import "Contact.h"

#import "JsonFixtures.h"

SpecBegin(Contact)

    describe(@"Contact", ^{

      it(@"parses json user into Contact", ^{
        id json = [JsonFixtures
            JSONFromLocalFileWithName:@"randomuser.me.user.example"];

        NSError* error;
        Contact* contact = [Contact contactFromJSONDictionary:json];

        expect(error).to.beNil;

        expect(contact.name.title).to.equal(@"ms");
        expect(contact.name.first).to.equal(@"lola");
        expect(contact.name.last).to.equal(@"davis");

        expect(contact.email).to.equal(@"lola.davis@example.com");

        expect(contact.picture.large)
            .to.equal(@"https://randomuser.me/api/portraits/women/37.jpg");
        expect(contact.picture.medium)
            .to.equal(@"https://randomuser.me/api/portraits/med/women/37.jpg");
        expect(contact.picture.thumbnail)
            .to.equal(
                @"https://randomuser.me/api/portraits/thumb/women/37.jpg");
      });

    });

SpecEnd
