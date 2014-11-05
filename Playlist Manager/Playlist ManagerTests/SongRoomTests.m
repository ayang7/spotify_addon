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
    room = [[SongRoom alloc] init];
    [super setUp];
    
}

- (void)tearDown
{
    song = nil;
}

- (void)addUser : (User *) user{
    [room addUser:testUser];
    XCTAssertEqualObjects(SongRoom.users[0], testUser, @"Failed to add user");
}

@end



