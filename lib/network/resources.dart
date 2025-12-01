enum Status { initial, loading, success, failure }

class Resources<T> {
  final T? data;
  final Exception? exception;
  final String? message;
  final Status status;

  const Resources.initial()
    : status = Status.initial,
      data = null,
      exception = null,
      message = null;

  const Resources.loading({this.data})
    : status = Status.loading,
      exception = null,
      message = null;

  const Resources.success({this.data, this.message})
    : status = Status.success,
      exception = null;

  const Resources.failure({this.exception, this.message, this.data})
    : status = Status.failure;

  const Resources._(this.status, this.data, this.exception, this.message);
}
