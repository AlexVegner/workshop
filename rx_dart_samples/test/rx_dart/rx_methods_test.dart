import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test('rx buffer ', () async {
    // Geven
    final streem = Stream.periodic(Duration(milliseconds: 100), (i) => i)
        .buffer(Stream.periodic(Duration(milliseconds: 160), (i) => i));
    // .listen(print); // prints [0, 1] [2, 3] [4, 5] ...

    // When

    // Then
    expectLater(
        streem,
        emitsInOrder([
          [0, 1],
          [2, 3]
        ]));
  });


  test('rx buffer ', () async {
    // Geven
    final streem = Stream.periodic(Duration(milliseconds: 100), (i) => i)
        .buffer(Stream.periodic(Duration(milliseconds: 160), (i) => i));
    // .listen(print); // prints [0, 1] [2, 3] [4, 5] ...

    // When

    // Then
    expectLater(
        streem,
        emitsInOrder([
          [0, 1],
          [2, 3]
        ]));
  });

  test('rx debounds ', () async {
    // Geven
    final streem = Stream.fromIterable([1, 2, 3, 4])
      .debounce((_) => TimerStream(true, Duration(seconds: 1)));

    // When

    // Then
    expectLater(
        streem,
        emitsInOrder([
          4,
        ]));
  });

  test('rx throttle ', () async {
    // Geven
    final streem = Stream.periodic(Duration(milliseconds: 100), (i) => i)
      .throttle((_) => Stream.periodic(Duration(milliseconds: 200)));

    // When

    // Then
    expectLater(
        streem,
        emitsInOrder([
          0, 3,
        ]));
    
  });
}
