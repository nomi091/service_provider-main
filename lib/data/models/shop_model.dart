class ShopModel {
  bool? status;
  Data? data;

  ShopModel({status, data});

  ShopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? user;
  String? name;
  List<String>? coreActivities;
  List<String>? services;
  bool? status;
  List<Schedule>? schedule;
  String? createdAt;
  String? updatedAt;
  String? bio;
  String? location;
  String? id;

  Data(
      {user,
      name,
      coreActivities,
      services,
      status,
      schedule,
      createdAt,
      updatedAt,
      bio,
      location,
      id});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    name = json['name'];
    coreActivities = json['coreActivities'].cast<String>();
    services = json['services'].cast<String>();
    status = json['status'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add( Schedule.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bio = json['bio'];
    location = json['location'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['user'] = user;
    data['name'] = name;
    data['coreActivities'] = coreActivities;
    data['services'] = services;
    data['status'] = status;
    if (schedule != null) {
      data['schedule'] = schedule!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['bio'] = bio;
    data['location'] = location;
    data['id'] = id;
    return data;
  }
}

class Schedule {
  int? day;
  bool? open;
  List<Shifts>? shifts;
  String? sId;

  Schedule({day, open, shifts, sId});

  Schedule.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    open = json['open'];
    if (json['shifts'] != null) {
      shifts = <Shifts>[];
      json['shifts'].forEach((v) {
        shifts!.add( Shifts.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['open'] = open;
    if (shifts != null) {
      data['shifts'] = shifts!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    return data;
  }
}

class Shifts {
  String? start;
  String? end;
  String? sId;

  Shifts({start, end, sId});

  Shifts.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    data['_id'] = sId;
    return data;
  }
}

