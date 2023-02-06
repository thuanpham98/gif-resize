// Objective-C API for talking to thuanpham98/gif-go Go package.
//   gobind -lang=objc thuanpham98/gif-go
//
// File is generated by gobind. Do not edit.

#ifndef __Gif_resize_H__
#define __Gif_resize_H__

@import Foundation;
#include "ref.h"
#include "Universe.objc.h"


@class Gif_resizeGifResize;

@interface Gif_resizeGifResize : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) _Nonnull id _ref;

- (nonnull instancetype)initWithRef:(_Nonnull id)ref;
- (nonnull instancetype)init;
@property (nonatomic) long width;
@property (nonatomic) long height;
- (NSData* _Nullable)process:(NSData* _Nullable)data error:(NSError* _Nullable* _Nullable)error;
@end

FOUNDATION_EXPORT Gif_resizeGifResize* _Nullable Gif_resizeInit(long width, long height);

#endif
