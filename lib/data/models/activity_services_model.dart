class ActivityServicesModel {
  bool? status;
  List<Data>? data;

  ActivityServicesModel({status, data});

  ActivityServicesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  String? category;
  String? coreActivity;
  String? name;
  String? nameArabic;
  String? imageUrl;
  String? orderNumber;
  int? status;
  int? size;
  String? createdAt;
  String? updatedAt;
  String? id;

  Data(
      {category,
      coreActivity,
      name,
      nameArabic,
      imageUrl,
      orderNumber,
      status,
      size,
      createdAt,
      updatedAt,
      id});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    coreActivity = json['coreActivity'];
    name = json['name'];
    nameArabic = json['nameArabic'];
    imageUrl = json['imageUrl'];
    orderNumber = json['orderNumber'];
    status = json['status'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['coreActivity'] = coreActivity;
    data['name'] = name;
    data['nameArabic'] = nameArabic;
    data['imageUrl'] = imageUrl;
    data['orderNumber'] = orderNumber;
    data['status'] = status;
    data['size'] = size;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
