import 'package:mongo_dart/mongo_dart.dart';
import 'package:unsoedfess/features/home/models/post_model.dart';

class PostRepository {
  final Db _db;
  final String collectionName;

  PostRepository(this._db, this.collectionName);

  Future<void> insertPost(Post post) async {
    final collection = _db.collection(collectionName);
    await collection.insert(post.toJson());
  }

  // Future<void> updatePost(String postId, Post post) async {
  //   final collection = _db.collection(collectionName);
  //   await collection.update(where.id(ObjectId.parse(postId)), modify.set(post.toJson()));
  // }

  Future<void> deletePost(String postId) async {
    final collection = _db.collection(collectionName);
    await collection.remove(where.id(ObjectId.parse(postId)));
  }

  Future<Post?> getPost(String postId) async {
    final collection = _db.collection(collectionName);
    final result = await collection.findOne(where.id(ObjectId.parse(postId)));
    return result == null ? null : Post.fromJson(result);
  }

  Future<List<Post>> getPostsByUser(String userId) async {
    final collection = _db.collection(collectionName);
    final results = await collection.find(where.eq('userID', userId)).toList();
    return results.map((result) => Post.fromJson(result)).toList();
  }

  Future<List<Post>> getPosts() async {
    final collection = _db.collection(collectionName);
    final results = await collection.find().toList();
    return results.map((result) => Post.fromJson(result)).toList();
  }
}
