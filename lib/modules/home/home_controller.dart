import 'dart:math';

import 'package:ioaon_mobile_v2/api/api.dart';
import 'package:ioaon_mobile_v2/models/response/users_response.dart';
import 'package:ioaon_mobile_v2/modules/home/home.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final log = logger(HomeController);

  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;
  var users = Rxn<UsersResponse>();
  // var user = Rxn<Datum>();
  var user = {};

  late MainTab mainTab;
  late DiscoverTab discoverTab;
  late ResourceTab resourceTab;
  late InboxTab inboxTab;
  late MeTab meTab;

  @override
  void onInit() async {
    super.onInit();
    log.w('onInit()');
    loadUserByToken();
    mainTab = MainTab();
    discoverTab = DiscoverTab();
    resourceTab = ResourceTab();
    inboxTab = InboxTab();
    meTab = MeTab();
  }

  Future<void> loadUserByToken() async {
    log.w('loadUserByToken()');
    var prefs = Get.find<SharedPreferences>();
    String authToken = prefs.getString(StorageConstants.authToken) ?? '';
    log.w('authToken = $authToken');
    // var _users = await apiRepository.getUsers();
    // log.w('_users = $_users');
    // if (_users != null) {
    //   users.value = _users;
    //   _saveUserInfo(_users);
    // } else {
    //   // Goto login
    // }
  }

  Future<void> loadUsers() async {
    log.w('loadUsers()');
    var _users = await apiRepository.getUsers();
    log.w('_users = $_users');
    if (_users!.data!.length > 0) {
      users.value = _users;
      users.refresh();
      _saveUserInfo(_users);
    }
  }

  void signout() {
    log.w('signout()');
    var prefs = Get.find<SharedPreferences>();
    prefs.clear();

    // Get.back();
    NavigatorHelper.popLastScreens(popCount: 2);
  }

  void _saveUserInfo(UsersResponse users) {
    log.w('_saveUserInfo(UsersResponse users)');
    // var random = new Random();
    // var index = random.nextInt(users.data!.length);
    // user.value = users.data![index];
    // var prefs = Get.find<SharedPreferences>();
    // prefs.setString(StorageConstants.userInfo, users.data![index].toRawJson());

    // var userInfo = prefs.getString(StorageConstants.userInfo);
    // var userInfoObj = Datum.fromRawJson(xx!);
    // print(userInfoObj);
  }

  void switchTab(index) {
    log.w('switchTab(index)');
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    log.w('getCurrentIndex(MainTabs tab)');
    log.w('tab = $tab');
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.discover:
        return 1;
      case MainTabs.resource:
        return 2;
      case MainTabs.inbox:
        return 3;
      case MainTabs.me:
        return 4;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    log.w('_getCurrentTab(int index)');
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.discover;
      case 2:
        return MainTabs.resource;
      case 3:
        return MainTabs.inbox;
      case 4:
        return MainTabs.me;
      default:
        return MainTabs.home;
    }
  }
}
