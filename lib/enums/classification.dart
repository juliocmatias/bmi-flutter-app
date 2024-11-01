enum BmiClassification {
  severeThinness('Magreza Grave'),
  moderateThinness('Magreza Moderada'),
  mildThinness('Magreza Leve'),
  healthy('Saudável'),
  overweight('Sobrepeso'),
  obesityClass1('Obesidade Grau I'),
  obesityClass2('Obesidade Grau II (Severa)'),
  obesityClass3('Obesidade Grau III (Mórbida)');

  final String description;
  const BmiClassification(this.description);
}
