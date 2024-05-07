class UserModel {
  int? id;
  String? nama;
  String? email;

  UserModel({this.id, this.nama, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
    };
  }
}
