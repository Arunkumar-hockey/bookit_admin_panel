import 'package:admin_panel/helpers/local_navigator.dart';
import 'package:admin_panel/widgets/custom_screen.dart';
import 'package:admin_panel/widgets/large_screen.dart';
import 'package:admin_panel/widgets/medium_screen.dart';
import 'package:admin_panel/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'helpers/responsiveness.dart';
import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ResponsiveWidget(
          largeScreen: const LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          ),
          mediumScreen: const MediumScreen(),
          customScreen: const CustomScreen(),
        ),
      ),
    );
  }
}
