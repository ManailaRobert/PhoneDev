class Building {
  final String id;
  final String address;
  final int? floors; // null = not surveyed yet
  const Building({required this.id, required this.address, this.floors});

  Building copyWith({int? floors}) =>
      Building(id: id, address: address, floors: floors ?? this.floors);
}

String describe(Building b) {
  final floors = b.floors ?? 'unknown';
  return '${b.address}: $floors floors';
}

void main() {
  const b = Building(id: 'b-17', address: 'Str. Lipscani 12');
  var count = 3; // inferred: int
  // count = 'three'; // error: A value of type 'String' can't be assigned to a variable of type 'int'.
  print(describe(b));
  print(describe(b.copyWith(floors: 4)));
  print(b.floors?.toStringAsFixed(1) ?? 'n/a');
  print('count is $count');
}