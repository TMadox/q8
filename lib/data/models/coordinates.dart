class Coordinates {
    Coordinates({
        required this.lat,
        required this.lng,
    });

    final double lat;
    final double lng;

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
