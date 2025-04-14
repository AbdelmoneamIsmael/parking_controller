import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/time.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:parking_controller/features/car_in_page/domain/entity/car_model.dart';
import 'package:parking_controller/features/car_in_page/presentation/cubit/car_in_page_state.dart';

class CarInPageCubit extends Cubit<CarInPageState> {
  CarInPageCubit() : super(CarInPageInitial()) {
    carColorController.text = "0xff000000";
    carInTimeController.text = DateFormat(
      'yyyy-MM-dd H:mm a',
    ).format(selectedDateTime);
  }
  TextEditingController carNumberController = TextEditingController();
  TextEditingController driverNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController driverPhoneController = TextEditingController();
  TextEditingController carInTimeController = TextEditingController();
  TextEditingController prePaidController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPrePaid = false;
  DateTime selectedDateTime = DateTime.now();
  @override
  Future<void> close() {
    carNumberController.dispose();
    driverNameController.dispose();
    dateController.dispose();
    carColorController.dispose();
    carTypeController.dispose();
    driverPhoneController.dispose();
    carInTimeController.dispose();
    prePaidController.dispose();
    return super.close();
  }

  void changeCarColor(Color c) {
    carColorController.text = "0x${c.toHexString()}";
    emit(CarChangeColor());
  }

  void changeCarInTime(DateTime date, TimeOfDay time) {
    selectedDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    carInTimeController.text =
        carInTimeController.text = DateFormat(
          'yyyy-MM-dd h:mm a',
        ).format(selectedDateTime);
    emit(CarChangeInTime());
  }

  onSubmit() {
    if (formKey.currentState!.validate()) {
      CarModel carModel = CarModel(
        isPaid: isPrePaid,
        number: carNumberController.text,
        prepaid: int.parse(prePaidController.text),
        driverName: driverNameController.text,
        phoneNumber: driverPhoneController.text,
        carColor: carColorController.text,
        carModel: carTypeController.text,
        signTime: selectedDateTime,
      );
      print(carModel);
      emit(CarInPageSuccess());
    }
  }

  void onPrePaidChanged(bool value) {
    isPrePaid = value;
    emit(CarChangePrePaid());
  }
}
