import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'exceptions.dart';
import 'models.dart';

class GithubApiClient {
  final http.Client _client;
  final Logger _logger = Logger('GithubApiClient');
  static const String _authority = 'api.github.com';

  GithubApiClient(this._client);

  Future<GithubRepoModel> fetchMetadata(String query) async {
    _logger.info('Initiating connection for resource query: $query');
    final uri = Uri.https(_authority, '/repos/$query');

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'User-Agent': 'Dart-CLI-Workspace',
              'Accept': 'application/vnd.github.v3+json',
            },
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode != 200) {
        _logger.warning(
          'API responded with error status: ${response.statusCode}',
        );
        throw GithubException(
          'Remote server rejected transaction (HTTP ${response.statusCode}).',
        );
      }

      final decoded = json.decode(response.body);
      if (decoded is! Map<String, dynamic>) {
        throw GithubException('Unexpected JSON response payload structure.');
      }

      return GithubRepoModel.fromJson(decoded);
    } on http.ClientException catch (e) {
      _logger.severe('Network socket transaction failed.', e);
      throw GithubException('Network communication failure occurred.', e);
    } catch (e) {
      _logger.severe('An unexpected processing failure was intercepted.', e);
      rethrow;
    }
  }
}
