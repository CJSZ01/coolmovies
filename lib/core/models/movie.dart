// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  String id;
  String title;
  String releaseDate;
  String imgUrl;
  String directorName;
  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.imgUrl,
    required this.directorName,
  });

  Movie copyWith({
    String? id,
    String? title,
    String? releaseDate,
    String? imgUrl,
    String? directorName,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      imgUrl: imgUrl ?? this.imgUrl,
      directorName: directorName ?? this.directorName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'imgUrl': imgUrl,
      'directorName': directorName,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as String,
      title: map['title'] as String,
      releaseDate: map['releaseDate'] as String,
      imgUrl: map['imgUrl'] as String,
      directorName: map['directorName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, releaseDate: $releaseDate, imgUrl: $imgUrl, directorName: $directorName)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.releaseDate == releaseDate &&
        other.imgUrl == imgUrl &&
        other.directorName == directorName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        releaseDate.hashCode ^
        imgUrl.hashCode ^
        directorName.hashCode;
  }
}
