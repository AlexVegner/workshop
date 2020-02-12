import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {

  test('rx ReplaySubject with multiple subscriptions', () async {
    // Geven
    final list = <int>[];
    final subject = BehaviorSubject<int>();

    // When
    subject.add(1);
    subject.add(2);
    subject.add(3);
    subject.value;
    final subscription = subject.stream.listen((value) => list.add(value)); 
    await Future.delayed(Duration(microseconds: 1));

    // Then
    expectLater(list, [3]);
    expectLater(subject, emitsInOrder([3]));
    expectLater(subject, emitsInOrder([3]));

    subscription.cancel();
    subject.close();
  });
}
