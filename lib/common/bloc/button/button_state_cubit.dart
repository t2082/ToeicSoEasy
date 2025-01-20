import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeicsoeasy/common/bloc/button/button_state.dart';
import 'package:toeicsoeasy/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void excute(dynamic params, UseCase usecase) async {
    emit(ButtonLoadingState()); //Thông báo là cục button đã loading
    try {
      Either result = await usecase.call(params: params);
      result.fold((err) {
        log('Thất bại', name: "line 16, button_state_cubit.dart");
        emit(ButtonErrorState(message: err["msg"].toString()));
      }, (data) {
        log('Thành công', name: "line 19, button_state_cubit.dart");
        emit(ButtonSuccessState());
      });
    } catch (e) {
      emit(ButtonErrorState(message: e.toString()));
    }
  }

}
