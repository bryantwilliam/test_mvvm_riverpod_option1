import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_mvvm_riverpod/features/home/ui/home.dart';
import 'package:test_mvvm_riverpod/features/home/ui/home_viewmodel.dart';

void main() {
  testWidgets('Increment button adds 1 to local text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: HomePage(HomeViewModel()))),
    );

    final localCounterButton = find.text('Increment Counter');
    final globalCounterButton = find.text('Increment Global');

    expect(localCounterButton, findsOneWidget);
    expect(globalCounterButton, findsOneWidget);
    expect(find.textContaining("Global"), findsNWidgets(3));
    expect(find.textContaining("Local"), findsOneWidget);

    expect(find.textContaining('0'), findsOneWidget);
    expect(find.textContaining('1'), findsNothing);

    await tester.tap(localCounterButton);
    await tester.pump();

    expect(find.textContaining('0'), findsNothing);
    expect(find.textContaining('1'), findsOneWidget);
  });
}
