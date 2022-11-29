package com.idchecker;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import java.util.Map;
import java.util.HashMap;
import android.util.Log;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;


class CalendarModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    override fun getName() = "CalendarModule"
    @ReactMethod fun createCalendarEvent(name: String, location: String,alooo : Callback) {
            Log.d("CalendarModule", "Create event called with name: " + name
            + " and location: " + location);
            alooo.invoke("helloo baby");
    }

    companion object {
    const val NAME = "Calendar"
  }
}



// public class CalendarModule extends ReactContextBaseJavaModule {
//    CalendarModule(ReactApplicationContext context) {
//        super(context);
//    }

//    @Override
//     public String getName() {
//     return "CalendarModule";
//     }

//     @ReactMethod
//     public void createCalendarEvent(String name, String location,Callback alooo) {
//     Log.d("CalendarModule", "Create event called with name: " + name
//     + " and location: " + location);
//     alooo.invoke("helloo baby");
//     }

//     @ReactMethod
//     public void calllllllllll(Promise phamtuan) {
//     try {
//         phamtuan.resolve("calllllllllll");
//     } catch(Exception e) {
//         phamtuan.reject("Create Event Error", e);
//     }

    

//     }

// }