import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ioaon_mobile_v2/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';
import '../../../lang/translation_service.dart';
import '../../../shared/utils/date_time.dart';
import '../../../shared/utils/string.dart';
import '../main_contents/account_summary.dart';
import '../main_contents/month_year_picker.dart';

class MainTab extends GetView<HomeController> {
  final log = logger(MainTab);

  @override
  Widget build(BuildContext context) {
    log.i('>>> build(BuildContext context) in');
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return AccountSummary(
                  width: width,
                  height: height,
                  fullName: controller.user.value?.fullName ?? '',
                  netAmount: 4000.0);
            }
            ),
            Obx(() {
              log.i('before return selectedDay = ${controller.selectedDay.value}');

              return TextButton(
                  onPressed: () {

                    DatePicker.showPicker(context,
                        pickerModel: MonthYearPicker(
                            minTime: DateTime(2020, 1, 1),
                            maxTime: DateTime.now(),
                            currentTime: DateTime.now(),
                            locale: LocaleType.th
                        ),
                        onConfirm: (date) {
                          controller.selectedDay.value = date;
                        },
                        showTitleActions: true);

                  },
                  child: Text(
                    getDateTxtYYYYMM(controller.selectedDay.value!, Get.locale),
                    style: TextStyle(color: Colors.blue, fontSize: 25.0),
                  ));
            }),
            Padding(
                padding:
                EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Movimentações",
                      style: TextStyle(
                          color: Colors.grey[600], fontSize: width * 0.04),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: Icon(
                        Icons.sort,
                        size: width * 0.07,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            )
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
