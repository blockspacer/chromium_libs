/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.example.hellojni;

import org.chromium.base.CalledByNative;
import org.chromium.base.JNINamespace;

import android.app.Activity;
import android.util.Log;
import android.widget.TextView;
import android.os.Bundle;

@JNINamespace("app")
public class HelloJni extends Activity
{
    private static final String TAG = HelloJni.class.getSimpleName();
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        /* Create a TextView and set its content.
         * the text is retrieved by calling a native
         * function.
         */
        TextView  tv = new TextView(this);
        tv.setText( nativeGetString() );
        //tv.setText( "hello world" );
        setContentView(tv);
        nativeLogVendor();
    }

    @CalledByNative
    private void someJavaMethod(String message) {
        Log.d(TAG, "SomeJavaMethod(), message from native: " + message);
    }

    /* A native method that is implemented by the
     * 'hello-jni' native library, which is packaged
     * with this application.
     */
    private native String nativeGetString();
    private static native void nativeLogVendor();
}
