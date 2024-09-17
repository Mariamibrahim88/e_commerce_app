abstract class ButtonState {}

class ButtonInitial extends ButtonState {}

class ButtonLoading extends ButtonState {}

class ButtonLoaded extends ButtonState {}

class ButtonLoadFailure extends ButtonState {
  final String message;
  ButtonLoadFailure(this.message);
}
