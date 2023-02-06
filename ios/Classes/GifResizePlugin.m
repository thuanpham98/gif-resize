#import "GifResizePlugin.h"
#if __has_include(<gif_resize/gif_resize-Swift.h>)
#import <gif_resize/gif_resize-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gif_resize-Swift.h"
#endif

@implementation GifResizePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGifResizePlugin registerWithRegistrar:registrar];
}
@end
