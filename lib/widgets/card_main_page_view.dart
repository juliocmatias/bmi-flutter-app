import 'package:bmiapp/enums/classification.dart';
import 'package:flutter/material.dart';

class CardMainPageView extends StatelessWidget {
  final String name;
  final double weight;
  final double height;
  final String classification;

  const CardMainPageView({
    super.key,
    required this.name,
    required this.weight,
    required this.height,
    required this.classification,
  });

  colorClassification() {
    if (BmiClassification.severeThinness.description == classification) {
      return Colors.orange[900];
    } else if (BmiClassification.moderateThinness.description ==
        classification) {
      return Colors.orange;
    } else if (BmiClassification.mildThinness.description == classification) {
      return Colors.yellow;
    } else if (BmiClassification.healthy.description == classification) {
      return Colors.green;
    } else if (BmiClassification.overweight.description == classification) {
      return Colors.red[300];
    } else if (BmiClassification.obesityClass1.description == classification) {
      return Colors.red[500];
    } else if (BmiClassification.obesityClass2.description == classification) {
      return Colors.red[700];
    } else if (BmiClassification.obesityClass3.description == classification) {
      return Colors.red[900];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Nome:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(name),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            'Peso:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('$weight kg'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            'Altura:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('$height m'),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Container(
                  color: colorClassification(),
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      'Classificação: $classification',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
