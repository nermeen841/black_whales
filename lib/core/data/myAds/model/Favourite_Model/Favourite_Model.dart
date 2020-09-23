class FavouritesModel {
  String msg;
  List<Data> data;

  FavouritesModel({this.msg, this.data});

  FavouritesModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<AdDetails> adDetails;

  Data({this.adDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ad_details'] != null) {
      adDetails = new List<AdDetails>();
      json['ad_details'].forEach((v) {
        adDetails.add(new AdDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adDetails != null) {
      data['ad_details'] = this.adDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdDetails {
  Ad ad;
  User user;

  AdDetails({this.ad, this.user});

  AdDetails.fromJson(Map<String, dynamic> json) {
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ad != null) {
      data['ad'] = this.ad.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Ad {
  int id;
  int codeNumber;
  int price;
  String phone;
  String title;
  String image;
  String description;
  int userId;
  int categoryId;
  int subCategoryId;
  int brandId;
  int classId;
  int countryId;
  int cityId;
  int areaId;
  int isPhotos;
  int isPrice;
  int isAcceptance;
  String createdAt;
  String updatedAt;
  String country;
  String city;
  String area;
  String categoryName;
  String subCategoryName;
  String brandName;
  String sectionName;
  int isLove;
  List<Images> images;
  List<Details> details;

  Ad(
      {this.id,
        this.codeNumber,
        this.price,
        this.phone,
        this.title,
        this.image,
        this.description,
        this.userId,
        this.categoryId,
        this.subCategoryId,
        this.brandId,
        this.classId,
        this.countryId,
        this.cityId,
        this.areaId,
        this.isPhotos,
        this.isPrice,
        this.isAcceptance,
        this.createdAt,
        this.updatedAt,
        this.country,
        this.city,
        this.area,
        this.categoryName,
        this.subCategoryName,
        this.brandName,
        this.sectionName,
        this.isLove,
        this.images,
        this.details});

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codeNumber = json['code_number'];
    price = json['price'];
    phone = json['phone'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['subCategory_id'];
    brandId = json['brand_id'];
    classId = json['class_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    isPhotos = json['is_photos'];
    isPrice = json['is_price'];
    isAcceptance = json['is_acceptance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
    city = json['city'];
    area = json['area'];
    categoryName = json['categoryName'];
    subCategoryName = json['subCategoryName'];
    brandName = json['brandName'];
    sectionName = json['sectionName'];
    isLove = json['is_love'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code_number'] = this.codeNumber;
    data['price'] = this.price;
    data['phone'] = this.phone;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['subCategory_id'] = this.subCategoryId;
    data['brand_id'] = this.brandId;
    data['class_id'] = this.classId;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['is_photos'] = this.isPhotos;
    data['is_price'] = this.isPrice;
    data['is_acceptance'] = this.isAcceptance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country'] = this.country;
    data['city'] = this.city;
    data['area'] = this.area;
    data['categoryName'] = this.categoryName;
    data['subCategoryName'] = this.subCategoryName;
    data['brandName'] = this.brandName;
    data['sectionName'] = this.sectionName;
    data['is_love'] = this.isLove;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int id;
  String image;
  int advertisingId;
  String createdAt;
  String updatedAt;

  Images(
      {this.id,
        this.image,
        this.advertisingId,
        this.createdAt,
        this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    advertisingId = json['advertising_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['advertising_id'] = this.advertisingId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Details {
  int id;
  String value;
  String key;
  int advertisingId;
  String createdAt;
  String updatedAt;

  Details(
      {this.id,
        this.value,
        this.key,
        this.advertisingId,
        this.createdAt,
        this.updatedAt});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    key = json['key'];
    advertisingId = json['advertising_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['key'] = this.key;
    data['advertising_id'] = this.advertisingId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int id;
  String name;
  String image;
  String phone;
  Null gender;
  Null birthday;
  int code;
  String email;
  String apiToken;
  String deviceToken;
  int isOnline;
  int followingsCount;
  int followersCount;
  int roomId;
  int advsUserCount;
  String createdAt;
  int isFollow;

  User(
      {this.id,
        this.name,
        this.image,
        this.phone,
        this.gender,
        this.birthday,
        this.code,
        this.email,
        this.apiToken,
        this.deviceToken,
        this.isOnline,
        this.followingsCount,
        this.followersCount,
        this.roomId,
        this.advsUserCount,
        this.createdAt,
        this.isFollow});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    gender = json['gender'];
    birthday = json['birthday'];
    code = json['code'];
    email = json['email'];
    apiToken = json['api_token'];
    deviceToken = json['device_token'];
    isOnline = json['is_online'];
    followingsCount = json['followingsCount'];
    followersCount = json['followersCount'];
    roomId = json['room_id'];
    advsUserCount = json['advsUserCount'];
    createdAt = json['created_at'];
    isFollow = json['is_follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['code'] = this.code;
    data['email'] = this.email;
    data['api_token'] = this.apiToken;
    data['device_token'] = this.deviceToken;
    data['is_online'] = this.isOnline;
    data['followingsCount'] = this.followingsCount;
    data['followersCount'] = this.followersCount;
    data['room_id'] = this.roomId;
    data['advsUserCount'] = this.advsUserCount;
    data['created_at'] = this.createdAt;
    data['is_follow'] = this.isFollow;
    return data;
  }
}