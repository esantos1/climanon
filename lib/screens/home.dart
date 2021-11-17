import 'dart:convert';
import 'package:climanon/model/clima_model.dart';
import 'package:climanon/widgets/clima_widget.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ClimaModel climaModel;
  bool _carregando = false;

  final List<String> _cidades = [
    'Aracajú',
    'Belém',
    'Belo Horizonte',
    'Boa Vista',
    'Brasília',
    'Campo Grande',
    'Cuiabá',
    'Curitiba',
    'Florianópolis',
    'Fortaleza',
    'Goiânia',
    'João Pessoa',
    'Macapá',
    'Maceió',
    'Manaus',
    'Natal',
    'Palmas',
    'Porto Alegre',
    'Porto Velho',
    'Recife',
    'Rio Branco',
    'Rio de Janeiro',
    'Salvador',
    'São Luís',
    'São Paulo',
    'Teresina',
    'Vitória',
  ];

  String _cidadeSelecionada = 'São Paulo';

  @override
  void initState() {
    super.initState();
    carregaClima();
  }

  carregaClima() async {
    setState(() {
      _carregando = true;
    });

    const String _apiUrl = 'api.openweathermap.org';
    const String _path = '/data/2.5/weather';
    const String _appid = ''; //your API key
    const String _units = 'metric';
    const String _lang = 'pt_br';

    final _parametros = {
      'q': _cidadeSelecionada,
      'appid': _appid,
      'units': _units,
      'lang': _lang,
    };

    //requisição para api externa
    final climaResponse = await http.get(
      Uri.https(_apiUrl, _path, _parametros),
    );

    //apenas para testar
    // print('Url acessada: ${climaResponse.request!.url.toString()}');
    // print(climaResponse.body);

    if (climaResponse.statusCode == 200) {
      setState(() {
        _carregando = false;
        climaModel = ClimaModel.fromJson(jsonDecode(climaResponse.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              items: _cidades,
              showSelectedItems: true,
              selectedItem: _cidadeSelecionada,
              showSearchBox: true,
              maxHeight: height - padding.top - 60,
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value!;
                  carregaClima();
                });
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: (_carregando)
                        ? const CircularProgressIndicator(
                            strokeWidth: 3.0,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          )
                        : climaModel != null
                            ? ClimaWidget(climaModel: climaModel)
                            : Text(
                                'Sem dados para exibir',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _carregando
                        ? Text(
                            'Carregando...',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        : IconButton(
                            onPressed: carregaClima,
                            icon: const Icon(Icons.refresh),
                            iconSize: 50,
                            tooltip: 'Recarregar',
                            color: Colors.blue,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
