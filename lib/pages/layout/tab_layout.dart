import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teleheal_app/pages/layout/coming_soon_screen.dart';

import '../../config/size_config.dart';
import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int tabPages = 0;
  List<Widget> pages = [
    HomeScreen(),
    ComingSoonScreen(),
    ComingSoonScreen(),
    ComingSoonScreen()
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: colorPrimary,

      body: pages[tabPages],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`

            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: colorPrimary,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: colorNeutral))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: colorNeutral,
          selectedItemColor: colorPrimary,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w400, color: colorNeutral),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w700, color: colorPrimary),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: tabPages,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FaIcon(
                      FontAwesomeIcons.house,
                      color: tabPages == 0 ? colorPrimary : colorNeutral,
                    ))),
            BottomNavigationBarItem(
                label: "RS",
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FaIcon(
                      FontAwesomeIcons.hospital,
                      color: tabPages == 1 ? colorPrimary : colorNeutral,
                    ))),
            BottomNavigationBarItem(
                label: "Klinik",
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FaIcon(
                      FontAwesomeIcons.kitMedical,
                      color: tabPages == 2 ? colorPrimary : colorNeutral,
                    ))),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      color: tabPages == 3 ? colorPrimary : colorNeutral,
                    ))),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onTabTapped(int idx) {
    setState(() {
      tabPages = idx;
    });
  }
}
