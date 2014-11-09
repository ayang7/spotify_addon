//
//  User.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "User.h"
#import "Song.h"
#import "SongRoom.h"
#import "Playlist.h"

@interface  User ()

@property SongRoom* room;

@end

@implementation User

- (instancetype)initWithUsername:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.canonicalUsername = name; //this is a problem?
        self.room = NULL;
    }
    return self;

}

- (SongRoom *) create_SongRoom:(NSString *)name :(Playlist *)pl
{
    _room = [[SongRoom alloc] init];
    _room.name = name;
    _room.users = [NSMutableArray array];
    _room.subAdmins = [NSMutableArray array];
    _room.admin = [[Admin alloc] init]; //create new admin object for user, should use a special init func
    _room.pl = pl;
    _room.admin.BaseUser = self;
}

- (void)joinSongRoom : (SongRoom *) sr
{
    self.room = sr;
    [sr addUser:self];
}

- (void)requestSong : (Song *) s
{
    if (_room) {
        NSNumber *ind;
        if ((ind = [_room.pl findSongByTrackID:s.trackID])){
            [self voteSong:s :UP];
        } else {
            [_room.pl addSongToQueue:s];
        }
    } else {
        //user not in a songroom, print an error message?
    }
}

- (BOOL)voteSong : (Song *) sr : (Vote) upDown
{
    if (_room){
        return [_room.pl[[_room.pl findSongByTrackID:sr.trackID].intValue] receiveVote:upDown User:self];
        
        //select song from user interface?
    } else {
        return FALSE;
        //user not in a songroom
    }
}

@end
