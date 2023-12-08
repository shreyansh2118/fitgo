import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FoodNutritionPage extends StatefulWidget {
  @override
  _FoodNutritionPageState createState() => _FoodNutritionPageState();
}

class _FoodNutritionPageState extends State<FoodNutritionPage> {
  final apiKey = "313275595585e2d5b11f080441f5d608";
  final appId = "d8c59623";
  final TextEditingController _foodNameController = TextEditingController();
  String _protein = "";
  String _calories = "";
  String _cholestrol="";
  String _Sodium="";
  String _zinc="";
  String _FASAT="";
  String _CHOCDF="";
  String _FIBTG="";
  String _sugar="";
  String _FE="";
  String _CA="";
  String _K="";
  String _weight = "";
  // String _label = "";

  Future<void> fetchNutritionData(String foodName) async {
    final url = Uri.parse(
        "https://api.edamam.com/api/nutrition-data?app_id=$appId&app_key=$apiKey&ingr=$foodName");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final nutrients = jsonData['totalNutrients'];
      final totalWeight = jsonData['totalWeight'];
      setState(() {
        _protein = nutrients['PROCNT']['quantity'].toString();
        _calories = nutrients['ENERC_KCAL']['quantity'].toString();
        _cholestrol = nutrients['CHOLE']['quantity'].toString();
        _zinc = nutrients['ZN']['quantity'].toStringAsFixed(4);
        _Sodium = nutrients['NA']['quantity'].toStringAsFixed(4);
        // _FASAT = nutrients['FASAT']['quantity'].toString();
        // _CHOCDF = nutrients['CHOCDF']['quantity'].toString();
        // _FIBTG = nutrients['FIBTG']['quantity'].toString();
        // _sugar = nutrients['SUGAR']['quantity'].toString();
        _FE = nutrients['FE']['quantity'].toStringAsFixed(4);
        _CA = nutrients['CA']['quantity'].toString();
        _K = nutrients['K']['quantity'].toString();
        _weight = totalWeight.toString();
        // _label = jsonData['label'];

      });
    } else {
      setState(() {
        _protein = "API request failed";
        _calories = "";
        _weight = "";
        // _label = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Nutrition'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(

                controller: _foodNameController,
                decoration: InputDecoration(

                  labelText: 'Food Name with quantity',
                  hintText: 'Enter food name',

                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String foodName = _foodNameController.text.trim();
                  fetchNutritionData(foodName);
                },
                child: Text('Get Nutrition Data'),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(

                  border: Border.all(),
                ),
                child: Column(

                  children: [

                    SizedBox(height: 60.0),
                    Text('Weight: $_weight g',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Protein: $_protein g',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Calories: $_calories kcal',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Cholestrol: $_cholestrol mg',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Zinc: $_zinc mg',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Sodium: $_Sodium mg',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    // Text('TotalFat: $_FASAT g'),
                    // Text('Carbhodrate: $_CHOCDF g'),
                    // Text('Dietary Fiber: $_FIBTG g'),
                    // Text('Total Sugars: $_sugar g'),
                    Text('Potassium: $_K mg',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Iron: $_FE mg',style: TextStyle(fontSize: 18 ),),
                    SizedBox(height: 16.0),
                    Text('Calcium: $_CA mg',style: TextStyle(fontSize: 18 ),),
                    // Text('Label: $_label'),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
