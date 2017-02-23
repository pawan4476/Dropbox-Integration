///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMMemberProfile.h"
#import "DBTEAMTeamMemberStatus.h"
#import "DBTEAMTeamMembershipType.h"
#import "DBUSERSName.h"

#pragma mark - API Object

@implementation DBTEAMMemberProfile

#pragma mark - Constructors

- (instancetype)initWithTeamMemberId:(NSString *)teamMemberId
                               email:(NSString *)email
                       emailVerified:(NSNumber *)emailVerified
                              status:(DBTEAMTeamMemberStatus *)status
                                name:(DBUSERSName *)name
                      membershipType:(DBTEAMTeamMembershipType *)membershipType
                          externalId:(NSString *)externalId
                           accountId:(NSString *)accountId {
  [DBStoneValidators
   nullableValidator:[DBStoneValidators stringValidator:@(40) maxLength:@(40) pattern:nil]](accountId);

  self = [super init];
  if (self) {
    _teamMemberId = teamMemberId;
    _externalId = externalId;
    _accountId = accountId;
    _email = email;
    _emailVerified = emailVerified;
    _status = status;
    _name = name;
    _membershipType = membershipType;
  }
  return self;
}

- (instancetype)initWithTeamMemberId:(NSString *)teamMemberId
                               email:(NSString *)email
                       emailVerified:(NSNumber *)emailVerified
                              status:(DBTEAMTeamMemberStatus *)status
                                name:(DBUSERSName *)name
                      membershipType:(DBTEAMTeamMembershipType *)membershipType {
  return [self initWithTeamMemberId:teamMemberId
                              email:email
                      emailVerified:emailVerified
                             status:status
                               name:name
                     membershipType:membershipType
                         externalId:nil
                          accountId:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMMemberProfileSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMMemberProfileSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMMemberProfileSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMMemberProfileSerializer

+ (NSDictionary *)serialize:(DBTEAMMemberProfile *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"team_member_id"] = valueObj.teamMemberId;
  jsonDict[@"email"] = valueObj.email;
  jsonDict[@"email_verified"] = valueObj.emailVerified;
  jsonDict[@"status"] = [DBTEAMTeamMemberStatusSerializer serialize:valueObj.status];
  jsonDict[@"name"] = [DBUSERSNameSerializer serialize:valueObj.name];
  jsonDict[@"membership_type"] = [DBTEAMTeamMembershipTypeSerializer serialize:valueObj.membershipType];
  if (valueObj.externalId) {
    jsonDict[@"external_id"] = valueObj.externalId;
  }
  if (valueObj.accountId) {
    jsonDict[@"account_id"] = valueObj.accountId;
  }

  return jsonDict;
}

+ (DBTEAMMemberProfile *)deserialize:(NSDictionary *)valueDict {
  NSString *teamMemberId = valueDict[@"team_member_id"];
  NSString *email = valueDict[@"email"];
  NSNumber *emailVerified = valueDict[@"email_verified"];
  DBTEAMTeamMemberStatus *status = [DBTEAMTeamMemberStatusSerializer deserialize:valueDict[@"status"]];
  DBUSERSName *name = [DBUSERSNameSerializer deserialize:valueDict[@"name"]];
  DBTEAMTeamMembershipType *membershipType =
      [DBTEAMTeamMembershipTypeSerializer deserialize:valueDict[@"membership_type"]];
  NSString *externalId = valueDict[@"external_id"] ?: nil;
  NSString *accountId = valueDict[@"account_id"] ?: nil;

  return [[DBTEAMMemberProfile alloc] initWithTeamMemberId:teamMemberId
                                                     email:email
                                             emailVerified:emailVerified
                                                    status:status
                                                      name:name
                                            membershipType:membershipType
                                                externalId:externalId
                                                 accountId:accountId];
}

@end
