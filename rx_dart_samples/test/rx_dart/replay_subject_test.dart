import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test('rx ReplaySubject with multiple subscriptions', () async {
    // Geven
    final list = <int>[];
    final subject = ReplaySubject<int>();

    // When
    subject.add(1);
    subject.add(2);
    subject.add(3);
    final subscription = subject.stream.listen((value) => list.add(value)); 
    await Future.delayed(Duration(seconds: 1));

    // Then
    expectLater(list, [1, 2, 3]);
    expectLater(subject, emitsInOrder([1, 2, 3]));
    expectLater(subject, emitsInOrder([1, 2, 3]));

    subscription.cancel();
    subject.close();
  });

  test('rx ReplaySubject with multiple subscriptions with max size', () async {
    // Geven
    final list = <int>[];
    final subject = ReplaySubject<int>(maxSize: 2);

    // When
    subject.add(1);
    subject.add(2);
    subject.add(3);
    final subscription = subject.stream.listen((value) => list.add(value)); 
    await Future.delayed(Duration(seconds: 1));

    // Then
    expectLater(list, [2, 3]);
    expectLater(subject, emitsInOrder([2, 3]));
    expectLater(subject, emitsInOrder([2, 3]));

    subscription.cancel();
    subject.close();
  });
}
