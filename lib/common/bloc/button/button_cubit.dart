import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  Future<void> execute({dynamic params, required Usecase useCase}) async {
    emit(ButtonLoading());
    try {
      Either returnedData = await useCase.call(params: params);

      returnedData.fold(
        (l) {
          emit(ButtonLoadFailure(l.toString()));
        },
        (r) {
          emit(ButtonLoaded());
        },
      );
    } catch (e) {
      emit(ButtonLoadFailure(e.toString()));
    }
  }
}
