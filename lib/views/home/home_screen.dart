import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/controllers/home/home_controller.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';
import 'package:ioaon_mobile_v2/views/home/tabs/tabs.dart';

class HomeScreen extends GetView<HomeController> {
  final log = logger(HomeScreen);

  @override
  Widget build(BuildContext context) {
    log.i('build(BuildContext context)');

    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    log.i('_buildWidget()');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[700],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'images/profiles/aaa.png'), //NetworkImage(dummyAvatarUrl),
              radius: 20,
            ),
          ),
          // Text('MyProfile'),
        ],
      ),
      body: _buildContent(controller.currentTab.value),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem(
            "home".tr,
            MainTabs.home == controller.currentTab.value
                ? "icon_home_activited.svg"
                : "icon_home.svg",
          ),
          _buildNavigationBarItem(
            "discover".tr,
            MainTabs.discover == controller.currentTab.value
                ? "icon_discover_activited.svg"
                : "icon_discover.svg",
          ),
          _buildNavigationBarItem(
            "resource".tr,
            "icon_resource.svg",
          ),
          _buildNavigationBarItem(
            "inbox".tr,
            MainTabs.inbox == controller.currentTab.value
                ? "icon_inbox_activited.svg"
                : "icon_inbox.svg",
          ),
          _buildNavigationBarItem(
            "me".tr,
            MainTabs.me == controller.currentTab.value
                ? "icon_me_activited.svg"
                : "icon_me.svg",
          )
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.black,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedItemColor: ColorConstants.black,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => controller.switchTab(index),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    // log.i('_buildContent(MainTabs tab)');
    switch (tab) {
      case MainTabs.home:
        return controller.mainTab;
      case MainTabs.discover:
        return controller.discoverTab;
      case MainTabs.resource:
        return controller.resourceTab;
      case MainTabs.inbox:
        return controller.inboxTab;
      case MainTabs.me:
        return controller.meTab;
      default:
        return controller.mainTab;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, String svg) {
    // log.i('_buildNavigationBarItem(String label, String svg)');
    // log.i('label = $label');
    // log.i('svg = $svg');
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/$svg'),
      label: label,
    );
  }
}
