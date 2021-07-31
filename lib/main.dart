import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yolo/core/data/constants/app_constants.dart';
import 'package:yolo/feature/item_list_screen/items_screen.dart';
import 'package:yolo/feature/login_screen/login_screen.dart';

import 'feature/Error/error_page.dart';

void main() {
  runApp(Yolo());
}

class Yolo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Yolo App',
        theme: ThemeData.light().copyWith(
          primaryColor: primaryColor,
          // platform: TargetPlatform.android,
        ),
        initialRoute: Login.id,
        routes: {
          Login.id: (context) => Login(),
          ItemsScreen.id: (context) => ItemsScreen(),
          ErrorPage.id: (context) => ErrorPage(),
        },
      ),
    );
  }
}
