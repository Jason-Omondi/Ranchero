class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
