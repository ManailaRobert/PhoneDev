sealed class SyncEvent {
  const SyncEvent(this.photo);
  final String photo;
}

class Queued extends SyncEvent {
  const Queued(super.photo);
}

class Uploaded extends SyncEvent {
  const Uploaded(super.photo, this.ms);
  final int ms;
}

class Failed extends SyncEvent {
  const Failed(super.photo, this.retryIn);
  final int retryIn;
}

Stream<SyncEvent> events() async* {
  yield const Queued('a.jpg');
  yield const Uploaded('a.jpg', 840);
  yield const Failed('b.jpg', 30);
}

String describe(SyncEvent e) => switch (e) {
      Queued(:final photo) => '$photo waits for Wi-Fi',
      Uploaded(:final photo, :final ms) => '$photo up in $ms ms',
      Failed(:final photo, :final retryIn) => '$photo retries in $retryIn s',
    };

Future<void> main() async {
  await for (final e in events()) {
    print(describe(e));
  }

  final (count, label) = (3, 'photos'); // a record, destructured
  print('$count $label queued');
}