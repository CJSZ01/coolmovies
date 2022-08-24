abstract class Either<L, R> {
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight);
}

class Right<L, R> extends Either<L, R> {
  Right(this._value);
  final R _value;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifRight(_value);

  List<Object?> get props => [_value];
}

class Left<L, R> extends Either<L, R> {
  Left(this._value);
  final L _value;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifLeft(_value);

  List<Object?> get props => [_value];
}
