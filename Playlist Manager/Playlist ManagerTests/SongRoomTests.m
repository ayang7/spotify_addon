//
//  SongRoomTests.m
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <Foundation/Foundation.h>
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
}

- (void)tearDown
{
    [super tearDown];
}

- (void)addUser : (User *) user{
    [room addUser:testUser];
    XCTAssertEqualObjects(room.users[0], testUser, @"Failed to add user");
    BOOL val = [room addUser:testUser];
    XCTAssertFalse(val, @"addUser returned true when adding duplicate user");
}

@end



