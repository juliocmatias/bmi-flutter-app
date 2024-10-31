import 'package:bmiapp/models/person.dart';

class PeopleState {
  final bool isLoading;
  final String erro;
  final List<Person> people;

  PeopleState(
      {required this.isLoading, required this.erro, required this.people});

  factory PeopleState.empty() {
    return PeopleState(isLoading: false, erro: '', people: []);
  }

  PeopleState copyWith({
    bool? isLoading,
    String? erro,
    List<Person>? people,
  }) {
    return PeopleState(
      isLoading: isLoading ?? this.isLoading,
      erro: erro ?? this.erro,
      people: people ?? this.people,
    );
  }
}
