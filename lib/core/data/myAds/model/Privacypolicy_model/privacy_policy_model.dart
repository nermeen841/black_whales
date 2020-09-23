class PrivacyPolicyModel {
  String msg;
  List<Data> data;

  PrivacyPolicyModel({this.msg, this.data});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
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
  String splash1;
  String warningText;
  String conditions;
  String who;

  Data({this.splash1, this.warningText, this.conditions, this.who});

  Data.fromJson(Map<String, dynamic> json) {
    splash1 = json['splash–1'];
    warningText = json['WarningText'];
    conditions = json['conditions'];
    who = json['who'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['splash–1'] = this.splash1;
    data['WarningText'] = this.warningText;
    data['conditions'] = this.conditions;
    data['who'] = this.who;
    return data;
  }
}