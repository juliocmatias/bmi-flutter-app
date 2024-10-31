import 'package:bmiapp/models/person.dart';
import 'package:bmiapp/stores/people_store.dart';
import 'package:bmiapp/validations/person_register_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonRegister extends StatefulWidget {
  final PageController pageController;

  const PersonRegister({super.key, required this.pageController});

  @override
  State<PersonRegister> createState() => _PersonRegisterState();
}

class _PersonRegisterState extends State<PersonRegister> {
  var registeredPerson = Person();
  final validator = PersonRegisterValidator();
  final formKey = GlobalKey<FormState>();

  bool validRegister() {
    final result = validator.validate(registeredPerson);

    return result.isValid;
  }

  void showAlertDialog(String title, String message) {
    final store = context.read<PeopleStore>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              store.clearError();
              registeredPerson = Person();
              Navigator.pop(context, 'OK');
            },
            child: const Text('Ok', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  void navigatorPage() async {
    final store = context.read<PeopleStore>();
    await store.registerPerson(registeredPerson);

    if (store.state.erro.isEmpty && !store.state.isLoading) {
      registeredPerson = Person();
      widget.pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Consumer<PeopleStore>(builder: (context, store, child) {
        if (store.state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (store.state.erro.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAlertDialog('Erro ao Cadastrar', store.state.erro);
          });
        }

        return Center(
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
                              validator: validator.byField(
                                  registeredPerson, 'lastName'),
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
                                validator: validator.byField(
                                    registeredPerson, 'weight'),
                                onChanged: registeredPerson.setWeight,
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                            if (states.contains(
                                                WidgetState.disabled)) {
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
                                              navigatorPage();
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
        );
      }),
    );
  }
}
