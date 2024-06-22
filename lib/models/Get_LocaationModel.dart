class GetLocation {
  String? message;
  Location? location ;

  GetLocation.fromJson(Map<String,dynamic> json){
    message = json['message'];
    location = Location.fromJson(json['patientSeizure']);
  }
}

class Location {

  String? lat;
  String? lon;

  Location.fromJson(Map<String,dynamic> json){
    lat = json['lat'];
    lon = json["lng"];
  }
}