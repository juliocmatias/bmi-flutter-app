import 'package:bmiapp/models/person.dart';
import 'package:bmiapp/stores/people_state.dart';
import 'package:bmiapp/validations/person_register_validator.dart';
import 'package:flutter/foundation.dart';

class PeopleStore extends ChangeNotifier {
  PeopleState _state = PeopleState.empty();
  PeopleState get state => _state;

  final _validator = PersonRegisterValidator();

  registerPerson(Person person) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (_validator.validate(person).isValid &&
        !state.people.any((p) => p.name == person.name)) {
      _state = state.copyWith(
        isLoading: false,
        people: [...state.people, person],
      );
      notifyListeners();
    } else {
      _state = state.copyWith(
          isLoading: false,
          erro: 'Pessoal cadastrada com campos inválidos ou já cadastrada.');
      notifyListeners();
    }
  }

  clearError() {
    _state = state.copyWith(erro: '');
    notifyListeners();
  }
}
