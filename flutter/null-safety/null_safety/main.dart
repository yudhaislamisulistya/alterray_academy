void main() {
  // int? nullableInt;
  // String? nullableString;

  // print(nullableInt);
  // print(nullableString);

  // print(nullableInt ?? 0);
  // print(nullableString ?? "Hello");

  // int? nullableInt = null;
  // String? nullableString = null;

  // print(nullableInt);
  // print(nullableString);

  // int nonNullableInt = nullableInt ?? 0; // coalescing operator
  // String nonNullableString = nullableString ?? "Hello";

  // print(nonNullableInt);
  // print(nonNullableString);

  // String? name;
  // print(name?.toUpperCase()); // null aware operator

  // String? getNullableString(bool isNull) {
  //   return isNull ? "Hai Alta" : null;
  // }

  // String? nullableString = getNullableString(false);
  // print(nullableString);

  List<int?> nullableList = [1, null, 3];
  Map<String, int?> nullableMap = {'one': 1, 'two': null};

  print(nullableList);
  print(nullableMap);
}

// late int temperature;

// void main() {
//   fetchTemperature(); // Misalnya ini adalah fungsi yang mengambil data dari sebuah API
//   print("Suhu saat ini: $temperature");
// }

// void fetchTemperature() {
//   temperature = 30;
// }
