class GithubException implements Exception {
  final String message;
  final Object? cause;

  GithubException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) return 'GithubException: $message (Underlying: $cause)';
    return 'GithubException: $message';
  }
}
