part of 'button_navation_bar_cubit.dart';

@immutable
sealed class ButtonNavationBarState {}

final class ButtonNavationBarInitial extends ButtonNavationBarState {}

final class ButtonNavationBarSuccessState extends ButtonNavationBarState {
  final int index;

  ButtonNavationBarSuccessState({required this.index});
}
