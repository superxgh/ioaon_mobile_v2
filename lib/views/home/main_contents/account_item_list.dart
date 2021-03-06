import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountItemList extends StatelessWidget {
  final double height;
  final double width;
  final String fullName;

  const AccountItemList(
      {Key? key,
      required this.height,
      required this.width,
      required this.fullName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> accountList = [
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "100.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "200.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "300.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "400.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "500.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "600.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "700.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "800.00"
      },
      {
        "date": "01-08-2022",
        "time": "12:24",
        "label": "ค่าน้ำ",
        "amount": "900.00"
      }
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: width * 0.7,
                    child: Text(
                      "account_item_list".tr,
                      style: TextStyle(
                          color: Colors.grey[600], fontSize: width * 0.07),
                    ),
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
          ...accountList.map((e) => _buildAccountItemView(e)).toList()
        ],
      ),
    );
  }

  Widget _buildAccountItemView(dynamic item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    item['label'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    item['amount'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  item['date'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                ),
                Text(
                  ' [${item['time']}]',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
