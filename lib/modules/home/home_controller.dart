
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ioaon_mobile_v2/api/api.dart';
import 'package:ioaon_mobile_v2/models/response/user_response.dart';
import 'package:ioaon_mobile_v2/modules/home/home.dart';
import 'package:ioaon_mobile_v2/routes/app_pages.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class HomeController extends GetxController {
  final log = logger(HomeController);

  late ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;
  var user = Rxn<UserResponse>();
  var selectedDay = Rxn<DateTime>();
  // CalendarController calendarController;

  late MainTab mainTab;
  late DiscoverTab discoverTab;
  late ResourceTab resourceTab;
  late InboxTab inboxTab;
  late MeTab meTab;

  final name = 'name1'.obs;

  void changeName() => name.value = 'name3';

  @override
  void onInit() async {
    super.onInit();
    log.v('onInit()');
    name.value = 'name2';
    mainTab = MainTab();
    discoverTab = DiscoverTab();
    resourceTab = ResourceTab();
    inboxTab = InboxTab();
    meTab = MeTab();
  }

  @override
  void onReady() async {
    super.onReady();
    log.v('>>> onReady() in');
    EasyLoading.show(status: 'loading...');
    await loadUserByToken();
    selectedDay.value = DateTime.now();
    EasyLoading.dismiss();
    log.v('>>> onReady() out');
  }


  Future<void> loadUserByToken() async {
    try {
      log.v('>>> loadUserByToken() in');
      log.v('StorageService read token');
      String authToken = StorageService.read(StorageConstants.authToken);
      log.v('authToken = $authToken');
      var _usersResponse = await apiRepository.getUserByToken();
      log.v('_usersResponse = $_usersResponse');
      if (_usersResponse != null) {
        log.v('StorageService write user');
        StorageService.write(StorageConstants.user, _usersResponse);
        user.value = _usersResponse;
      } else {
        Get.toNamed(Routes.LOGIN);
      }
      log.v('>>> loadUserByToken() out');
    } catch (e) {
      log.v(e);
    }
  }

  Future<void> postTestHttp() async {
    try {
      log.v('>>> postTestHttp() in');
      var data = {
        "email": "eve.holt@reqres.in",
        "password": "pistol"
      };
      var _usersResponse = await apiRepository.getTestHttp(data);
      log.v('_usersResponse = $_usersResponse');
      if (_usersResponse != null) {
        log.v('StorageService write user');
        StorageService.write(StorageConstants.user, _usersResponse);
        user.value = _usersResponse;
      } else {
        Get.toNamed(Routes.LOGIN);
      }
      log.v('>>> postTestHttp() out');
    } catch (e) {
      log.v(e);
    }
  }

  Future<void> loadUsers() async {
    log.v('loadUsers()');
    // var _users = await apiRepository.getUsers();
    // log.v('_users = $_users');
    // if (_users!.data!.length > 0) {
    //   users.value = _users;
    //   users.refresh();
    //   _saveUserInfo(_users);
    // }
  }

  void signout() {
    log.v('signout()');
    PreferenceService.clear();
    StorageService.remove(StorageConstants.authToken);

    Get.offAllNamed(Routes.SPLASH);
    // Get.back();
    // NavigatorHelper.popLastScreens(popCount: 2);
  }

  void _saveUserInfo(UserResponse users) {
    log.v('_saveUserInfo(UsersResponse users)');
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
    log.v('switchTab(index)');
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    log.v('getCurrentIndex(MainTabs tab)');
    log.v('tab = $tab');
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
    log.v('_getCurrentTab(int index)');
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
