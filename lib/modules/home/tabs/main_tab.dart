import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/models/response/users_response.dart';
import 'package:ioaon_mobile_v2/modules/home/home.dart';
import 'package:ioaon_mobile_v2/shared/constants/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class MainTab extends GetView<HomeController> {

  final log = logger(MainTab);

  @override
  Widget build(BuildContext context) {
    log.w('build(BuildContext context)');
    return Text('main');
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
    log.w('_buildGridView()');
    log.w('_buildGridView()');
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

  List<Datum>? get data {
    return controller.users.value == null ? [] : controller.users.value!.data;
  }
}
