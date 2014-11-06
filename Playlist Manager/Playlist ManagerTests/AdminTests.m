//
//  AdminTests.m
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Playlist.h"
#import "Song.h"
#import "Admin.h"
#import "SubAdmin.h"
#import "User.h"

Admin *testAdmin;
User *testUser;
Song *testSong1;
Song *testSong2;
Playlist * testPlaylist;

@interface Playlist_ManagerTests : XCTestCase

@end

@implementation Playlist_ManagerTests

- (void)setUp {
    [super setUp];
    
    testPlaylist = [[Playlist alloc] init];
    testSong1 = [[Song alloc] initWithTrackID:1234];
    testSong2 = [[Song alloc] initWithTrackID:5678];
    [testPlaylist addSongToQueue:testSong1];
    [testPlaylist addSongToQueue:testSong2];
    testUser = [[User alloc] initWithUsername:@"userName"];
    testAdmin = [[Admin alloc] initWithUsername:@"AdminName"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMoveSong{
    testPlaylist.songQueue[0] = testSong1;
    testPlaylist.songQueue[1] = testSong2;
    [testAdmin moveSong:testPlaylist s:testSong1 newPos:@2];
    //note that we move testSong1 to position 2, which is at index 1
    XCTAssertEqualObjects(testPlaylist.songQueue[1], testSong1, @"Admin was unable to move song in queue");
    XCTAssertEqualObjects(testPlaylist.songQueue[0], testSong2, @"Song positions incorrectly updated after move");
}


- (void)testMakeSubAdmin{
    [testAdmin makeSubAdmin:testUser];
    compSubAdmin =[[SubAdmin alloc] init];
    compSubAdmin.userName = @"userName";
    XCTAssertEqualObjects(testUser, compSubAdmin, @"Admin failed to promote user to subadmin");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

