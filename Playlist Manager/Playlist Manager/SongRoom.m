//
//  SongRoom.m
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import "SongRoom.h"

@implementation SongRoom

- (BOOL)addUser : (User *) user
{
    //see if user is already in list of users
    for (User* u in _users){
        //whatever username is called
        if (u.canonicalUsername == user.canonicalUsername){
            return FALSE;
        }
    }
    [_users addObject:user];
    return TRUE;
}

@end
