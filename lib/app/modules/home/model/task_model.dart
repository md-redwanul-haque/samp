class TodoModel {
  int? id;
  String? title;
  String? description;
  String? date;
  List<String>? imagePaths; // List to store multiple image paths

  TodoModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.imagePaths,
  });

  // Convert from JSON (e.g., database row) to TodoModel
  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    imagePaths = json['imagePaths'] != null ? (json['imagePaths'] as String).split(',') : [];
  }

  // Convert from TodoModel to JSON (e.g., for inserting/updating in the database)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    data['imagePaths'] = this.imagePaths?.join(','); // Store as a comma-separated string
    return data;
  }
}
