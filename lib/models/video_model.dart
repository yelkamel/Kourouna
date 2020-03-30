class Video {
  final String id;
  final String title;
  final String by;
  final String description;
  final String url;
  final String imageUrl;
  final String type;

  Video(
      {this.id,
      this.by,
      this.title,
      this.description,
      this.url,
      this.imageUrl,
      this.type});

  factory Video.fromMap(Map<dynamic, dynamic> value, String id) {
    return Video(
      id: id,
      by: value['by'],
      title: value['title'],
      description: value['description'],
      url: value['url'],
      imageUrl: value['imageUrl'],
      type: 'youtube',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': "",
      'title': title,
    };
  }
}
