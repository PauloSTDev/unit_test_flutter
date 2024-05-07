import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/screens/home.dart';

void main() {
  testWidgets('Add a TODO', (tester) async {
    // Widgets that we need
    final addField = find.byKey(const Key("addField"));
    final addButton = find.byKey(const Key("addButton"));

    // Execute the  actual test
    await tester.pumpWidget(const MaterialApp(home: Home()));
    await tester.enterText(addField, "Testing Widgets - AddField");
    await tester.tap(addButton);
    await tester.pump(); // Rebuild your widget

    // Checkout outputs
    expect(find.text("Testing Widgets - AddField"), findsOneWidget);
  });
}
