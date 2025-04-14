import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/time.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:parking_controller/features/car_in_page/presentation/cubit/car_in_page_state.dart';

class CarInPageCubit extends Cubit<CarInPageState> {
  CarInPageCubit() : super(CarInPageInitial()) {
    carColorController.text = "0xff000000";
    carInTimeController.text = formate;
  }
  TextEditingController carNumberController = TextEditingController();
  TextEditingController driverNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController driverPhoneController = TextEditingController();
  TextEditingController carInTimeController = TextEditingController();
  @override
  Future<void> close() {
    carNumberController.dispose();
    driverNameController.dispose();
    dateController.dispose();
    carColorController.dispose();
    carTypeController.dispose();
    driverPhoneController.dispose();
    carInTimeController.dispose();
    return super.close();
  }

  void changeCarColor(Color c) {
    carColorController.text = "0x${c.toHexString()}";
    emit(CarChangeColor());
  }

  void changeCarInTime(DateTime date, TimeOfDay time) {
    carInTimeController.text =
        "${date.year}-${date.month}-${date.day} ${time.hour}:${time.minute}";
    emit(CarChangeInTime());
  }
}
