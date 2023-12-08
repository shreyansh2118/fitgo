class profile{
  String name;
  // String contact;
  double weight;
  double bmi;
  double height;
  // DateTime dateTime; // Adding dateTime field

  profile({
    required this.name,
    // required this.contact,
    required this.weight,
    required this.bmi,
    required this.height,
    // required this.dateTime, // Initializing dateTime in the constructor
  });

  factory profile.fromJson(Map<String, dynamic> json) {
    return profile(
      name: json['name'],
      // contact: json['contact'],
      weight: json['weight'],
      bmi: json['bmi'],
      height: json['height'],
      // dateTime: DateTime.parse(json['dateTime']), // Parsing dateTime from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      // 'contact': contact,
      'weight': weight,
      'bmi': bmi,
      'height': height,
      // 'dateTime': dateTime, // Storing dateTime as ISO 8601 string
    };
  }
}
