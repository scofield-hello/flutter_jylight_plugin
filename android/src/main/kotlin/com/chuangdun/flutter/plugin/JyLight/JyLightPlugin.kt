package com.chuangdun.flutter.plugin.JyLight

import androidx.annotation.NonNull
import com.joyusing.controllight.ControlLightUtil

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** JyLightPlugin */
class JyLightPlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "JyLight")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method){
      "turnOn" -> {
        ControlLightUtil.openLight()
        result.success(ControlLightUtil.isLightOpen())
      }
      "turnOff" -> {
        ControlLightUtil.closeLight()
        result.success(!ControlLightUtil.isLightOpen())
      }
      "increaseBrightness" -> {
        var light = ControlLightUtil.getLight()
        light = if (light >= 9) light else light + 1
        ControlLightUtil.setLight("$light")
        result.success(light)
      }
      "decreaseBrightness" -> {
        var light = ControlLightUtil.getLight()
        light = if (light <= 0) light else light - 1
        ControlLightUtil.setLight("$light")
        result.success(light)
      }
      "isLightOn" -> {
        result.success(ControlLightUtil.isLightOpen())
      }
      "getLight" -> {
        result.success(ControlLightUtil.getLight())
      }
      "getLightStatus" -> {
        val on = ControlLightUtil.isLightOpen()
        val level = ControlLightUtil.getLight()
        result.success(mapOf(
                "status" to on,
                "light" to level
        ))
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
