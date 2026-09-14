import 'package:github_api/github_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(GithubApiClient client, List<String> arguments);
}
