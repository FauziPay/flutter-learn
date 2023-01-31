class Sample {
  final String? name;
  final int? age;

  Sample({
    this.name,
    this.age,
  });

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      name: json["name"] ?? "",
      age: json["age"] ?? 0,
    );
  }
}
