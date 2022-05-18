
import '../../../shared/utils/datetime_picker/src/date_model.dart';
import '../../../shared/utils/datetime_picker/src/i18n_model.dart';

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
