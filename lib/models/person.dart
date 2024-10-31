import 'package:flutter/foundation.dart';

class Person extends ChangeNotifier {
  String _firstName;
  String _lastName;
  double _weight;
  double _height;

  Person({
    String firstName = '',
    String lastName = '',
    double weight = 0,
    double height = 0,
  })  : _firstName = firstName,
        _lastName = lastName,
        _weight = weight,
        _height = height;

  String get name => '$_firstName $_lastName';
  String get firstName => _firstName;
  String get lastName => _lastName;
  double get weight => _weight;
  double get height => _height;

  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  void setWeight(String weight) {
    _weight = double.tryParse(weight) ?? 0;
    notifyListeners();
  }

  void setHeight(String height) {
    _height = double.tryParse(height) ?? 0;
    notifyListeners();
  }

  @override
  String toString() {
    return {
      'firstName': _firstName,
      'lastName': _lastName,
      'weight': _weight,
      'height': _height
    }.toString();
  }
}
