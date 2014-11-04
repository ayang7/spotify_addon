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


@interface Playlist_ManagerTests : XCTestCase

@end

@implementation Playlist_ManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMoveSong{
    XCTAssert(<#expression, ...#>)
}


- (void)testMakeSubAdmin{
    XCTAssert(<#expression, ...#>)
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

