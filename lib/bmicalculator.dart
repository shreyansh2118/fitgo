import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key, required this.title});



  final String title;

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  int _counter = 0;



  // void _incrementCounter() {
  //   setState(() {
  //
  //     _counter++;
  //   });
  // }

  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();

  var result="";
  var bgcolor;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI'),
        ),
        body:Container(
          color: bgcolor,
          child: Center(

            child: Container(
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('BMI', style: TextStyle(
                        fontSize: 34, fontWeight:FontWeight.w400),),

                    SizedBox(height: 12,),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text('Enter your weight (in kgs)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),


                    SizedBox(height: 11,),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text('Enter your height (in feet)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),


                    SizedBox(height: 11,),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text('Enter your height (in inch)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16,),

                    ElevatedButton(onPressed: (){

                      var wt=wtController.text.toString();
                      var ft=ftController.text.toString();
                      var inch=inController.text.toString();

                      if(wt!="" && ft!="" && inch!="") {
                        //BMI calculate
                        var iwt=int.parse(wt);   // string to int change
                        var ift=int.parse(ft);
                        var iInch=int.parse(inch);

                        var tInch=(ift*12)+iInch;
                        var tcm=tInch*2.54;
                        var tm=tcm/100;
                        var bmi=iwt/(tm*tm);

                        var about="";
                        if(bmi<18.5){
                          about="you are underweight(<18)";
                          bgcolor=Colors.orangeAccent.shade200;

                        }
                        else if(bmi>18 && bmi<25){
                          about="your are Normal (18.5-25)";
                          bgcolor=Colors.greenAccent.shade200;

                        }
                        else{
                          about="you are overweight(>25)";
                          bgcolor=Colors.redAccent.shade200;
                        }


                        setState(() {
                          result="$about \nyour BMI is: ${bmi.toStringAsFixed(2)}";

                        });

                      } else{
                        setState(() {
                          result="please fill all the blanks!!";
                        });

                      }

                    }, child: Text('Calculate')),
                    SizedBox(height: 16,),
                    Text(result,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600),)

                  ]
              ),
            ),
          ),
        )


    );
  }
}
