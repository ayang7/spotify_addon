//
//  SongRoomTests.m
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Song.h"
#import "User.h"
#import "SongRoom.h"


User *testUser;
SongRoom *room;

@interface SongRoomTests : XCTestCase

@end

@implementation SongRoomTests

- (void)setUp
{
    [super setUp];
    room = [[SongRoom alloc] init];
    testUser = [[User alloc] init];
}

- (void)tearDown
{
    testUser = nil;
    room = nil;
    [super tearDown];
}

- (void)testAddUser
{
    [room addUser:testUser];
    XCTAssertEqualObjects(room.users[0], testUser, @"Failed to add user");
    
    BOOL val = [room addUser:testUser];
    XCTAssertFalse(val, @"addUser returned true when adding duplicate user");
}

@end



