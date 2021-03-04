import 'package:flutter/widgets.dart';
import 'package:new_ivara_app/lib.dart';

Map<String, Widget Function(BuildContext)> routesMap() => {
      '/UserType': (_) => UserType(),
    };
