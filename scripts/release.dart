import 'dart:io';

Future<void> main(List<String> args) async {
  print('🚀 Starting PDFCraft Release Process...\n');

  // 1. Check for clean git state
  final gitStatus = await Process.run('git', ['status', '--porcelain']);
  if (gitStatus.stdout.toString().trim().isNotEmpty) {
    print('❌ Error: Working directory is not clean. Please commit or stash changes before releasing.');
    exit(1);
  }

  // 2. Run melos version
  // Melos automatically calculates version bumps, updates CHANGELOG.md,
  // commits the changes, and generates Git tags.
  print('📦 Running "melos version"...');
  final versionProcess = await Process.start(
    'dart',
    ['pub', 'global', 'run', 'melos', 'version'],
    mode: ProcessStartMode.inheritStdio,
  );
  
  final versionExitCode = await versionProcess.exitCode;
  if (versionExitCode != 0) {
    print('\n❌ Error: "melos version" failed or was cancelled. Aborting release.');
    exit(1);
  }

  // 3. Push to GitHub with tags
  print('\n🐙 Pushing commits and tags to GitHub...');
  final pushProcess = await Process.run('git', ['push', '--follow-tags']);
  if (pushProcess.exitCode != 0) {
    print('❌ Error: Failed to push to GitHub.');
    print(pushProcess.stderr);
    exit(1);
  }
  print('✅ Successfully pushed to GitHub.');

  // 4. Publish to pub.dev
  print('\n🎯 Publishing packages to pub.dev...');
  final publishProcess = await Process.start(
    'dart',
    ['pub', 'global', 'run', 'melos', 'publish', '--no-dry-run'],
    mode: ProcessStartMode.inheritStdio,
  );
  
  final publishExitCode = await publishProcess.exitCode;
  if (publishExitCode != 0) {
    print('\n❌ Error: Failed to publish packages to pub.dev.');
    print('You may need to run "melos publish" manually to retry.');
    exit(1);
  }

  print('\n🎉 Release process completed successfully!');
}
