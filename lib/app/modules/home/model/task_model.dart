class TodoModel {
  int? id;
  String? title;
  String? description;
  String? time; // Due time stored as string (e.g., "14:30")
  List<String>? imagePaths; // List to store multiple image paths

  TodoModel({
    this.id,
    this.title,
    this.description,
    this.time,
    this.imagePaths,
  });

  // Convert from JSON to model
  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    time = json['time'];
    imagePaths = json['imagePaths'] != null ? (json['imagePaths'] as String).split(',') : [];
  }

  // Convert from model to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['time'] = this.time;
    data['imagePaths'] = this.imagePaths?.join(','); // Store as comma-separated string
    return data;
  }
}
