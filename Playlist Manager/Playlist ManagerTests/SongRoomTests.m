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
    room = [[SongRoom alloc] initWithInfo:@"testname"];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitWithInfo
{
    //this function is used for building test cases in UserTests.m
    XCTAssertEqual(room.name, @"testname", @"SongRoom name not properly initialized");
}

- (void)testAddUser
{
    [room addUser:testUser];
    XCTAssertEqualObjects(room.users[0], testUser, @"Failed to add user");
    
    BOOL val = [room addUser:testUser];
    XCTAssertFalse(val, @"addUser returned true when adding duplicate user");
}

@end



