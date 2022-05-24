import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/controllers/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';
import '../main_contents/account_summary.dart';
import '../main_contents/month_year_picker.dart';

class MainTab extends GetView<HomeController> {
  final log = logger(MainTab);

  @override
  Widget build(BuildContext context) {
    log.i('>>> build(BuildContext context) in');
    log.i('key = $key');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Column(
      children: [
        Obx(() {
          return AccountSummary(
              width: width, height: height, fullName: controller.user.value?.fullName ?? '', netAmount: 4000.0);
        }),
        Obx(() {
          log.i('before return selectedDay = ${controller.selectedDay.value}');
          return (controller.selectedDay.value == null)
            ? Text('Loading....')
            : MonthAndYearSelector(
            dateTime: controller.selectedDay.value!,
            onConfirm: (date) {
              controller.selectedDay.value = date;
            },
          );
        }),

        // TODO Display income and expense summary
      ],
    ));
    /*
    Scaffold(
      body: Obx(
        () => RefreshIndicator(
          child: _buildGridView(),
          onRefresh: () => controller.loadUsers(),
        ),
      ),
    );
    */
  }

  Widget _buildGridView() {
    log.i('>>> _buildGridView() in');
    return Text('main');
    /*
    MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) => new Container(
        color: ColorConstants.lightGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('${data![index].lastName} ${data![index].firstName}'),
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: data![index].avatar ??
                  'https://reqres.in/img/faces/1-image.jpg',
              placeholder: (context, url) => Image(
                image: AssetImage('assets/images/icon_success.png'),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text('${data![index].email}'),
          ],
        ),
      ),
      // staggeredTileBuilder: (int index) =>
      //     new StaggeredTile.count(2, index.isEven ? 3 : 2),
    );

     */
  }

// List<Datum>? get data {
//   return controller.users.value == null ? [] : controller.users.value!.data;
// }
}
