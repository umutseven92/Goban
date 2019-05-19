class GobanException implements Exception {
  final message;

  GobanException(this.message);

  @override
  String toString() {
    return 'GobanException: $message';
  }
}
