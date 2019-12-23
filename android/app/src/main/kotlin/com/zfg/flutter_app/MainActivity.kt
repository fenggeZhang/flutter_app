package com.zfg.flutter_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import org.jetbrains.annotations.NotNull

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NotNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
