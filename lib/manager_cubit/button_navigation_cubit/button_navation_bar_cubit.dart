import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'button_navation_bar_state.dart';

class ButtonNavationBarCubit extends Cubit<ButtonNavationBarState> {
  ButtonNavationBarCubit() : super(ButtonNavationBarInitial());
  int index = 0;

  void changeIndex(int value) {
    index = value;
    emit(ButtonNavationBarSuccessState(index: index));
  }
}
