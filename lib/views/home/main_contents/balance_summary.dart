import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/utils/logging.dart';
import '../../../shared/utils/string.dart';

class BalanceSummary extends StatelessWidget {
  final double height;
  final double width;
  final String fullName;
  final double netAmount;
  const BalanceSummary(
      {Key? key,
      required this.fullName,
      required this.netAmount,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final log = logger(BalanceSummary);
    log.i('netAmount = $netAmount');
    return Stack(
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
              height: height * 0.24, //250,
              decoration: BoxDecoration(
                color: Colors.lightBlue[700], //Colors.indigo[400],
              )),
        ),
        Positioned(
          top: width * 0.10, //70
          left: width * 0.07, //30,
          child: Text(
            displayString(fullName + 'NNNNNNNNNN'),
            style: TextStyle(color: Colors.white, fontSize: width * 0.074 //30
                ),
          ),
        ),
        Positioned(
          top: height * 0.12, //30,
          bottom: 0.0,
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
                    bottom: width * 0.02,
                  ),
                  child: Text(
                    "net_amount".tr,
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: width * 0.05),
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
                          netAmount.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.lightBlue[700], //Colors.indigo[400],
                            fontWeight: FontWeight.bold,
                            fontSize:
                                _saldoTamanho(width, netAmount.toString()),
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
                              color:
                                  Colors.lightBlue[700], //Colors.indigo[400],
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
    );
  }

  _saldoTamanho(width, String conteudo) {
    if (conteudo.length > 8) {
      return width * 0.08;
    } else {
      return width * 0.1;
    }
  }
}
