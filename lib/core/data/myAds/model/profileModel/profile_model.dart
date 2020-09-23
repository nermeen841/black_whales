class MyProfileModel {
  String msg;
  Data data;

  MyProfileModel({this.msg, this.data});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String name;
  String image;
  int advCount;
  int followingCount;
  int followersCount;
  String dateCreate;

  Data(
      {this.name,
        this.image,
        this.advCount,
        this.followingCount,
        this.followersCount,
        this.dateCreate});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    advCount = json['advCount'];
    followingCount = json['followingCount'];
    followersCount = json['followersCount'];
    dateCreate = json['dateCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['advCount'] = this.advCount;
    data['followingCount'] = this.followingCount;
    data['followersCount'] = this.followersCount;
    data['dateCreate'] = this.dateCreate;
    return data;
  }
}