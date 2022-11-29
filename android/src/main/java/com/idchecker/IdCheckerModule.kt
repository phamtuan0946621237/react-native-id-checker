package com.idchecker

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import android.util.Log;
import com.facebook.react.bridge.Callback;

class IdCheckerModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }

  @ReactMethod fun createCalendarEvent(name: String, location: String,alooo : Callback) {
            Log.d("CalendarModule", "Create event called with name: " + name
            + " and location: " + location);
            alooo.invoke("helloo baby");
    }

  companion object {
    const val NAME = "IdChecker"
  }
}
