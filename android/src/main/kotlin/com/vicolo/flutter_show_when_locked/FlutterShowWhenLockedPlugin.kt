package com.vicolo.flutter_show_when_locked

import androidx.annotation.NonNull
import android.app.Activity;
import android.util.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.view.WindowManager;
import android.os.Build;

/** FlutterShowWhenLockedPlugin */
class FlutterShowWhenLockedPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity: Activity? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_show_when_locked")
    channel.setMethodCallHandler(this)
  }

override fun onDetachedFromActivity() {
    // TODO("Not yet implemented")
}

override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    // TODO("Not yet implemented")
}

override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
}

override fun onDetachedFromActivityForConfigChanges() {
    // TODO("Not yet implemented")
}

  override fun onMethodCall(call: MethodCall, result: Result) {
    if(call.method == "show"){
      if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1){
        this.activity?.setShowWhenLocked(true);
        this.activity?.setTurnScreenOn(true);
      }
      this.activity?.getWindow()?.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
      this.activity?.getWindow()?.addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);
      this.activity?.getWindow()?.addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
      this.activity?.getWindow()?.addFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
      Log.d("FlutterShowWhenLocked", "App shown on lock screen")
      result.success("Success");
    }
    else if(call.method == "hide"){
       if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1){
          this.activity?.setShowWhenLocked(false);
          this.activity?.setTurnScreenOn(false);
       }
      this.activity?.getWindow()?.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
      this.activity?.getWindow()?.clearFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);
      this.activity?.getWindow()?.clearFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
      this.activity?.getWindow()?.clearFlags(WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
      Log.d("FlutterShowWhenLocked", "App hidden on lock screen")
       result.success("Success");   
    }
    else if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
