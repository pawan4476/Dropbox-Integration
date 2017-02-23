///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESAlphaGetMetadataError.h"
#import "DBFILESGetMetadataError.h"
#import "DBFILESLookUpPropertiesError.h"
#import "DBFILESLookupError.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESAlphaGetMetadataError

@synthesize path = _path;
@synthesize propertiesError = _propertiesError;

#pragma mark - Constructors

- (instancetype)initWithPath:(DBFILESLookupError *)path {
  self = [super init];
  if (self) {
    _tag = DBFILESAlphaGetMetadataErrorPath;
    _path = path;
  }
  return self;
}

- (instancetype)initWithPropertiesError:(DBFILESLookUpPropertiesError *)propertiesError {
  self = [super init];
  if (self) {
    _tag = DBFILESAlphaGetMetadataErrorPropertiesError;
    _propertiesError = propertiesError;
  }
  return self;
}

#pragma mark - Instance field accessors

- (DBFILESLookupError *)path {
  if (![self isPath]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBFILESAlphaGetMetadataErrorPath, but was %@.", [self tagName]];
  }
  return _path;
}

- (DBFILESLookUpPropertiesError *)propertiesError {
  if (![self isPropertiesError]) {
    [NSException
         raise:@"IllegalStateException"
        format:@"Invalid tag: required DBFILESAlphaGetMetadataErrorPropertiesError, but was %@.", [self tagName]];
  }
  return _propertiesError;
}

#pragma mark - Tag state methods

- (BOOL)isPath {
  return _tag == DBFILESAlphaGetMetadataErrorPath;
}

- (BOOL)isPropertiesError {
  return _tag == DBFILESAlphaGetMetadataErrorPropertiesError;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBFILESAlphaGetMetadataErrorPath:
    return @"DBFILESAlphaGetMetadataErrorPath";
  case DBFILESAlphaGetMetadataErrorPropertiesError:
    return @"DBFILESAlphaGetMetadataErrorPropertiesError";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESAlphaGetMetadataErrorSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESAlphaGetMetadataErrorSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESAlphaGetMetadataErrorSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESAlphaGetMetadataErrorSerializer

+ (NSDictionary *)serialize:(DBFILESAlphaGetMetadataError *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isPath]) {
    jsonDict[@"path"] = [[DBFILESLookupErrorSerializer serialize:valueObj.path] mutableCopy];
    jsonDict[@".tag"] = @"path";
  } else if ([valueObj isPropertiesError]) {
    jsonDict[@"properties_error"] =
        [[DBFILESLookUpPropertiesErrorSerializer serialize:valueObj.propertiesError] mutableCopy];
    jsonDict[@".tag"] = @"properties_error";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBFILESAlphaGetMetadataError *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"path"]) {
    DBFILESLookupError *path = [DBFILESLookupErrorSerializer deserialize:valueDict[@"path"]];
    return [[DBFILESAlphaGetMetadataError alloc] initWithPath:path];
  } else if ([tag isEqualToString:@"properties_error"]) {
    DBFILESLookUpPropertiesError *propertiesError =
        [DBFILESLookUpPropertiesErrorSerializer deserialize:valueDict[@"properties_error"]];
    return [[DBFILESAlphaGetMetadataError alloc] initWithPropertiesError:propertiesError];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
