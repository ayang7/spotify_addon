//
//  SubAdmin.h
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface SubAdmin : User

- (BOOL)deleteSong:(NSNumber *) songID;

- (BOOL)removeUser:(User *) user;

@end



