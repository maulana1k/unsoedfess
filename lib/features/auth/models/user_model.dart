class UserProfile {
  final String email;
  final String username;
  // final String password;
  String avatar;
  String displayName;
  String bio;
  final String verified;
  final int? followers;
  final int? followings;
  final int? posts;
  final String? token;

  UserProfile({
    required this.email,
    required this.avatar,
    required this.username,
    required this.displayName,
    required this.bio,
    this.token,
    this.followers,
    this.followings,
    this.posts,
    this.verified = 'false',
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'avatar': avatar,
      'username': username,
      'displayName': displayName,
      'bio': bio,
      'verified': verified.toString(),
      'followers': followers,
      'followings': followings,
      'posts': posts,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json['email'],
      avatar: json['avatar'],
      username: json['username'],
      // password: "",
      displayName: json['displayName'],
      bio: json['bio'],
      verified: json['verified'],
      followers: json['followers'],
      followings: json['followings'],
      posts: json['posts'],
      token: json['token'],
    );
  }
  UserProfile copyWith({
    String? email,
    String? username,
    String? avatar,
    String? displayName,
    String? bio,
    String? verified,
    int? followers,
    int? followings,
    int? posts,
    String? token,
  }) {
    return UserProfile(
      email: email ?? this.email,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      verified: verified ?? this.verified,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
      posts: posts ?? this.posts,
      token: token ?? this.token,
    );
  }
}

class UserList {
  final String avatar;
  final String username;
  final bool isFollowing;

  UserList({required this.avatar, required this.username, required this.isFollowing});
}
