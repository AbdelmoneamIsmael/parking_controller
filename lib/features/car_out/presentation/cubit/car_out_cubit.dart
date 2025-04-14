import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_controller/features/car_in_page/domain/entity/car_model.dart';
import 'package:parking_controller/features/car_out/presentation/cubit/car_out_state.dart';

class CarOutCubit extends Cubit<CarOutState> {
  CarOutCubit() : super(CarOutInitial());
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Future<void> close() {
    codeController.dispose();
    return super.close();
  }

  void onScanQrSucess() {
    emit(
      GetCarSuccess(
        carModel: CarModel(
          number: "XYZ 000",
          prepaid: 10,
          driverName: "abdelmoneam",
          phoneNumber: "01021016072",
          carColor: "0xFFD12F2F",
          carModel: "BMW",
          signTime: DateTime.now(),
          isPaid: true,
        ),
      ),
    );
  }

  void onCodeSubmit() {
    if (formKey.currentState!.validate()) {
      emit(
        GetCarSuccess(
          carModel: CarModel(
            number: "XYZ 000",
            prepaid: 10,
            driverName: "abdelmoneam",
            phoneNumber: "01021016072",
            carColor: "0xFFD12F2F",
            carModel: "BMW",
            signTime: DateTime.now(),
            isPaid: true,
          ),
        ),
      );
    }
  }
}
