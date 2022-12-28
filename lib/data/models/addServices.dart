class AddServices {
  String? user;
  String? name;
  List<String>? coreActivities;
  List<Services>? services;
  String? location;
  String? bio;
  List<Schedule>? schedule;

  AddServices(
      {this.user,
      this.name,
      this.coreActivities,
      this.services,
      this.location,
      this.bio,
      this.schedule});

  AddServices.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    name = json['name'];
    coreActivities = json['coreActivities'].cast<String>();
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    location = json['location'];
    bio = json['bio'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['name'] = this.name;
    data['coreActivities'] = this.coreActivities;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    data['location'] = this.location;
    data['bio'] = this.bio;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? serviceId;
  String? price;
  String? place;

  Services({this.serviceId, this.price, this.place});

  Services.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    price = json['price'];
    place = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['price'] = this.price;
    data['place'] = this.place;
    return data;
  }
}

class Schedule {
  int? day;
  bool? open;
  List<Shifts>? shifts;

  Schedule({this.day, this.open, this.shifts});

  Schedule.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    open = json['open'];
    if (json['shifts'] != null) {
      shifts = <Shifts>[];
      json['shifts'].forEach((v) {
        shifts!.add(new Shifts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['open'] = this.open;
    if (this.shifts != null) {
      data['shifts'] = this.shifts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shifts {
  String? start;
  String? end;

  Shifts({this.start, this.end});

  Shifts.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}