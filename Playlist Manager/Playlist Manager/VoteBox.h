//
//  VoteBox.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <Foundation/Foundation.h>

#import "Vote.h"

@interface VoteBox : NSObject

- (void)addUpvoteFromUser:(User *)user;

- (void)addDownvoteFromUser:(User *)user;

@end
