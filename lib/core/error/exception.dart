class ServerException implements Exception {
  const ServerException([this.type = 'unknown-error']);

  final String type;
}
