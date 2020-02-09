import 'dart:io';

class NoConnectionError extends IOException {
  @override
  String toString() => "NoConnectionError";
}