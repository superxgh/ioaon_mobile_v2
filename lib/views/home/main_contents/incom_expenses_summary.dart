import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/utils/logging.dart';
import '../../../shared/utils/string.dart';

class IncomExpensesSummary extends StatelessWidget {
  final double height;
  final double width;
  final String fullName;
  final double netAmount;
  const IncomExpensesSummary({
    Key? key,
    required this.fullName,
    required this.netAmount,
    required this.height,
    required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final log = logger(IncomExpensesSummary);
    log.i('netAmount = $netAmount');
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: height * 0.1, //0.334, //300,
            color: Colors.white,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                width: double.infinity,
                height: height * 0.1, //250,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[700], //Colors.indigo[400],
                )),
          ),
          Positioned(
            top: 10.0,
            left: width * 0.08, // 30,
            right: width * 0.07, // 30,
            child: Row(
              children: [
                _buildAccountLabel("income".tr),
                SizedBox(width: width * 0.03),
                _buildAccountLabel("expenses".tr),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAccountLabel(String text){
    return Container(
      // height: height * 0.16, //150,
      width: width * 0.40, // 70,
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
              text,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: width * 0.05),
            ),
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Padding(
          //       padding: EdgeInsets.only(left: width * 0.05),
          //       child: Container(
          //         width: width * 0.8,
          //
          //         child: Text(
          //           netAmount.toString(),
          //           overflow: TextOverflow.ellipsis,
          //           style: TextStyle(
          //             color: Colors
          //                 .lightBlue[700], //Colors.indigo[400],
          //             fontWeight: FontWeight.bold,
          //             fontSize: _saldoTamanho(width, netAmount.toString()),
          //             //width * 0.1 //_saldoTamanho(saldoAtual)
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: height * 0.008,
          )
        ],
      ),
    );
  }

}
