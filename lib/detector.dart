class Detector {
  dynamic sensorId;
  dynamic name;
  dynamic newName;
  dynamic status;
  dynamic temperature;
  dynamic humidity;

  Detector({
     this.sensorId,
     this.name,
     this.newName,
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