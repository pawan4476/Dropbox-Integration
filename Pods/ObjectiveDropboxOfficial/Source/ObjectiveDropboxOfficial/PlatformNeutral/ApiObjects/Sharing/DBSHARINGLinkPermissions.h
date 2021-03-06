///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBSHARINGLinkPermissions;
@class DBSHARINGRequestedVisibility;
@class DBSHARINGResolvedVisibility;
@class DBSHARINGSharedLinkAccessFailureReason;

#pragma mark - API Object

///
/// The `LinkPermissions` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBSHARINGLinkPermissions : NSObject <DBSerializable>

#pragma mark - Instance fields

/// The current visibility of the link after considering the shared links
/// policies of the the team (in case the link's owner is part of a team) and
/// the shared folder (in case the linked file is part of a shared folder). This
/// field is shown only if the caller has access to this info (the link's owner
/// always has access to this data).
@property (nonatomic, readonly) DBSHARINGResolvedVisibility * _Nullable resolvedVisibility;

/// The shared link's requested visibility. This can be overridden by the team
/// and shared folder policies. The final visibility, after considering these
/// policies, can be found in resolvedVisibility. This is shown only if the
/// caller is the link's owner.
@property (nonatomic, readonly) DBSHARINGRequestedVisibility * _Nullable requestedVisibility;

/// Whether the caller can revoke the shared link
@property (nonatomic, readonly) NSNumber * _Nonnull canRevoke;

/// The failure reason for revoking the link. This field will only be present if
/// the canRevoke is false.
@property (nonatomic, readonly) DBSHARINGSharedLinkAccessFailureReason * _Nullable revokeFailureReason;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param canRevoke Whether the caller can revoke the shared link
/// @param resolvedVisibility The current visibility of the link after
/// considering the shared links policies of the the team (in case the link's
/// owner is part of a team) and the shared folder (in case the linked file is
/// part of a shared folder). This field is shown only if the caller has access
/// to this info (the link's owner always has access to this data).
/// @param requestedVisibility The shared link's requested visibility. This can
/// be overridden by the team and shared folder policies. The final visibility,
/// after considering these policies, can be found in resolvedVisibility. This
/// is shown only if the caller is the link's owner.
/// @param revokeFailureReason The failure reason for revoking the link. This
/// field will only be present if the canRevoke is false.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithCanRevoke:(NSNumber * _Nonnull)canRevoke
                       resolvedVisibility:(DBSHARINGResolvedVisibility * _Nullable)resolvedVisibility
                      requestedVisibility:(DBSHARINGRequestedVisibility * _Nullable)requestedVisibility
                      revokeFailureReason:(DBSHARINGSharedLinkAccessFailureReason * _Nullable)revokeFailureReason;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
/// @param canRevoke Whether the caller can revoke the shared link
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithCanRevoke:(NSNumber * _Nonnull)canRevoke;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `LinkPermissions` struct.
///
@interface DBSHARINGLinkPermissionsSerializer : NSObject

///
/// Serializes `DBSHARINGLinkPermissions` instances.
///
/// @param instance An instance of the `DBSHARINGLinkPermissions` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBSHARINGLinkPermissions` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBSHARINGLinkPermissions * _Nonnull)instance;

///
/// Deserializes `DBSHARINGLinkPermissions` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBSHARINGLinkPermissions` API object.
///
/// @return An instantiation of the `DBSHARINGLinkPermissions` object.
///
+ (DBSHARINGLinkPermissions * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end
