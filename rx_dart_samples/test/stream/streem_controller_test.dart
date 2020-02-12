
import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('streem controller single subscription', () async {
    // Geven
    final streeemController = StreamController();

     // Then
    expectLater(streeemController.stream, emitsInOrder([1, 2, 3]));
    // StreamController can't have multiple subscription 
    //expectLater(streeemController.stream, emitsInOrder([1, 2, 3]));

    // When
    streeemController.sink.add(1);
    streeemController.sink.add(2);
    streeemController.sink.add(3);

    streeemController.close();
  });

  test('streem controller with multiple subscription', () async {
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