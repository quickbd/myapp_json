class HomePostModel {

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;

  HomePostModel({ this.id, this.firstName,this.lastName, this.email, this.avatar});

  HomePostModel.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    avatar = json['avatar'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['avatar'] = this.avatar;

    return data;
  }
}
