class Task {
  int id;
  String title;
  String details;
  DateTime taskDate;
  DateTime endDate;
  String category;

  Task({
    this.id,
    this.title,
    this.details,
    this.taskDate,
    this.endDate,
    this.category,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'details': details,
      'taskDate': taskDate.toIso8601String(),
      'endDate': endDate.toIso8601String() ?? taskDate.toIso8601String(),
      'category': category
    };
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    details = map['details'];
    taskDate = DateTime.parse(map['taskDate']);
    endDate = DateTime.parse(map['endDate']);
    category = map['category'];
  }
}
