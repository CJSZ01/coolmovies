// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coolmovies/core/models/review.dart';
import 'package:flutter/foundation.dart';

class Movie {
  String id;
  String title;
  String releaseDate;
  String imgUrl;
  String directorName;
  List<Review>? reviews;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.imgUrl,
    required this.directorName,
    this.reviews,
  });

  Movie copyWith({
    String? id,
    String? title,
    String? releaseDate,
    String? imgUrl,
    String? directorName,
    List<Review>? reviews,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      imgUrl: imgUrl ?? this.imgUrl,
      directorName: directorName ?? this.directorName,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'imgUrl': imgUrl,
      'directorName': directorName,
      'reviews': reviews!.map((x) => x.toMap()).toList(),
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as String,
      title: map['title'] as String,
      releaseDate: map['releaseDate'] as String,
      imgUrl: map['imgUrl'] as String,
      directorName: map['movieDirectorByMovieDirectorId']['name'] as String,
      reviews: map['movieReviewsByMovieId'] != null
          ? map['movieReviewsByMovieId']['nodes']
              .map<Review>((map) => Review.fromMap(map))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, releaseDate: $releaseDate, imgUrl: $imgUrl, directorName: $directorName, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.title == title &&
        other.releaseDate == releaseDate &&
        other.imgUrl == imgUrl &&
        other.directorName == directorName &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        releaseDate.hashCode ^
        imgUrl.hashCode ^
        directorName.hashCode ^
        reviews.hashCode;
  }
}

extension ReviewAverage on Movie {
  double getReviewAverage() {
    double sum = 0;
    for (final element in reviews!) {
      sum = sum + element.rating;
    }
    return sum / reviews!.length;
  }
}
