import 'dart:io';
import 'dart:async';
import 'dart:isolate';

Isolate isolate;

void start() async {
  final receivePort= ReceivePort(); //port for this main isolate to receive messages.
  isolate = await Isolate.spawn(runTimer, receivePort.sendPort);
  receivePort.listen((data) {
    stdout.write('RECEIVE: ' + data + ', \n');
  });
}

void runTimer(SendPort sendPort) {
  var counter = 0;
  Timer.periodic(Duration(seconds: 1), (Timer t) {
    counter++;
    final msg = 'notification ' + counter.toString();  
    stdout.write('SEND: ' + msg + ' - ');  
    sendPort.send(msg);
  });
}

void stop() {  
  if (isolate != null) {
      stdout.writeln('killing isolate');
      isolate.kill(priority: Isolate.immediate);
      isolate = null;        
  }  
}

void main() async {
  stdout.writeln('spawning isolate...');
  await start();
  stdout.writeln('press enter key to quit...');
  await stdin.first;
  stop();
  stdout.writeln('goodbye!');
  exit(0);
}