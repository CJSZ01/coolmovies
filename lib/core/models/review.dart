// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coolmovies/core/models/user.dart';

class Review {
  String title;
  String body;
  int rating;
  User? user;
  Review({
    required this.title,
    required this.body,
    required this.rating,
    this.user,
  });

  Review copyWith({
    String? title,
    String? body,
    int? rating,
    User? user,
  }) {
    return Review(
      title: title ?? this.title,
      body: body ?? this.body,
      rating: rating ?? this.rating,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'rating': rating,
      'user': user?.toMap(),
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      title: map['title'] as String,
      body: map['body'] as String,
      rating: map['rating'] as int,
      user: map['user'] != null
          ? User.fromMap(map['userByUserReviewerId'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(title: $title, body: $body, rating: $rating, user: $user)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.body == body &&
        other.rating == rating &&
        other.user == user;
  }

  @override
  int get hashCode {
    return title.hashCode ^ body.hashCode ^ rating.hashCode ^ user.hashCode;
  }
}
