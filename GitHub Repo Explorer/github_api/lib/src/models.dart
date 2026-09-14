import 'exceptions.dart';

class GithubRepoModel {
  final String id;
  final String name;
  final double primaryValue;
  final String description;
  final int forksCount;
  final int openIssuesCount;

  GithubRepoModel({
    required this.id,
    required this.name,
    required this.primaryValue,
    required this.description,
    required this.forksCount,
    required this.openIssuesCount,
  });

  factory GithubRepoModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': num rawId,
        'name': String parsedName,
        'stargazers_count': num stars,
        'description': String? parsedDesc,
        'forks_count': int forks,
        'open_issues_count': int openIssues,
      } =>
        GithubRepoModel(
          id: rawId.toString(),
          name: parsedName,
          primaryValue: stars.toDouble(),
          description: parsedDesc ?? 'No description provided.',
          forksCount: forks,
          openIssuesCount: openIssues,
        ),
      _ => throw GithubException('Payload failed pattern validation check!'),
    };
  }
}
