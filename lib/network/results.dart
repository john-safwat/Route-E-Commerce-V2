sealed class Results<T>{}

class Success<T> extends Results<T>{
  final T? data;
  Success(this.data);
}

class Failure<T> extends Results<T>{
  final Exception exception;
  final String message;
  Failure(this.exception , this.message);
}