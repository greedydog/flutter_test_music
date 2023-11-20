import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// 상태 클래스 정의
class CounterState {
  final int count;

  CounterState(this.count);
}

// Cubit 정의
class CounterCubit extends Cubit<CounterState> with WidgetsBindingObserver {
  CounterCubit() : super(CounterState(0)) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('App Lifecycle State: $state');
    // 여기에서 상태 변경 및 이벤트 처리 가능
  }
  // 상태 변경 메서드
  void increment() {
    emit(CounterState(state.count + 1));
  }

  void decrement() {
    emit(CounterState(state.count - 1));
  }
  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}