import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ioaon_mobile_v2/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class MainTab extends GetView<HomeController> {

  final log = logger(MainTab);
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    log.i('>>> build(BuildContext context) in');
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Obx(
          () {
            var _user = controller.user.value;
            log.i('user = $_user');
            return Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: height * 0.334, //0.334, //300,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          width: double.infinity,
                          height: height * 0.28, //250,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[700], //Colors.indigo[400],
                          )),
                    ),
                    Positioned(
                      top: width * 0.18, //70
                      left: width * 0.07, //30,
                      child: Text(
                        _user?.fullName ?? 'Loading....',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.074 //30
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: width * 0.07, // 30,
                      right: width * 0.07, // 30,
                      child: Container(
                        height: height * 0.16, //150,
                        width: width * 0.1, // 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400]!,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.05,
                                top: width * 0.04,
                                bottom: width * 0.02,
                              ),
                              child: Text(
                                "net_amount".tr,
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: width * 0.05),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.05),
                                  child: Container(
                                    width: width * 0.6,

                                    child: Text(
                                      "1,200.00",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors
                                            .lightBlue[700], //Colors.indigo[400],
                                        fontWeight: FontWeight.bold,
                                        fontSize: _saldoTamanho("1,200.00"),
                                        //width * 0.1 //_saldoTamanho(saldoAtual)
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.04),
                                  child: GestureDetector(
                                    onTap: () {
                                      // _dialogAddRecDesp();
                                      /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddReceita()));
                                 */
                                    },
                                    child: Container(
                                      width: width * 0.12,
                                      height: width * 0.12, //65,
                                      decoration: BoxDecoration(
                                          color: Colors
                                              .lightBlue[700], //Colors.indigo[400],
                                          borderRadius: BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 7,
                                              offset: Offset(2, 2),
                                            )
                                          ]),
                                      child: Icon(
                                        Icons.add,
                                        size: width * 0.07,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.008,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          }
    );
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

  _saldoTamanho(String conteudo) {
    if (conteudo.length > 8) {
      return width * 0.08;
    } else {
      return width * 0.1;
    }
  }

  // List<Datum>? get data {
  //   return controller.users.value == null ? [] : controller.users.value!.data;
  // }
}
