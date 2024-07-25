sealed class Result<T> {
  factory Result.success(T value) => ResultSuccess(value);
  factory Result.loading() => ResultLoading();
  factory Result.error(Exception error) => ResultError(error);
}

class ResultLoading<T> implements Result<T> {}

class ResultError<T> implements Result<T> {
  ResultError(this.error);

  final Exception error;
}

class ResultSuccess<T> implements Result<T> {
  ResultSuccess(this.value);

  final T value;
}
