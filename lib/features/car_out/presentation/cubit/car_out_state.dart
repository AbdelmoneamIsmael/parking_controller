import 'package:parking_controller/features/car_in_page/domain/entity/car_model.dart';

abstract class CarOutState {}

class CarOutInitial extends CarOutState {}

class GetCarSuccess extends CarOutState {
  GetCarSuccess({ required this.carModel});
  CarModel carModel;
}
