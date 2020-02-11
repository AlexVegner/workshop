import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds by type', (WidgetTester tester) async {
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

    expect(find.byType(Text), findsNWidgets(2));
  });
}
