//
//  Song.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import "User.h"

typedef enum{
    UP,
    DOWN
}Vote;

struct userWithVote
{
    User *user;
    Vote vote;
} userWithVote;

@class User;

@interface Song : NSObject

@property (nonatomic) int trackID;

@property (nonatomic) int votes;

- (instancetype)initWithTrackID:(int)trackID;

//edited on 11/9 to use Vote type
- (bool)receiveVote:(Vote)vote fromUser:(User *)user;

@end

