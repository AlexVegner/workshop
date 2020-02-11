import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds by text', (WidgetTester tester) async {
    // Given
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: Column(
            children: <Widget>[
              Text('text 1'),
              Text('text 2'),
            ],
          ),
        ),
      ),
    );

    // When


    // Then 
    expect(find.text('text 1'), findsOneWidget);
  });
}
