import 'package:flutter/material.dart';
import 'package:uet_comic/config_wraper.dart';
import 'package:uet_comic/main.dart';
import 'package:uet_comic/src/env/prod.dart';
import 'package:uet_comic/src/models/config.dart';

void main() => runApp(
    ConfigWrapper(config: Config.fromJson(config), child: MyApp()));
