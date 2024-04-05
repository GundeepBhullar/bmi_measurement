import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'BMI Calculation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  Color bgColor = Colors.white70;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500
        ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(

        color: bgColor,
        child: Center(
          child: Container(
             width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 28
                  ),
                ),

                SizedBox( height: 16,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Input Weigth in Kg',
                    style: TextStyle(
                      fontSize: 18
                    ),) ,
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Input Height in Feet',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text(
                        'Input Height in Inch',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {

                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(ft!="" && wt!="" && inch!="") {

                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = ift*12 + iInch ;
                      var cmHt = tInch*2.54 ;

                      var mHt = cmHt/100;

                      var bmi = iwt/(mHt*mHt);

                      setState(() {
                        result = 'Your BMI is : ${bmi.toStringAsFixed(3)}';

                        if(bmi <= 18){
                          bgColor = Colors.red;
                        } else if(bmi >= 25){
                          bgColor = Colors.amber;
                        } else {
                          bgColor = Colors.green;
                        }
                      });



                    } else{
                      setState(() {
                        result = 'Please fill all required blanks';
                      });
                    }
                  },
                  child: Text('Calculate',
                  style: TextStyle(
                    fontSize:25,
                    color: Colors.white
                  ),
                  ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                ),

                SizedBox(height:16),

                Text(result,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                    ),
                ),

              ]
            ),
          ),
        ),
      ),
    );
  }
}
