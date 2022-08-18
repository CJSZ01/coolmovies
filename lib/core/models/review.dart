import 'dart:convert';

class Review {
  String title;
  String body;
  int rating;
  Review({
    required this.title,
    required this.body,
    required this.rating,
  });

  Review copyWith({
    String? title,
    String? body,
    int? rating,
  }) {
    return Review(
      title: title ?? this.title,
      body: body ?? this.body,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'rating': rating,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      title: map['title'] as String,
      body: map['body'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Review(title: $title, body: $body, rating: $rating)';

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) {
      return true;
    }

    return other.title == title && other.body == body && other.rating == rating;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode ^ rating.hashCode;
}
