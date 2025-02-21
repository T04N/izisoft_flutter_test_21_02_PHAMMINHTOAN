class UserResponse {
  String? email;
  String? name;
  String? avatar;
  String? gender;
  String? describe;
  String? job;
  String? password;
  String? id;

  UserResponse(
      {this.email,
        this.name,
        this.avatar,
        this.gender,
        this.describe,
        this.job,
        this.password,
        this.id});

  UserResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    gender = json['gender'];
    describe = json['describe'];
    job = json['job'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['describe'] = this.describe;
    data['job'] = this.job;
    data['password'] = this.password;
    data['id'] = this.id;
    return data;
  }
}
