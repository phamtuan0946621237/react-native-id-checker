package com.idchecker

import android.content.Intent
import android.util.Log
import com.facebook.react.bridge.*
import com.fis.nfc.sdk.nfc.stepNfc.NFCStepActivity
import com.fis.nfc.sdk.nfc.util.CustomNfcSdk
import com.fis.nfc.sdk.nfc.util.CustomSdk


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

    @ReactMethod
    fun checkId(onEndCheck: Callback) {
        CustomSdk.baseUrl = "https://apig.idcheck.xplat.online/"
// set token for call api
        CustomSdk.accessToken =
            "eyJ4NXQiOiJOMkpqTWpOaU0yRXhZalJrTnpaalptWTFZVEF4Tm1GbE5qZzRPV1UxWVdRMll6YzFObVk1TlEiLCJraWQiOiJNREpsTmpJeE4yRTFPR1psT0dWbU1HUXhPVEZsTXpCbU5tRmpaalEwWTJZd09HWTBOMkkwWXpFNFl6WmpOalJoWW1SbU1tUTBPRGRpTkRoak1HRXdNQV9SUzI1NiIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJuZ29jYngiLCJhdXQiOiJBUFBMSUNBVElPTl9VU0VSIiwiYXVkIjoiRHJ1X2t5WmNhNXRvSnQ2R09EX0dfS0trSmg4YSIsIm5iZiI6MTY2NTE0MTM1NCwiYXpwIjoiRHJ1X2t5WmNhNXRvSnQ2R09EX0dfS0trSmg4YSIsInNjb3BlIjoiZG9jX25mYyBsaXZlbmVzcyBvY3Igc2Vzc2lvbl8yMjEwMDcxODE1NTQiLCJpc3MiOiJodHRwczpcL1wvbG9jYWxob3N0Ojk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NjUxNTkzNTQsImlhdCI6MTY2NTE0MTM1NCwianRpIjoiMTcxZDc0YmQtZDM3Ni00NGE5LWJjMDMtODQzZWRlYjU4OTMxIn0.Mb2mFmA6jq7cu3UA5_xAT5sowrqd_2Dak6Zv2xRGEjMql8AdXsD1EA-M36jEgYoiUscG5O3zAK-saBKcUegJhxx12CJNbfkbbJxJoqiv7IIfvd5TpJ14A5jIuloesW8QMYKcThq4ZCSykLD9GU4DykxVol8suzHn4JslfSZXx8FO0wXuJFg0IvlGD8xdilom9YjxfPNgBUaMP-QFdiYKjCg51cf8QDLtzcdwrxEOYQSLdVcy6klKwsztWF2B_rNx9EEH2x7NsSZCVvOyyG-xAfoyEiZeA1PE2t2Dx6bCqk3YINrwEECiksndv7tI0Vg0Clx6fqc_GiJqldgmUrOdBA"
        // set id card
        CustomSdk.idCard = "014129890740"
//        CustomSdk.device_support = "helloo "
        // is check info from Ministry of Public Security
        CustomSdk.isCkeckBoCA = true
        // return when nfc success
        CustomNfcSdk.setNfcFinishCallback {result ->
            val resultData: WritableMap = WritableNativeMap()
            resultData.putBoolean("success", true);
            resultData.putString("message", "");
            resultData.putString("code", "200");
            resultData.putString("data", result.toString());
            onEndCheck.invoke(resultData)
        }
        // return when error
        CustomNfcSdk.setErrorCallback {
                error ->
            val resultData: WritableMap = WritableNativeMap()
            resultData.putBoolean("success", false);
            resultData.putString("message", error.toString());
            resultData.putString("code", "");
            resultData.putString("data", "");
            onEndCheck.invoke(resultData)
        }

        CustomNfcSdk.setErrorCodeCallback {resultCode ->
            val resultData: WritableMap = WritableNativeMap()
            resultData.putBoolean("success", false);
            resultData.putString("message", "");
            resultData.putString("code", resultCode.toString());
            resultData.putString("data", "");
            onEndCheck.invoke(resultData)
            //error code
        }

        val intent = Intent(this.reactApplicationContext, NFCStepActivity::class.java)
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        this.reactApplicationContext.startActivity(intent);
    }

    companion object {
        const val NAME = "IdChecker"
    }
}
