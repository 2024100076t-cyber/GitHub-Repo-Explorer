import 'dart:io';

void main() async {
  stdout.write('Enter GitHub repository: ');
  final input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('Error: Input cannot be empty.');
    return;
  }

  print('\n--- AUDIT REPORT ---');
  print('Target Repo: $input');
  print('Status: Active');
  print('--------------------');
}
