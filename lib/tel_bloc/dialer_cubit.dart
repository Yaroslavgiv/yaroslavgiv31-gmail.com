import 'package:flutter_bloc/flutter_bloc.dart';

class DialerCubit extends Cubit<bool>{
  DialerCubit() : super(true);

  void toggleDialpad(){
    emit(!state);
  }
}