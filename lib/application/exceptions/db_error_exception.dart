class DBErrorException implements Exception {
  String message;
  Exception exception;

  DBErrorException({
    this.message,
    this.exception,
  });
}
