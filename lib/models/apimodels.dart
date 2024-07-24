class GetStudentList {
  int? age;
  String? email;
  int? id;
  String? name;

  GetStudentList(
      {required this.age,
      required this.email,
      required this.id,
      required this.name});

  GetStudentList.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class GetsubjectList {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  GetsubjectList(
      {required this.credits,
      required this.id,
      required this.name,
      required this.teacher});

  GetsubjectList.fromJson(Map<String, dynamic> json) {
    credits = json['credits'];
    id = json['id'];
    name = json['name'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credits'] = credits;
    data['id'] = id;
    data['name'] = name;
    data['teacher'] = teacher;
    return data;
  }
}

class GetClassroomList {
  int? id;
  String? layout;
  String? name;
  int? size;
  String? subject;
  GetClassroomList(
      {required this.id,
      required this.layout,
      required this.name,
      required this.size,
      this.subject});

  GetClassroomList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layout = json['layout'];
    name = json['name'];
    size = json['size'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['layout'] = layout;
    data['name'] = name;
    data['size'] = size;
    data['subject'] = subject;
    return data;
  }
}
