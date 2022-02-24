import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SipCallEvent {

  SipCallEvent(){}

  factory SipCallEvent.factory(String eventName) {
    SipCallEvent result;

    switch (eventName) {
      case "IncomingReceived":
        result = SipCallEventIncomingReceived();
        break;
      case "OutgoingInit":
        result = SipCallEventOutgoingInit();
        break;
      case "OutgoingProgress":
        result = SipCallEventOutgoingProgress();
        break;
      case "OutgoingRinging":
        result = SipCallEventOutgoingRinging();
        break;
      case "OutgoingEarlyMedia":
        result = SipCallEventOutgoingEarlyMedia();
        break;
      case "Connected":
        result = SipCallEventConnected();
        break;
      case "StreamsRunning":
        result = SipCallEventStreamsRunning();
        break;
      case "End":
        result = SipCallEventEnd();
        break;
      case "Released":
        result = SipCallEventReleased();
        break;
      default:
        result = SipCallEventSipCallIdle();
    }
    return result;
  }
}


class SipCallEventSipCallIdle extends SipCallEvent {}
class SipCallEventIncomingReceived extends SipCallEvent {}
class SipCallEventPushIncomingReceived extends SipCallEvent {}
class SipCallEventOutgoingInit extends SipCallEvent {}
class SipCallEventOutgoingProgress extends SipCallEvent {}
class SipCallEventOutgoingRinging extends SipCallEvent {}
class SipCallEventOutgoingEarlyMedia extends SipCallEvent {}
class SipCallEventConnected extends SipCallEvent {}
class SipCallEventStreamsRunning extends SipCallEvent {}
class SipCallEventPausing extends SipCallEvent {}
class SipCallEventPaused extends SipCallEvent {}
class SipCallEventResuming extends SipCallEvent {}
class SipCallEventReferred extends SipCallEvent {}
class SipCallEventError extends SipCallEvent {}
class SipCallEventEnd extends SipCallEvent {}
class SipCallEventPausedByRemote extends SipCallEvent {}
class SipCallEventUpdatedByRemote extends SipCallEvent {}
class SipCallEventIncomingEarlyMedia extends SipCallEvent {}
class SipCallEventUpdating extends SipCallEvent {}
class SipCallEventReleased extends SipCallEvent {}
class SipCallEventEarlyUpdatedByRemote extends SipCallEvent {}
class SipCallEventEarlyUpdating extends SipCallEvent {}


enum SipCallState {
  sipCallIdle,
  incomingReceived,
  pushIncomingReceived,
  outgoingInit,
  outgoingProgress,
  outgoingRinging,
  outgoingEarlyMedia,
  connected,
  streamsRunning,
  pausing,
  paused,
  resuming,
  referred,
  error,
  end,
  pausedByRemote,
  updatedByRemote,
  incomingEarlyMedia,
  updating,
  released,
  earlyUpdatedByRemote,
  earlyUpdating,
}

class SipCallBloc extends Bloc<SipCallEvent, SipCallState> {
  SipCallBloc() : super(SipCallState.sipCallIdle) {





    on<SipCallEventSipCallIdle>((event, emit) => emit(SipCallState.sipCallIdle));
    on<SipCallEventIncomingReceived>((event, emit) => emit(SipCallState.incomingReceived));
    on<SipCallEventPushIncomingReceived>((event, emit) => {});
    on<SipCallEventOutgoingInit>((event, emit) => emit(SipCallState.outgoingInit));
    on<SipCallEventOutgoingProgress>((event, emit) => {});
    on<SipCallEventOutgoingRinging>((event, emit) => {});
    on<SipCallEventOutgoingEarlyMedia>((event, emit) => {});
    on<SipCallEventConnected>((event, emit) => emit(SipCallState.connected));
    on<SipCallEventStreamsRunning>((event, emit) => {});
    on<SipCallEventPausing>((event, emit) => {});
    on<SipCallEventPaused>((event, emit) => {});
    on<SipCallEventResuming>((event, emit) => {});
    on<SipCallEventReferred>((event, emit) => {});
    on<SipCallEventError>((event, emit) => {});
    on<SipCallEventEnd>((event, emit) => emit(SipCallState.end));
    on<SipCallEventPausedByRemote>((event, emit) => {});
    on<SipCallEventUpdatedByRemote>((event, emit) => {});
    on<SipCallEventIncomingEarlyMedia>((event, emit) => {});
    on<SipCallEventUpdating>((event, emit) => {});
    on<SipCallEventReleased>((event, emit) => emit(SipCallState.released));
    on<SipCallEventEarlyUpdatedByRemote>((event, emit) => {});
    on<SipCallEventEarlyUpdating>((event, emit) => {});
  }
}
