import 'package:fpdart/fpdart.dart';
import 'package:pasword_vault/common/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid<T> = FutureEither<void>;
