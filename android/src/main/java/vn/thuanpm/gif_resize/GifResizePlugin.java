package vn.thuanpm.gif_resize;

import androidx.annotation.NonNull;

import gif_resize.GifResize;
import gif_resize.Gif_resize;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** GifResizePlugin */
public class GifResizePlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private static final String METHOD_CHANNEL = "gif_resize";
  private GifResize gifResize;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), METHOD_CHANNEL);
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "init":
        init(call, result);
        break;
      case "process":
        process(call, result);
        break;

      case "get_height":
        getHeight(call, result);
        break;

      case "set_height":
        setHeight(call, result);
        break;
      case "get_width":
        getWidth(call, result);
        break;

      case "set_width":
        setWidth(call, result);
        break;

      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private void init(@NonNull MethodCall call, @NonNull Result result) {
    final Integer width = call.argument("width");
    final Integer height = call.argument("height");
    try {
      gifResize = Gif_resize.init(width.longValue(),height.longValue());
      result.success(true);
    } catch (Exception e) {
      result.error("1", "inti error", "Can not call native error");
    }
  }

  private void process(@NonNull MethodCall call, @NonNull Result result) {
    final byte[] gifData = call.argument("data");
    try {
      final byte[] resizedGif = gifResize.process(gifData);
      result.success(resizedGif);
    } catch (Exception e) {
      result.error("2", "process error", "Can not call native error");
    }
  }

  private void getHeight(@NonNull MethodCall call, @NonNull Result result) {
    try {
      result.success(gifResize.getHeight());
    } catch (Exception e) {
      result.error("3", "get height error", "Can not call native error");
    }
  }

  private void getWidth(@NonNull MethodCall call, @NonNull Result result) {
    try {
      result.success(gifResize.getWidth());
    } catch (Exception e) {
      result.error("4", "get width error", "Can not call native error");
    }
  }

  private void setHeight(@NonNull MethodCall call, @NonNull Result result) {

    try {
      final Integer height = call.argument("data");
      gifResize.setHeight(height.longValue());
      result.success(true);
    } catch (Exception e) {
      result.error("5", "set height error", "Can not call native error");
    }
  }

  private void setWidth(@NonNull MethodCall call, @NonNull Result result) {
    try {
      final Integer width = call.argument("data");
      gifResize.setWidth(width.longValue());
      result.success(true);
    } catch (Exception e) {
      result.error("6", "set width error", "Can not call native error");
    }
  }
}
