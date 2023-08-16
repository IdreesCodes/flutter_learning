import 'dart:core';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../component/reuseable_container.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  double answer = 0;
  var ans = '';
  var userInput1 = '';

  int firstNum=0;
  int secNum = 0;
  var history ='';
  var textToDisplay = '';
  var res = '';
  var op = '';


  void btnClick (String btnVal) {
    print(btnVal);
    if(btnVal == 'C')
      {

        setState(() {
          textToDisplay = '';
          firstNum=0;
          secNum=0;
          res ='';
        });

      }
    else if(btnVal == '+' || btnVal == '-'|| btnVal == 'x' || btnVal == '/' ){
      firstNum = int.parse(textToDisplay);
      res= '';
      op = btnVal;


    }
    else if (btnVal == '='){
      secNum =int.parse(textToDisplay);
      if(op== '+'){
        res =(firstNum +secNum).toString();
        history = firstNum.toString() + op.toString() + secNum.toString();

      }
      if(op== '-'){
        res =(firstNum - secNum).toString();
        history = firstNum.toString() + op.toString() + secNum.toString();

      }
      if(op== 'x'){
        res =(firstNum * secNum).toString();
        history = firstNum.toString() + op.toString() + secNum.toString();

      }
      if(op== '/'){
        res =(firstNum / secNum).toString();
        history = firstNum.toString() + op.toString() + secNum.toString();

      }
    }
    else {
      res = int.parse(textToDisplay+ btnVal).toString();
    }
    setState(() {
      textToDisplay= res;
    });
  }

  void clear() {
    setState(() {
      userInput = '';
      answer = 0;
      ans = '';
      userInput1 = '';
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      history.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    Text(
                      textToDisplay.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              btnClick;
                            },
                            child: Button(
                              title: 'C',
                              bgColor: Colors.grey,
                              textColor: Colors.black, callBack: btnClick,
                            ),
                          ),
                          Button(
                            title: '1/2',
                            bgColor: Colors.grey,
                            textColor: Colors.black, callBack: (){},
                          ),
                          Button(
                            callBack: btnClick,
                            title: '%',
                            bgColor: Colors.grey,
                            textColor: Colors.black,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='/';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '/',
                              bgColor: Colors.orange,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='7';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '7',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,

                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='8';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '8',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,

                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='9';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '9',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,

                            ),
                          ),
                          InkWell(
                            onTap: () {

                              setState(() {
                                userInput +='x';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: 'x',
                              bgColor: Colors.orange,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap : (){
                              setState(() {
                                userInput +='4';
                              });
                            },

                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  userInput +='4';
                                });
                              },
                              child: Button(
                                callBack: btnClick,
                                title: '4',
                                bgColor: Colors.grey.shade800,
                                textColor: Colors.white,
                                // onTap: () => onNumberPressed('4'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                userInput +='5';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '5',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                              // onTap: () => onNumberPressed('5'),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                userInput +='6';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '6',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                              // onTap: () => onNumberPressed('6'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='-';
                              });
                              for(int i = 0;i <userInput.length;i++){
                                if(userInput[i] == '+' || userInput[i] == 'x' || userInput[i] == '-' ||userInput[i] == '/'){

                                }
                                else{

                                }
                              }

                            },
                            child: Button(
                              callBack: btnClick,
                              title: '-',
                              bgColor: Colors.orange,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='1';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '1',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='2';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '2',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='3';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '3',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='+';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '+',
                              bgColor: Colors.orange,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='0';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '0',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                userInput +='.';
                              });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '.',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   userInput +='=';
                              // });
                            },
                            child: Button(
                              callBack: btnClick,
                              title: '=',
                              bgColor: Colors.grey.shade800,
                              textColor: Colors.white,
                            ),
                          ),
                          Button(
                            callBack: btnClick,
                            title: '',
                            bgColor: Colors.orange,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Button extends StatelessWidget {
//   final String title;
//   final Color bgColor;
//   final Color textColor;
//   final VoidCallback onTap;
//
//   const Button({
//     Key key,
//     @required this.title,
//     @required this.bgColor,
//     @required this.textColor,
//     this.onTap,
//   }) :
