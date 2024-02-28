import 'package:flutter_riverpod/flutter_riverpod.dart';

final appInitProvider = FutureProvider<bool>(
  (ref) async {
    return true;
  },
);
