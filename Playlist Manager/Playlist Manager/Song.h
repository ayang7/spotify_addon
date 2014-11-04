//
//  Song.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <Foundation/Foundation.h>

@class User;

@interface Song : NSObject

@property (nonatomic) int trackID;

@property (nonatomic) int votes;

- (instancetype)initWithTrackID:(int)trackID;

- (bool)receiveVote:(bool)vote fromUser:(User *)user;

@end
