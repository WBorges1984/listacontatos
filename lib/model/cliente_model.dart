class ClienteModel {
  List<Results>? results;

  ClienteModel({this.results});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? lastname;
  int? phone;
  String? mail;
  String? birth;
  String? photo;

  Results(
      {this.objectId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.lastname,
      this.phone,
      this.mail,
      this.birth,
      this.photo});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    lastname = json['lastname'];
    phone = json['phone'];
    mail = json['mail'];
    birth = json['birth'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['lastname'] = lastname;
    data['phone'] = phone;
    data['mail'] = mail;
    data['birth'] = birth;
    data['photo'] = photo;
    return data;
  }
}
