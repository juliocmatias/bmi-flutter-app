import 'package:bmiapp/models/bmi.dart';
import 'package:bmiapp/stores/people_store.dart';
import 'package:bmiapp/widgets/card_main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PeopleStore>(builder: (context, store, child) {
      Widget body;

      if (store.state.people.isEmpty) {
        body = const Center(
          child: Text(
            'Nenhuma pessoa cadastrada!',
            style: TextStyle(fontSize: 20),
          ),
        );
      } else {
        body = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: store.state.people.length,
          itemBuilder: (context, index) {
            final person = store.state.people[index];
            final weight = person.weight;
            final height = person.height;
            final bmi = Bmi.classification(weight, height);

            return CardMainPageView(
              name: person.name,
              weight: person.weight,
              height: person.height,
              classification: bmi.description,
            );
          },
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Pessoas Cadastradas')),
        ),
        body: body,
      );
    });
  }
}
