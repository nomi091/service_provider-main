// To parse this JSON data, do
//
//     final shopDetail = shopDetailFromJson(jsonString);

import 'dart:convert';

ShopDetail shopDetailFromJson(String str) =>
    ShopDetail.fromJson(json.decode(str));

String shopDetailToJson(ShopDetail data) => json.encode(data.toJson());

class ShopDetail {
  ShopDetail({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.name,
    this.coreActivities,
    this.services,
    this.status,
    this.imageUrls,
    this.schedule,
    this.createdAt,
    this.updatedAt,
    this.bio,
    this.location,
    this.id,
  });

  String? user;
  String? name;
  List<CoreActivity>? coreActivities;
  List<Service>? services;
  bool? status;
  List<String>? imageUrls;
  List<dynamic>? schedule;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? bio;
  String? location;
  String? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"],
        name: json["name"],
        coreActivities: List<CoreActivity>.from(
            json["coreActivities"].map((x) => CoreActivity.fromJson(x))),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        //map((x) => x)),
        status: json["status"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        schedule: List<dynamic>.from(json["schedule"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bio: json["bio"],
        location: json["location"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "coreActivities":
            List<dynamic>.from(coreActivities!.map((x) => x.toJson())),
        "services": List<Service>.from(services!.map((x) => x)),
        "status": status,
        "imageUrls": List<dynamic>.from(imageUrls!.map((x) => x)),
        "schedule": List<dynamic>.from(schedule!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "bio": bio,
        "location": location,
        "id": id,
      };
}

class CoreActivity {
  CoreActivity({
    this.id,
    this.category,
    this.name,
    this.nameArabic,
    this.imageUrl,
    this.orderNumber,
    this.status,
    this.size,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? category;
  String? name;
  String? nameArabic;
  String? imageUrl;
  String? orderNumber;
  int? status;
  int? size;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory CoreActivity.fromJson(Map<String, dynamic> json) => CoreActivity(
        id: json["_id"],
        category: json["category"],
        name: json["name"],
        nameArabic: json["nameArabic"],
        imageUrl: json["imageUrl"],
        orderNumber: json["orderNumber"],
        status: json["status"],
        size: json["size"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "name": name,
        "nameArabic": nameArabic,
        "imageUrl": imageUrl,
        "orderNumber": orderNumber,
        "status": status,
        "size": size,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

//////////////////////////////////////////////

class Service {
  Service({
    this.serviceId,
    this.price,
    this.place,
    this.id,
  });

  ServiceId? serviceId;
  int? price;
  String? place;
  String? id;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: ServiceId.fromJson(json["serviceId"]),
        price: json["price"],
        place: json["place"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "serviceId": serviceId!.toJson(),
        "price": price,
        "place": place,
        "_id": id,
      };
}

class ServiceId {
  ServiceId({
    this.id,
    this.coreActivity,
    this.name,
    this.nameArabic,
    this.imageUrl,
    this.description,
    this.orderNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.price,
    this.type,
  });

  String? id;
  String? coreActivity;
  String? name;
  String? nameArabic;
  String? imageUrl;
  String? description;
  String? orderNumber;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  dynamic price;
  String? type;

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
        id: json["_id"],
        coreActivity: json["coreActivity"],
        name: json["name"],
        nameArabic: json["nameArabic"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        orderNumber: json["orderNumber"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "coreActivity": coreActivity,
        "name": name,
        "nameArabic": nameArabic,
        "imageUrl": imageUrl,
        "description": description,
        "orderNumber": orderNumber,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "price": price,
        "type": type,
      };
}

/////////////////////////////////////////////

class Schedule {
  dynamic day;
  bool? open;
  List<Shifts>? shifts;
  dynamic sId;

  Schedule({day, open, shifts, sId});

  Schedule.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    open = json['open'];
    if (json['shifts'] != null) {
      shifts = <Shifts>[];
      json['shifts'].forEach((v) {
        shifts!.add(Shifts.fromJson(v));
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
  dynamic start;
  dynamic end;
  dynamic sId;

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











// class ShopDetail {
//   bool? status;
//   Data? data;

//   ShopDetail({status, data});

//   ShopDetail.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['status'] = status;
//     if (data != null) {
//       data['data'] = data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? user;
//   String? name;
//   List<CoreActivities>? coreActivities;
//   List<Services>? services;
//   bool? status;
//   List<String>? imageUrls;
//   List<Schedule>? schedule;
//   String? createdAt;
//   String? updatedAt;
//   String? bio;
//   String? location;
//   String? id;

//   Data(
//       {user,
//       name,
//       coreActivities,
//       services,
//       status,
//       imageUrls,
//       schedule,
//       createdAt,
//       updatedAt,
//       bio,
//       location,
//       id});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'];
//     name = json['name'];
//     if (json['coreActivities'] != null) {
//       coreActivities = <CoreActivities>[];
//       json['coreActivities'].forEach((v) {
//         coreActivities!.add( CoreActivities.fromJson(v));
//       });
//     }
//     if (json['services'] != null) {
//       services = <Services>[];
//       json['services'].forEach((v) {
//         services!.add( Services.fromJson(v));
//       });
//     }
//     status = json['status'];
//     imageUrls = json['imageUrls'].cast<String>();
//     if (json['schedule'] != null) {
//       schedule = <Schedule>[];
//       json['schedule'].forEach((v) {
//         schedule!.add( Schedule.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     bio = json['bio'];
//     location = json['location'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['user'] = user;
//     data['name'] = name;
//     if (coreActivities != null) {
//       data['coreActivities'] =
//           coreActivities!.map((v) => v.toJson()).toList();
//     }
//     if (services != null) {
//       data['services'] = services!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = status;
//     if (schedule != null) {
//       data['schedule'] = schedule!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['bio'] = bio;
//     data['location'] = location;
//     data['id'] = id;
//     return data;
//   }
// }

// class CoreActivities {
//   String? sId;
//   String? category;
//   String? name;
//   String? nameArabic;
//   String? imageUrl;
//   String? orderNumber;
//   int? status;
//   int? size;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   CoreActivities(
//       {sId,
//       category,
//       name,
//       nameArabic,
//       imageUrl,
//       orderNumber,
//       status,
//       size,
//       createdAt,
//       updatedAt,
//       iV});

//   CoreActivities.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     category = json['category'];
//     name = json['name'];
//     nameArabic = json['nameArabic'];
//     imageUrl = json['imageUrl'];
//     orderNumber = json['orderNumber'];
//     status = json['status'];
//     size = json['size'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['_id'] = sId;
//     data['category'] = category;
//     data['name'] = name;
//     data['nameArabic'] = nameArabic;
//     data['imageUrl'] = imageUrl;
//     data['orderNumber'] = orderNumber;
//     data['status'] = status;
//     data['size'] = size;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }

// class Services {
//   String? sId;
//   String? coreActivity;
//   String? name;
//   String? nameArabic;
//   String? imageUrl;
//   String? description;
//   String? orderNumber;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Services(
//       {sId,
//       coreActivity,
//       name,
//       nameArabic,
//       imageUrl,
//       description,
//       orderNumber,
//       status,
//       createdAt,
//       updatedAt,
//       iV});

//   Services.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     coreActivity = json['coreActivity'];
//     name = json['name'];
//     nameArabic = json['nameArabic'];
//     imageUrl = json['imageUrl'];
//     description = json['description'];
//     orderNumber = json['orderNumber'];
//     status = json['status'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['_id'] = sId;
//     data['coreActivity'] = coreActivity;
//     data['name'] = name;
//     data['nameArabic'] = nameArabic;
//     data['imageUrl'] = imageUrl;
//     data['description'] = description;
//     data['orderNumber'] = orderNumber;
//     data['status'] = status;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }

// class Schedule {
//   int? day;
//   bool? open;
//   List<Shifts>? shifts;
//   String? sId;

//   Schedule({day, open, shifts, sId});

//   Schedule.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     open = json['open'];
//     if (json['shifts'] != null) {
//       shifts = <Shifts>[];
//       json['shifts'].forEach((v) {
//         shifts!.add( Shifts.fromJson(v));
//       });
//     }
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['day'] = day;
//     data['open'] = open;
//     if (shifts != null) {
//       data['shifts'] = shifts!.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = sId;
//     return data;
//   }
// }

// class Shifts {
//   String? start;
//   String? end;
//   String? sId;

//   Shifts({start, end, sId});

//   Shifts.fromJson(Map<String, dynamic> json) {
//     start = json['start'];
//     end = json['end'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['start'] = start;
//     data['end'] = end;
//     data['_id'] = sId;
//     return data;
//   }
// }
// class ShopDetail {
//   bool? status;
//   Data? data;

//   ShopDetail({status, data});

//   ShopDetail.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['data'] = this.data!.toJson();
//     return data;
//   }
// }

// class Data {
//   dynamic user;
//   dynamic name;
//   List<CoreActivities>? coreActivities;
//   List<Services>? services;
//   bool? status;
//   List<String>? imageUrls;
//   List<Schedule>? schedule;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic bio;
//   dynamic location;
//   dynamic id;

//   Data(
//       {user,
//       name,
//       coreActivities,
//       services,
//       status,
//       imageUrls,
//       schedule,
//       createdAt,
//       updatedAt,
//       bio,
//       location,
//       id});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'];
//     name = json['name'];
//     if (json['coreActivities'] != null) {
//       coreActivities = <CoreActivities>[];
//       json['coreActivities'].forEach((v) {
//         coreActivities!.add(CoreActivities.fromJson(v));
//       });
//     }
//     if (json['services'] != null) {
//       services = <Services>[];
//       json['services'].forEach((v) {
//         services!.add(Services.fromJson(v));
//       });
//     }
//     status = json['status'];
//     imageUrls = json['imageUrls'].cast<String>();
//     if (json['schedule'] != null) {
//       schedule = <Schedule>[];
//       json['schedule'].forEach((v) {
//         schedule!.add(Schedule.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     bio = json['bio'];
//     location = json['location'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['user'] = user;
//     data['name'] = name;
//     if (coreActivities != null) {
//       data['coreActivities'] = coreActivities!.map((v) => v.toJson()).toList();
//     }
//     if (services != null) {
//       data['services'] = services!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = status;
//     data['imageUrls'] = imageUrls;
//     if (schedule != null) {
//       data['schedule'] = schedule!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['bio'] = bio;
//     data['location'] = location;
//     data['id'] = id;
//     return data;
//   }
// }

// class CoreActivities {
//   dynamic sId;
//   dynamic category;
//   dynamic name;
//   dynamic nameArabic;
//   dynamic imageUrl;
//   dynamic orderNumber;
//   dynamic status;
//   dynamic size;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic iV;

//   CoreActivities(
//       {sId,
//       category,
//       name,
//       nameArabic,
//       imageUrl,
//       orderNumber,
//       status,
//       size,
//       createdAt,
//       updatedAt,
//       iV});

//   CoreActivities.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     category = json['category'];
//     name = json['name'];
//     nameArabic = json['nameArabic'];
//     imageUrl = json['imageUrl'];
//     orderNumber = json['orderNumber'];
//     status = json['status'];
//     size = json['size'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['category'] = category;
//     data['name'] = name;
//     data['nameArabic'] = nameArabic;
//     data['imageUrl'] = imageUrl;
//     data['orderNumber'] = orderNumber;
//     data['status'] = status;
//     data['size'] = size;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }

// class Services {
//   dynamic sId;
//   dynamic coreActivity;
//   dynamic name;
//   dynamic nameArabic;
//   dynamic imageUrl;
//   dynamic description;
//   dynamic orderNumber;
//   dynamic status;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic iV;

//   Services(
//       {sId,
//       coreActivity,
//       name,
//       nameArabic,
//       imageUrl,
//       description,
//       orderNumber,
//       status,
//       createdAt,
//       updatedAt,
//       iV});

//   Services.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     coreActivity = json['coreActivity'];
//     name = json['name'];
//     nameArabic = json['nameArabic'];
//     imageUrl = json['imageUrl'];
//     description = json['description'];
//     orderNumber = json['orderNumber'];
//     status = json['status'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['coreActivity'] = coreActivity;
//     data['name'] = name;
//     data['nameArabic'] = nameArabic;
//     data['imageUrl'] = imageUrl;
//     data['description'] = description;
//     data['orderNumber'] = orderNumber;
//     data['status'] = status;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }

// class Schedule {
//   dynamic day;
//   bool? open;
//   List<Shifts>? shifts;
//   dynamic sId;

//   Schedule({day, open, shifts, sId});

//   Schedule.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     open = json['open'];
//     if (json['shifts'] != null) {
//       shifts = <Shifts>[];
//       json['shifts'].forEach((v) {
//         shifts!.add(Shifts.fromJson(v));
//       });
//     }
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['day'] = day;
//     data['open'] = open;
//     if (shifts != null) {
//       data['shifts'] = shifts!.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = sId;
//     return data;
//   }
// }

// class Shifts {
//   dynamic start;
//   dynamic end;
//   dynamic sId;

//   Shifts({start, end, sId});

//   Shifts.fromJson(Map<String, dynamic> json) {
//     start = json['start'];
//     end = json['end'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['start'] = start;
//     data['end'] = end;
//     data['_id'] = sId;
//     return data;
//   }
// }
