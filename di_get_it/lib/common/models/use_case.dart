import 'package:equatable/equatable.dart';

// UseCases can be Streams
// abstract class UseCase<Type, Payload> {
//   Stream<Either<Failure, Type>> call(Payload payload);
// }

abstract class UseCase<Type, Payload> {
  Future<Type> call(Payload payload);
}

class NoPayload extends Equatable {
  const NoPayload();

  List<Object> get props => [];
}
