//
//  SongRoom.h
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import "SubAdmin.h"
#import "Playlist.h"
#import "Admin.h"

@class SongRoom;

@interface SongRoom : NSObject

@property (nonatomic) NSString *name;

@property (nonatomic) Admin *admin;

@property (nonatomic) NSMutableArray *subAdmins;

@property (nonatomic) NSMutableArray *users;

@property (nonatomic) Playlist *pl;

- (BOOL)addUser : (User *) user;

@end

