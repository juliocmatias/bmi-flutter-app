import 'package:bmiapp/models/person.dart';
import 'package:lucid_validation/lucid_validation.dart';

class PersonRegisterValidator extends LucidValidator<Person> {
  PersonRegisterValidator() {
    ruleFor((person) => person.firstName, key: 'firstName')
        .notEmpty(message: 'O nome não pode ser vazio.')
        .matchesPattern(
          r'^[A-Z]',
          message: 'O nome deve começar com uma letra maiúscula.',
          code: 'mustStartWithUppercase',
        )
        .matchesPattern(
          r'^[^\d]*$',
          message: 'O nome não deve conter números.',
          code: 'notNumbers',
        )
        .matchesPattern(
          r'^[a-zA-ZÀ-ÿ\s]*$',
          message: 'O nome não deve conter caracteres especiais.',
          code: 'notSpecialCharacters',
        )
        .matchesPattern(
          r'^[A-Z][a-zà-ÿ]*$',
          message: 'Os demais caracteres devem ser minúsculos.',
          code: 'allLowercaseAfterFirst',
        )
        .minLength(3, message: 'O nome deve possuir no mínimo 3 caracteres')
        .maxLength(20, message: 'O nome deve possuir no máximo 20 caracteres');

    ruleFor((person) => person.lastName, key: 'lastName')
        .notEmpty(message: 'O sobrenome não pode ser vazio.')
        .matchesPattern(
          r'^[A-Z]',
          message: 'O sobrenome deve começar com uma letra maiúscula.',
          code: 'mustStartWithUppercase',
        )
        .matchesPattern(
          r'^[^\d]*$',
          message: 'O sobrenome não deve conter números.',
          code: 'notNumbers',
        )
        .matchesPattern(
          r'^[a-zA-ZÀ-ÿ\s]*$',
          message: 'O sobrenome não deve conter caracteres especiais.',
          code: 'notSpecialCharacters',
        )
        .matchesPattern(
          r'^[A-Z][a-zà-ÿ]*$',
          message: 'Os demais caracteres devem ser minúsculos.',
          code: 'allLowercaseAfterFirst',
        )
        .minLength(3,
            message: 'O sobrenome deve possuir no mínimo 3 caracteres')
        .maxLength(20,
            message: 'O sobrenome deve possuir no máximo 20 caracteres');

    ruleFor((person) => person.weight, key: 'weight')
        .greaterThan(
          0,
          message: 'O peso deve ser um número decimal maior que zero.',
        )
        .range(5, 500, message: 'O peso deve estar entre 5 e 500 kg.');

    ruleFor((person) => person.height, key: 'height')
        .greaterThan(
          0,
          message: 'A Altura deve ser um número decimal maior que zero.',
        )
        .range(0.5, 3.0, message: 'A altura deve estar entre 0.5 e 3.0 m.');
  }
}
