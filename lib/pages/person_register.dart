import 'package:bmiapp/models/person.dart';
import 'package:bmiapp/validations/person_register_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PersonRegister extends StatefulWidget {
  const PersonRegister({super.key});

  @override
  State<PersonRegister> createState() => _PersonRegisterState();
}

class _PersonRegisterState extends State<PersonRegister> {
  final registeredPerson = Person();
  final validator = PersonRegisterValidator();
  final formKey = GlobalKey<FormState>();

  bool validRegister() {
    final result = validator.validate(registeredPerson);

    return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Cadastrar Pessoa - IMC',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(19, 0, 19, 19),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: validator.byField(
                                registeredPerson, 'firstName'),
                            onChanged: registeredPerson.setFirstName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Nome",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(19, 0, 19, 19),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                validator.byField(registeredPerson, 'lastName'),
                            onChanged: registeredPerson.setLastName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Sobrenome",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(19, 0, 19, 19),
                          child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator:
                                  validator.byField(registeredPerson, 'weight'),
                              onChanged: registeredPerson.setWeight,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              decoration: const InputDecoration(
                                labelText: "Peso",
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(19, 0, 19, 19),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                validator.byField(registeredPerson, 'height'),
                            onChanged: registeredPerson.setHeight,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Altura",
                            ),
                          ),
                        ),
                        ListenableBuilder(
                            listenable: registeredPerson,
                            builder: (context, child) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 19, vertical: 19),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: FilledButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.disabled)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .inversePrimary; // Cor do botão quando desabilitado
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary; // Cor do botão quando habilitado
                                        },
                                      ),
                                    ),
                                    onPressed: validRegister()
                                        ? () {
                                            if (kDebugMode) {
                                              print(registeredPerson);
                                            }
                                          }
                                        : null,
                                    child: const Text("Cadastrar"),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
