import 'package:flutter/foundation.dart';
import 'places_great.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
}

