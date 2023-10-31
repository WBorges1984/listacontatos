class ContatosHttpModel {
  List<Results>? results;

  ContatosHttpModel({this.results});

  ContatosHttpModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
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
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['mail'] = this.mail;
    data['birth'] = this.birth;
    data['photo'] = this.photo;
    return data;
  }
}











/* class Contact {
  String photo;
  String name;
  String email;

  Contact({
    required this.photo,
    required this.name,
    required this.email,
  });
}
 */