class PostModel {
  final String userID;
  final Author author;
  final String content;
  final List<String> media;
  final DateTime timestamp;
  final int likes;
  final int replies;
  final int reposts;

  PostModel({
    required this.userID,
    required this.author,
    required this.content,
    required this.media,
    required this.timestamp,
    this.likes = 0,
    this.replies = 0,
    this.reposts = 0,
  });
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'author': author.toJson(),
      'content': content,
      'media': media,
      'timestamp': timestamp,
      'likes': likes,
      'replies': replies,
      'reposts': reposts,
    };
  }

  // Create a Post instance from a MongoDB document
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userID: json['userID'],
      author: Author.fromJson(json['author']),
      content: json['content'],
      media: json['media'],
      timestamp: json['timestamp'],
      likes: json['likes'],
      replies: json['replies'],
      reposts: json['reposts'],
    );
  }
}

class Author {
  final String username;
  final String avatarUrl;
  final String displayName;
  Author({required this.username, required this.avatarUrl, required this.displayName});
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'avatarUrl': avatarUrl,
      'displayName': displayName,
    };
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      username: json['username'],
      avatarUrl: json['avatarUrl'],
      displayName: json['displayName'],
    );
  }
}

class MediaType {
  static const image = 'image';
  static const video = 'video';
}

class Media {
  final String type;
  final String fileUrl;

  Media({required this.type, required this.fileUrl});
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'fileUrl': fileUrl,
    };
  }

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      fileUrl: json['fileUrl'],
    );
  }
}
