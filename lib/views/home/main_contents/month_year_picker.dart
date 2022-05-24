
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../shared/utils/date_time.dart';
import '../../../shared/utils/datetime_picker/flutter_datetime_picker.dart';
import '../../../shared/utils/datetime_picker/src/date_model.dart';
import '../../../shared/utils/datetime_picker/src/i18n_model.dart';

class MonthAndYearSelector extends StatelessWidget {

  final DateChangedCallback? onConfirm;
  final DateTime dateTime;

  const MonthAndYearSelector({Key? key, this.onConfirm, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          DatePicker.showPicker(context,
              pickerModel: MonthYearPicker(
                  minTime: DateTime(2020, 1, 1),
                  maxTime: DateTime.now(),
                  currentTime: DateTime.now(),
                  locale: LocaleType.th
              ),
              onConfirm: onConfirm,
              showTitleActions: true);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            getDateTxtYYYYMM(dateTime, Get.locale),
            style: TextStyle(color: Colors.blue, fontSize: 25.0),
          ),
        ));
  }
}




class MonthYearPicker extends DatePickerModel {

  MonthYearPicker({
    DateTime? currentTime,
    DateTime? maxTime,
    DateTime? minTime,
    LocaleType? locale}) : super(
      currentTime: currentTime,
      maxTime: maxTime,
      minTime: minTime,
      locale: locale
  );

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }

}
