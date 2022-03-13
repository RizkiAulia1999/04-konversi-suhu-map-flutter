import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu/widget/dropdown.dart';
import 'package:konversi_suhu/widget/input.dart';
import 'package:konversi_suhu/widget/konversi.dart';
import 'package:konversi_suhu/widget/result.dart';
import 'package:konversi_suhu/widget/riwayat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  // Dynamic variable
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _result = 0;
  String _selectedDropdown = "Kelvin";
  final _listSatuanSuhu = ["Kelvin", "Reamur"];

  List<String> listHasil = [];

  _onChangeDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
  }

  void _konversi() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "Kelvin":
            _result = _inputUser + 273;
            listHasil.add("Kelvin : $_result");
            break;
          case "Reamur":
            _result = _inputUser * 4 / 5;
            listHasil.add("Reamur : $_result");
            break;
          default:
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konversi Suhu - (2031710076 - Muslimatul RA)'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              InputSuhu(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangeDropdown),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Result(
                      result: _result,
                    ),
                  ],
                ),
              ),
              Convert(
                konversi: _konversi,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RiwayatKonversi(listHasil: listHasil),
            ],
          ),
        ),
      ),
    );
  }
}
