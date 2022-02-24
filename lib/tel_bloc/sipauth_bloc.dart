import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SipAuthEvent {
  SipAuthEvent();

  factory SipAuthEvent.factory(String eventName) {
    SipAuthEvent result;

    switch (eventName) {
      case "Ok":
        result = SipAuthEventOk();
        break;
      case "Progress":
        result = SipAuthEventProgress();
        break;
      case "Failed":
        result = SipAuthEventFailed();
        break;
      default:
        result = SipAuthEventNone();
    }

    return result;
  }
}

class SipAuthEventOk extends SipAuthEvent {}
class SipAuthEventProgress extends SipAuthEvent {}
class SipAuthEventCleared extends SipAuthEvent {}
class SipAuthEventFailed extends SipAuthEvent {}
class SipAuthEventNone extends SipAuthEvent {}

enum SipAuthState { ok, progress, cleared, failed, none }

class SipAuthBloc extends Bloc<SipAuthEvent, SipAuthState> {
  SipAuthBloc() : super(SipAuthState.none) {
    on<SipAuthEventOk>((event, emit) => emit(SipAuthState.ok));
    on<SipAuthEventProgress>((event, emit) => emit(SipAuthState.progress));
    on<SipAuthEventCleared>((event, emit) => emit(SipAuthState.cleared));
    on<SipAuthEventFailed>((event, emit) => emit(SipAuthState.failed));
    on<SipAuthEventNone>((event, emit) => emit(SipAuthState.none));
  }
}
