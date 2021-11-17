import 'package:climanon/model/clima_model.dart';
import 'package:flutter/material.dart';

class ClimaWidget extends StatelessWidget {
  const ClimaWidget({Key? key, required this.climaModel}) : super(key: key);

  final ClimaModel climaModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://openweathermap.org/img/wn/${climaModel.icone}@2x.png",
          fit: BoxFit.fill,
          width: 110,
        ),
        Text(
          '${climaModel.temperatura.toStringAsFixed(0)}ºC',
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          climaModel.descricao,
          style: const TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          'Temperatura mínima: ${climaModel.tempMin.toStringAsFixed(0)}ºC',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Temperatura máxima: ${climaModel.temMax.toStringAsFixed(0)}ºC',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Sensação térmica: ${climaModel.sensacaoTermica.toStringAsFixed(0)}ºC',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Umidade do ar: ${climaModel.sensacaoTermica}%',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Visibilidade: ${climaModel.visibilidade}Km',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Pressão atmosférica: ${climaModel.pressao}hPa',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
