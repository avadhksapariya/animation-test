import 'package:animation_test/screen_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animation screen test', (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(home: ScreenAnimation()));

    var containerFinder = find.byType(Container);
    var container = widgetTester.widget<Container>(containerFinder);

    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.purple.shade400);
    expect((container.decoration as BoxDecoration).borderRadius, BorderRadius.zero);

    await widgetTester.pumpAndSettle();

    containerFinder = find.byType(Container);
    container = widgetTester.widget<Container>(containerFinder);

    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.pink.shade400);
    expect((container.decoration as BoxDecoration).borderRadius, BorderRadius.circular(50.0));
  });
}
