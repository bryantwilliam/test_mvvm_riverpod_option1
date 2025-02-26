import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalCounterProvider = NotifierProvider<GlobalCounterNotifier, int>(
  GlobalCounterNotifier.new,
);

class GlobalCounterNotifier extends Notifier<int> {
  GlobalCounterNotifier();

  void increment() {
    state++;
  }

  @override
  int build() {
    return 4;
  }
}
