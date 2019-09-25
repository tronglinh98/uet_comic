import 'package:flutter/material.dart';
import 'package:uet_comic/src/models/config.dart';

class ConfigWrapper extends StatelessWidget {

  final Config config;
  final Widget child;

  ConfigWrapper({Key key, this.config, this.child});

  @override
  Widget build(BuildContext context) {
    return new _InheritedConfig(config: this.config, child: this.child);
  }

  static Config of(BuildContext context) {
    final _InheritedConfig inheritedConfig =
        context.inheritFromWidgetOfExactType(_InheritedConfig);
    return inheritedConfig.config;
  }
}

class _InheritedConfig extends InheritedWidget {
  const _InheritedConfig(
      {Key key, @required this.config, @required Widget child})
      : assert(config != null),
        assert(child != null),
        super(key: key, child: child);
  final Config config;

  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) =>
      config != oldWidget.config;
}
