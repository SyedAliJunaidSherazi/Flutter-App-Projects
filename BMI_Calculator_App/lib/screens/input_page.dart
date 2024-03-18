import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/resuable_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


/*
We can create new dart files to make coding look easier to understand ans it also helps in creating more screens
In dart we can also declare variables without return type and let it set the return type dynamically
 */

class RoundIconButton extends StatelessWidget {   // Our very own floating action button created from scratch. By checking the coding of floating action we can see what it is made of and using it we can create our own.
  final IconData? icon;
  final void Function()? onPress;
  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 6.0,   // How much elevated the button is. If onpressed is given then button is enabled else it is disabled.
      //disabledElevation: 6.0,  // We can also set the disabled eleveation which is shown when on pressed is not used.
      shape: CircleBorder(),   // Setting the shape of button to circle
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(   // Setting the size of button
        width: 56.0,
        height: 56.0
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 50;
  int age = 16;
  int maleCardColor = kInactiveColor;
  int femaleCardColor = kInactiveColor;

  // 1 == male and 2 ==  female
  void updateColor(Gender gender){
    if(gender == Gender.male){
      if(maleCardColor == kInactiveColor){
        maleCardColor = kCardColor;
        femaleCardColor = kInactiveColor;
      }
      else{
        maleCardColor = kInactiveColor;
      }
    }
    if(gender == Gender.female){
      if(femaleCardColor == kInactiveColor){
        femaleCardColor = kCardColor;
        maleCardColor = kInactiveColor;
      }
      else{
        maleCardColor = kInactiveColor;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableWidget(
                      onPress: (){
                        setState(() {
                          updateColor(Gender.male);  // Using enum
                        });
                      },
                      color: Color(maleCardColor),  // We use this color so that we can show that the card in inactive.
                      childCard: IconWidget(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),  // We can also add color by using this process. This helps as if we want to change color at later time. It becomes east to do so.
                  ),
                  Expanded(
                    child: ReusableWidget(
                      onPress: (){
                        setState(() {
                          updateColor(Gender.female); // Using enum
                        });
                      },
                      color: Color(femaleCardColor),
                      childCard: IconWidget(
                        icon: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableWidget(
                color: Color(kCardColor),
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "HEIGHT",
                        style: kLabelTextStyle
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,  // Baseline property sets the text/Widgets to the base line of all the widgets.
                      textBaseline: TextBaseline.alphabetic,   // We use text baseline property as it is necessary to use with cross axis baseline. It tells the cross axis to baseline with respect to what.
                      children: [
                        Text(
                          height.toString(),  // As text widget takes only strings
                          style: kValueStyle
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(   // Slider Theme widget is used to customize the theme of our slider just as we customize the app theme.
                      data: SliderTheme.of(context).copyWith(   // Takes the default available slider and copies context of it w.r.t our app. And further we can apply changes to its properties as we like.
                        activeTrackColor: Colors.white,    // The color of active side of slider or left side
                        thumbColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98), // The color of inactive side of slider or right side.
                        overlayColor: Color(0x29EB1555),  // Setting opacity of 0x29
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),  // Changing the size of thumb
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),  // Cahnging the overlay of thumb as we click on it
                      ),
                      child: Slider(   // Slider widget provides a slider to the user.
                          value: height.toDouble(),   // As the value of slider takes only double. It is the active value of the slider.
                          min: 120.0,    // The minimum value that the slider can move to. Min and Msx values can be made constants.
                          max: 220.0,    // The maximum value that the slider can move to.
                          onChanged: (double newValue){   // This newValue argument passed is returned when the value of slider is changed.
                            setState(() {          // Set State changes the state of slider and shows its movements.
                              height = newValue.round();   // Sets the newValue Value to the height using slider.
                            });
                          }
                      ),
                    ),
                  ],
                )
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableWidget(
                        color: Color(0xFF1A1E33),
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT", style: kLabelTextStyle,),
                            Text(weight.toString(), style: kValueStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        )
                    )  // Normal way of declaring a property. Different to perform changes later on.
                  ),
                  Expanded(
                    child: ReusableWidget(
                      color: Color(0xFF1A1E33),
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: kLabelTextStyle,),
                          Text(age.toString(), style: kValueStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: (){
                
                CalculatorBrain cal = CalculatorBrain(bmiHeight: height, bmiWeight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context){   // Pushes new screen on to the new one. Just like a stack.
                  return ResultPage(
                    bmi: cal.getbmi(),
                    result: cal.returnResult(),
                    interpretation: cal.returnInterpretation(),

                  );   // Returns the new Screen as output and materialPage route sets the theme of the new screen as we have defined for our material app.
                },),);
              },
              value: "CALCULATE",
            )
          ],
        ));
  }
}



enum Gender{   // Enum is used to create value that can have multiple states. Like gender can be male and female.
               // Similarly car type can have different values. Also enum is created outside class. Ad inside class a value id created using enum name as datatype.
  male,
  female
}

/*
We can extract widgets that do the same work into a separate class to make our code look simpler.
This is also done so that changing in the code becomes easier.
This newly created widget class works in same way as any other class works.
It has a constructor ans we can also specify some properties that should change later on during the code.
For simplicity we have extracted widgets to form new files containing their own classes
 */


/*   //  For reference and practice of using themes and gesture detector
    Center(
        child: Text("Body Here"),
      ),
      floatingActionButton: Theme(    // We can also change the theme of any Widget individually.
        data: ThemeData(accentColor: Colors.purple),   // Theme widget is used for this purpose and it always requires a data property to be defined
        child: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
      ),

      GestureDetector(   // Gesture detector is used to detect gestures and taps on the screen. It is used instead of flat button as it contain only tapping and gesture properties and not others.
                      onTap: (){
                        setState(() {
                          updateColor(Gender.male);  // Using enum
                        });
                      },
                    ),
 */
