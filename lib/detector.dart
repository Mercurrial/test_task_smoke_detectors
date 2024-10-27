class Detector {
  dynamic sensorId;
  dynamic name;
  dynamic status;
  dynamic temperature;
  dynamic humidity;

  Detector({
    /*required this.sensorId,
    required this.name,
    required this.status,
    required this.temperature,
    required this.humidity,*/
     this.sensorId,
     this.name,
     this.status,
     this.temperature,
     this.humidity,
  });

  factory Detector.fromJson(Map<String, dynamic> json) {
    return Detector(
        sensorId: json['sensor_id'] as dynamic,
        name: json['name'] as dynamic,
        status: json['status'] as dynamic,
        temperature: json['temperature'] as dynamic,
        humidity: json['humidity'] as dynamic
    );
  }
}