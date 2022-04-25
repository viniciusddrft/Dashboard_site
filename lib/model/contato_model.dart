class ModelContato {
  final String? datetime;
  final String? email;
  final String? find;
  final String? name;
  final String? phone;
  final String? subject;

  ModelContato(
      {this.datetime,
      this.email,
      this.find,
      this.name,
      this.phone,
      this.subject});

  ModelContato.fromJson(Map<String, dynamic> json)
      : datetime = json['datetime'],
        email = json['email'],
        find = json['find'],
        name = json['name'],
        phone = json['phone'],
        subject = json['subject'];

  Map<String, dynamic> toJson() => {
        'datetime': datetime,
        'email': email,
        'find': find,
        'name': name,
        'phone': phone,
        'subject': subject
      };
}
