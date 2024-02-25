import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';

class Quote {
  const Quote(this.content, this.author);

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      json['content'] as String,
      json['author'] as String,
    );
  }

  final String content;
  final String author;
}

final quotesProvider = FutureProvider<Quote>((ref) async {
  final response = await Dio().get<Map<String, dynamic>>(
    quotesEndpoint,
    queryParameters: <String, dynamic>{
      'tags': 'technology|famous-quotes',
      'maxLength': 120,
    },
  );

  return Quote.fromJson(response.data!);
});
