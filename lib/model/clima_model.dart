class ClimaModel {
  final double temperatura, tempMin, temMax, sensacaoTermica;
  final String descricao, icone;
  final int umidade, visibilidade, pressao;

  ClimaModel({
    required this.temperatura,
    required this.tempMin,
    required this.temMax,
    required this.sensacaoTermica,
    required this.descricao,
    required this.icone,
    required this.umidade,
    required this.visibilidade,
    required this.pressao,
  });

  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
      temperatura: json["main"]["temp"].toDouble(),
      tempMin: json["main"]["temp_min"].toDouble(),
      temMax: json["main"]["temp_max"].toDouble(),
      sensacaoTermica: json["main"]["feels_like"].toDouble(),
      descricao: json["weather"][0]["description"],
      icone: json["weather"][0]["icon"],
      umidade: json["main"]["humidity"].toInt(),
      visibilidade: json["visibility"].toInt(),
      pressao: json["main"]["pressure"].toInt(),
    );
  }
}
