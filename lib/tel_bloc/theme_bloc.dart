import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsip/theme.dart';

class ThemeState {
  final ThemeData? themeData;

  ThemeState({required this.themeData});
}

class ThemeEvent {
  final AppTheme appTheme;

  ThemeEvent({required this.appTheme});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppThemes.appThemeData[AppTheme.darkTheme])){ //вернуть лайт тему
    on<ThemeEvent>((event, emit) async {
      emit(ThemeState(themeData: AppThemes.appThemeData[event.appTheme]));
    });
  }

}
