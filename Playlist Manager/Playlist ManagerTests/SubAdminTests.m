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
#import "Playlist.h"
#import "Song.h"

SongRoom *songroom;
User *user;
SubAdmin *subadmin;
Playlist *playlist;
Song *testSong;


@interface SubAdminTests : XCTestCase

@end

@implementation SubAdminTests

- (void)setUp
{
    [super setUp];
    //set up objects for test cases
    songroom = [[SongRoom alloc] init];
    playlist = [[Playlist alloc] initWithInitialPlaylist:initialSPTPlaylist];
    testSong = [[Song alloc] initWithTrackID:1234];
    user = [[User alloc] initWithUsername:@"user1"];
    subadmin = [[SubAdmin alloc] init];
    playlist.songQueue[0] = testSong;
    songroom.pl = playlist;
    [songroom addUser:user];
    subadmin.songroom = songroom;
}

- (void)testDeleteSong
{
    BOOL val1 = [subadmin deleteSong: @42];
    XCTAssertNil(playlist.songQueue[0], @"SubAdmin failed to delete song from playlist");
    XCTAssert(val1, @"deleteSong did not return true after successful deletion");
    BOOL val2 = [subadmin deleteSong: @42];
    XCTAssertFalse(val2, @"deleteSong did not return false after unsuccessful deletion");
}


- (void)testRemoveUser
{
    BOOL val1 = [subadmin removeUser:user];
    XCTAssertNil(songroom.users[0], @"SubAdmin failed to remove user from songroom");
    XCTAssert(val1, @"removeUser did not return true after successful user removal");
    BOOL val2 = [subadmin removeUser:user];
    XCTAssertFalse(val2, @"removeUser did not return false after failed user removal");
}








