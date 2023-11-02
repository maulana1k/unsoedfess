class Post {
  final String userID;
  final Author author;
  final String content;
  final List<Media> media;
  final String timestamp;
  final int likes;
  final int replies;
  final int reposts;

  Post({
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
      'media': media.map((m) => m.toJson()).toList(),
      'timestamp': timestamp,
      'likes': likes,
      'replies': replies,
      'reposts': reposts,
    };
  }

  // Create a Post instance from a MongoDB document
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userID: json['userID'],
      author: Author.fromJson(json['author']),
      content: json['content'],
      media: (json['media'] as List).map((m) => Media.fromJson(m)).toList(),
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
  Author({required this.username, required this.avatarUrl});
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'avatarUrl': avatarUrl,
    };
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      username: json['username'],
      avatarUrl: json['avatarUrl'],
    );
  }
}

class MediaType {
  static const image = 'image';
  static const video = 'video';
}

class Media {
  final MediaType type;
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
