Future<String> uploadPhoto(String name) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (name.endsWith('.heic')) throw FormatException('unsupported: $name');
  return 'uploaded $name';
}

Future<String> settle(Future<String> f) async {
  try {
    return await f;
  } on FormatException catch (e) {
    return 'failed: ${e.message}';
  }
}

Future<void> main() async {
  final names = ['a.jpg', 'b.heic', 'c.jpg'];
  final results = await Future.wait(names.map((n) => settle(uploadPhoto(n))));
  for (final r in results) {
    print(r);
  }

  try {
    await uploadPhoto('d.heic');
  } on FormatException catch (e) {
    print('caught ${e.message}');
  }
}