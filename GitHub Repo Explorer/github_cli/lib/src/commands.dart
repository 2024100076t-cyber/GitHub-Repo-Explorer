import 'package:terminal_colors/terminal_colors.dart';
import 'package:github_api/github_api.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand()
    : super('query', 'Fetches records for a specific domain target.');

  @override
  Future<void> execute(GithubApiClient client, List<String> arguments) async {
    if (arguments.isEmpty) {
      print('Execution Error: Argument query criteria is missing.'.styleError);
      return;
    }

    final target = arguments.first;
    try {
      final result = await client.fetchMetadata(target);

      final buffer = StringBuffer()
        ..writeln('--- AUDIT REPORT ---'.styleHeader)
        ..writeln('Identifier:  ${result.id}'.styleSuccess)
        ..writeln('Name Label:  ${result.name}')
        ..writeln('Primary Val: ${result.primaryValue} Stars')
        ..writeln('Description: ${result.description}')
        ..writeln('Forks:       ${result.forksCount}')
        ..writeln('Open Issues: ${result.openIssuesCount}')
        ..writeln('--------------------'.styleHeader);

      print(buffer.toString());
    } on GithubException catch (e) {
      print('Operation Failed: ${e.message}'.styleError);
    }
  }
}
