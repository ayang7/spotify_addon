//
//  Vote.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <Foundation/Foundation.h>

#import "User.h"

@interface Vote : NSObject

@property (nonatomic, strong) User *user;

@property (nonatomic) int score;

+ (instancetype)upvoteFromUser:(User *)user;

+ (instancetype)downvoteFromUser:(User *)user;

@end
