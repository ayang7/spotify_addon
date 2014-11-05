//
//  SubAdminTests.m
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "SubAdmin.h"
#import "SongRoom.h"
#import "User.h"

SongRoom *songroom;
User *user;
SubAdmin *subadmin;


@interface SubAdminTests : XCTestCase

@end

@implementation SubAdminTests

- (void)setUp
{
    [super setUp];
    
    songroom = [[SongRoom alloc] init];
    
    user = [[User alloc] init];

    subadmin = [[SubAdmin alloc] init];
}


- (void)testDeleteSong
{
    subadmin.deleteSong(NSNumber *fortyTwo = @42);
}
