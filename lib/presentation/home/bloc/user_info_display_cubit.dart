import 'package:e_commerce_app/domain/auth/use_cases/get_user.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayLoading());

  void displayUserInfo() async {
    emit(UserInfoDisplayLoading());

    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold((message) {
      emit(UserInfoDisplayError(message: message));
    }, (data) {
      emit(UserInfoDisplayLoaded(user: data));
    });
  }
}
