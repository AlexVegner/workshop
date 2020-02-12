
import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('stream map', () {
    // Geven
    final stream = Stream.fromIterable([1,2,3]);

    // When
    final convertedStreem = stream.map((value) => value + 1);

    // Then
    expectLater(convertedStreem, emitsInOrder([2,3,4]));
  });

  test('periodic map', () async {
    // Geven
    final stream = Stream.periodic(Duration(microseconds: 1), (value) => value);

    // Then
    expectLater(stream, emitsInOrder([0, 1, 2, 3]));
    //expectLater(stream, emitsInOrder([0, 1, 2, 3]));
  });

  test('streem take one item', () async {
    // Geven
    final stream1 = Stream.fromIterable([1,2,3]);

    // When
    final resultStreen = stream1.take(2);

    // Then
    expectLater(resultStreen, emitsInOrder([1, 2]));
  });

  test('streem controller single subscription', () async {
    // Geven
    final streeemController = StreamController();

     // Then
    expectLater(streeemController.stream, emitsInOrder([1, 2, 3]));
    // StreamController can't have multiple subscription 
    // expectLater(streeemController.stream, emitsInOrder([1, 2, 3]));

    // When
    streeemController.sink.add(1);
    streeemController.sink.add(2);
    streeemController.sink.add(3);

    streeemController.close();
  });

  test('streem controller single subscription', () async {
    // Geven
    final streeemController = StreamController.broadcast();

     // Then
    expectLater(streeemController.stream, emitsInOrder([1, 2, 3]));
    // StreamController.broadcast allow to have multiple subscription 
    expectLater(streeemController.stream, emitsInOrder([1, 2, 3]));

    // When
    streeemController.sink.add(1);
    streeemController.sink.add(2);
    streeemController.sink.add(3);

    streeemController.close();
  });


}