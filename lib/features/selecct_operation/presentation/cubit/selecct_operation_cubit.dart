import 'package:bloc/bloc.dart';
import 'package:parking_controller/features/selecct_operation/presentation/cubit/selecct_operation_state.dart';


class SelecctOperationCubit extends Cubit<SelecctOperationState> {
  SelecctOperationCubit() : super(SelecctOperationInitial());
}
