import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';
import 'package:teleheal_app/config/size_config.dart';
import 'package:teleheal_app/pages/auth/login_screen.dart';
import 'package:teleheal_app/widget/horizontal_scroll_child.dart';
import 'package:teleheal_app/widget/list_child_home.dart';
import 'package:teleheal_app/widget/long_button.dart';
import 'package:teleheal_app/widget/small_button.dart';
import 'package:teleheal_app/widget/tab_bar_child.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabControllerRS;
  TabController _tabControllerKlinik;
  List<String> nameRS = ['Rumah Sakit 1', "Rumah Sakit 2", "Rumah Sakit 3"];
  int rsTabIndex = 0;
  int klinikTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabControllerRS = TabController(vsync: this, length: 4);
    _tabControllerRS.addListener(() {
      _handleChangeRS();
    });
    _tabControllerKlinik = TabController(vsync: this, length: 3);
    _tabControllerKlinik.addListener(() {
      _handleChangeKlinik();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125,
        backgroundColor: colorWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              height5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/images/logo-comp.jpg'),
                    backgroundColor: colorPrimary,
                    radius: 18,
                  ),
                  width20,
                  Flexible(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Teleheal",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                  width20,
                  InkWell(
                    child: FaIcon(
                      FontAwesomeIcons.bell,
                      color: colorPrimary,
                      size: 22,
                    ),
                  )
                ],
              ),
              height10,
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {},
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastOutSlowIn,
                      width: double.infinity,
                      height: 38,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: colorError,
                          borderRadius: BorderRadius.circular(3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Emergency Button ",
                            style: TextStyle(color: colorWhite, fontSize: 13),
                          ),
                          width10,
                          FaIcon(
                            FontAwesomeIcons.triangleExclamation,
                            color: colorWhite,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  )),
                  width10,
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(3)),
                    height: 38,
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Status: ',
                          style: TextStyle(
                              fontSize: 13,
                              color: colorWhite,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Healthy',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rumah Sakit",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SmallButton(
                    bgColor: Colors.greenAccent,
                    text: "Lihat Semua",
                    callback: () {},
                  )
                ],
              ),
              height10,
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    physics: AlwaysScrollableScrollPhysics(),
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.only(right: 10, top: 0, bottom: 0),
                    labelColor: colorPrimary,
                    controller: _tabControllerRS,
                    unselectedLabelColor: colorNeutral,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                          child: TabBarChild(
                        name: "Semua",
                        active: rsTabIndex == 0,
                      )),
                      Tab(
                          child: TabBarChild(
                        name: "BPJS",
                        active: rsTabIndex == 1,
                      )),
                      Tab(
                          child: TabBarChild(
                        name: "Partner",
                        active: rsTabIndex == 2,
                      )),
                      Tab(
                          child: TabBarChild(
                        name: "Terdekat",
                        active: rsTabIndex == 3,
                      ))
                    ]),
              ),
              SizedBox(
                height: 200,
                width: SizeConfig.screenWidth,
                child: TabBarView(
                    controller: _tabControllerRS,
                    physics: NeverScrollableScrollPhysics(),
                    children: [rsChild(), rsChild(), rsChild(), rsChild()]),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const HorizontalScrollChild(
                        width: 200,
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Klinik",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SmallButton(
                    bgColor: Colors.greenAccent,
                    text: "Lihat Semua",
                    callback: () {},
                  )
                ],
              ),
              height10,
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.only(right: 10, top: 0, bottom: 0),
                    labelColor: colorPrimary,
                    controller: _tabControllerKlinik,
                    unselectedLabelColor: colorNeutral,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                          child: TabBarChild(
                        name: "Semua",
                        active: klinikTabIndex == 0,
                      )),
                      Tab(
                          child: TabBarChild(
                        name: "BPJS",
                        active: klinikTabIndex == 1,
                      )),
                      Tab(
                          child: TabBarChild(
                        name: "Partner",
                        active: klinikTabIndex == 2,
                      )),
                    ]),
              ),
              SizedBox(
                height: 200,
                width: SizeConfig.screenWidth,
                child: TabBarView(
                    controller: _tabControllerKlinik,
                    physics: NeverScrollableScrollPhysics(),
                    children: [rsChild(), rsChild(), rsChild()]),
              )
            ],
          ),
        ),
      ),
    );
  }

  _handleChangeRS() {
    setState(() {
      rsTabIndex = _tabControllerRS.index;
      print(rsTabIndex);
    });
  }

  _handleChangeKlinik() {
    setState(() {
      klinikTabIndex = _tabControllerKlinik.index;
    });
  }

  Widget rsChild() {
    return Column(
      children: [
        ...nameRS.map((list) => ListChildHome(
              text: list,
              alamat: "Jalan ${list}",
              id: "0",
              callbackDetail: () {},
            ))
      ],
    );
  }
}
