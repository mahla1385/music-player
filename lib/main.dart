import 'dart:async';
import 'dart:io';

import 'package:music/api/config/config_http.dart';
import 'package:music/app/run_app.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(RunApp());
}


