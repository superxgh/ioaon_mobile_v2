import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class SplashScreen extends StatelessWidget {
  final log = logger(SplashScreen);
  @override
  Widget build(BuildContext context) {
    log.i('build(BuildContext context)');
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_bottom,
            color: ColorConstants.darkGray,
            size: 30.0,
          ),
          Text(
            'loading...',
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
