import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_mvvm_riverpod/features/home/data/global_counter_provider.dart';

// This solution doesn't keep the dependencies clear. But it's easier to setup.
class HomeViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementGlobal(WidgetRef ref) {
    ref.read(globalCounterProvider.notifier).increment();
  }

  int watchGlobalCounter(WidgetRef ref) {
    return ref.watch(globalCounterProvider);
  }

  int readGlobalCounter(WidgetRef ref) {
    return ref.read(globalCounterProvider);
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}

// This solution sucks because it's too much boiler plate to setup and things to remember.
//  But it does keep the dependencies clear.
// class HomeViewModel extends ChangeNotifier {
//   int _counter = 0;
//   int get counter => _counter;

//   late int _globalCounter;
//   int get globalCounter => _globalCounter;

//   late WidgetRef _ref;

//   void init(WidgetRef ref) {
//     _ref = ref;
//     _globalCounter = ref.read(globalCounterProvider);
//   }

//   // We can clearly see the dependencies here.
//   void build() {
//     _ref.listen(globalCounterProvider, (prev, next) {
//       if (next != _globalCounter) {
//         _globalCounter = next;
//         notifyListeners();
//       }
//     });
//     // and watch others too
//   }

//   void incrementGlobal() {
//     _ref.read(globalCounterProvider.notifier).increment();
//   }

//   void incrementCounter() {
//     _counter++;
//     notifyListeners();
//   }
// }
