# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\Android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#<<<<<<<<<<<<<<<<< Gson <<<<<<<<<<<<<<<<<
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature
# For using GSON @Expose annotation
-keepattributes *Annotation*
# Gson specific classes
-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.stream.** { *; }
# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { *; }
# Prevent proguard from stripping interface information from TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
#>>>>>>>>>>>>>>>>> Gson >>>>>>>>>>>>>>>>>

#<<<<<<<<<<<<<<<<< Glide <<<<<<<<<<<<<<<<<
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
#>>>>>>>>>>>>>>>>> Glide >>>>>>>>>>>>>>>>>

#<<<<<<<<<<<<<<<<< Retrofit2 <<<<<<<<<<<<<<<<<
-dontwarn java.nio.file.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-dontwarn okio.**
# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontnote retrofit2.Platform
# Platform used when running on RoboVM on iOS. Will not be used at runtime.
-dontnote retrofit2.Platform$IOS$MainThreadExecutor
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.
-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions
#>>>>>>>>>>>>>>>>> Retrofit2 >>>>>>>>>>>>>>>>>

#<<<<<<<<<<<<<<<<< Parcel <<<<<<<<<<<<<<<<<
-keep interface org.parceler.Parcel
-keep @org.parceler.Parcel class * { *; }
-keep class **$$Parcelable { *; }
#>>>>>>>>>>>>>>>>> Parcel >>>>>>>>>>>>>>>>>

#<<<<<<<<<<<<<<<<< RxJava <<<<<<<<<<<<<<<<<
-dontwarn sun.misc.**
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
   long producerIndex;
   long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
    rx.internal.util.atomic.LinkedQueueNode producerNode;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
    rx.internal.util.atomic.LinkedQueueNode consumerNode;
}
#>>>>>>>>>>>>>>>>> RxJava >>>>>>>>>>>>>>>>>

#<<<<<<<<<<<<<<<<< 友盟 <<<<<<<<<<<<<<<<< http://dev.umeng.com/analytics/android-doc/integration#1
-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}
-keep public class **.R$*{
public static final int *;
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
#>>>>>>>>>>>>>>>>> 友盟 >>>>>>>>>>>>>>>>>
