// 
// ignore_for_file: unnecessary_null_comparison
class User {
  bool? status;
  String? message;
  Data? data;

  User({status, message, data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  bool? isDeleted;
  String? userId;
  String? userName;
  String? email;
  String? phone;
  String? otherPhone;
  String? licenceUrl;
  List<Shops>? shops;
  String? selectedLanguage;
  bool? isVerified;
  String? imageUrl;
  String? id;

  Data(
      {token,
      isDeleted,
      userId,
      userName,
      email,
      phone,
      otherPhone,
      licenceUrl,
      shops,
      selectedLanguage,
      isVerified,
      imageUrl,
      id});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isDeleted = json['isDeleted'];
    userId = json['userId'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    otherPhone = json['otherPhone'];
    licenceUrl = json['licenceUrl'];
    if (json['shops'] != null) {
      shops = <Shops>[];
      json['shops'].forEach((v) {
        shops!.add( Shops.fromJson(v));
      });
    }
    selectedLanguage = json['selectedLanguage'];
    isVerified = json['isVerified'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['token'] = token;
    data['isDeleted'] = isDeleted;
    data['userId'] = userId;
    data['userName'] = userName;
    data['email'] = email;
    data['phone'] = phone;
    data['otherPhone'] = otherPhone;
    data['licenceUrl'] = licenceUrl;
    if (shops != null) {
      data['shops'] = shops!.map((v) => v.toJson()).toList();
    }
    data['selectedLanguage'] = selectedLanguage;
    data['isVerified'] = isVerified;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
}

class Shops {
  String? sId;
  String? user;
  String? name;
  List<String>? coreActivities;
  List<String>? services;
  bool? status;
  List<Schedule>? schedule;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? bio;
  String? location;

  Shops(
      {sId,
      user,
      name,
      coreActivities,
      services,
      status,
      schedule,
      createdAt,
      updatedAt,
      iV,
      bio,
      location});

  Shops.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    coreActivities =  json['coreActivities'].cast<String>();
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
    iV = json['__v'];
    bio = json['bio'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
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
    data['__v'] = iV;
    data['bio'] = bio;
    data['location'] = location;
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
    final Map<String, dynamic> data =  <String, dynamic>{};
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    data['_id'] = sId;
    return data;
  }
}






// // User Model
// class User {
//   bool? status;
//   String? message;
//   Data? data;

//   User({status, message, data});

//   User.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (data != null) {
//       data['data'] = data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? token;
//   String? userId;
//   String? userName;
//   String? email;
//   String? phone;
//   String? otherPhone;
//   String? licenceUrl;
//   List<Shops>? shops;
//   String? selectedLanguage;
//   bool? isVerified;
//   String? id;

//   Data(
//       {token,
//       userId,
//       userName,
//       email,
//       phone,
//       otherPhone,
//       licenceUrl,
//       shops,
//       selectedLanguage,
//       isVerified,
//       id});

//   Data.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     userId = json['userId'];
//     userName = json['userName'];
//     email = json['email'];
//     phone = json['phone'];
//     otherPhone = json['otherPhone'];
//     licenceUrl = json['licenceUrl'];
//     if (json['shops'] != null) {
//       shops = <Shops>[];
//       json['shops'].forEach((v) {
//         shops!.add( Shops.fromJson(v));
//       });
//     }
//     selectedLanguage = json['selectedLanguage'];
//     isVerified = json['isVerified'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['token'] = token;
//     data['userId'] = userId;
//     data['userName'] = userName;
//     data['email'] = email;
//     data['phone'] = phone;
//     data['otherPhone'] = otherPhone;
//     data['licenceUrl'] = licenceUrl;
//     if (shops != null) {
//       data['shops'] = shops!.map((v) => v.toJson()).toList();
//     }
//     data['selectedLanguage'] = selectedLanguage;
//     data['isVerified'] = isVerified;
//     data['id'] = id;
//     return data;
//   }
// }

// class Shops {
//   String? sId;
//   String? user;
//   String? name;
//   List<String>? coreActivities;
//   List<String>? services;
//   bool? status;
//   List<String>? schedule;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Shops(
//       {sId,
//       user,
//       name,
//       coreActivities,
//       services,
//       status,
//       schedule,
//       createdAt,
//       updatedAt,
//       iV});

//   Shops.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     user = json['user'];
//     name = json['name'];
//     coreActivities = json['coreActivities'].cast<String>();
//     services = json['services'].cast<String>();
//     status = json['status'];
//     schedule = json['schedule'].cast<String>();
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['_id'] = sId;
//     data['user'] = user;
//     data['name'] = name;
//     data['coreActivities'] = coreActivities;
//     data['services'] = services;
//     data['status'] = status;
//     data['schedule'] = schedule;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }
// // Forgot Password
// class ForgotPassword {
//   bool? status;
//   String? message;

//   ForgotPassword({status, message});

//   ForgotPassword.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     return data;
//   }
// }


