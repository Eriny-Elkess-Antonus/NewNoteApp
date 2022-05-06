import 'package:flutter/material.dart';

mixin RouteMixin on Widget {
  MaterialPageRoute get route => MaterialPageRoute(
        builder: (_) => this,
        settings: RouteSettings(
          name: runtimeType.toString(),
        ),
      );
}
