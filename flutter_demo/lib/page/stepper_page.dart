import 'package:flutter/material.dart';

class StepperPageDemo extends StatefulWidget {
  StepperPageDemo({Key key}) : super(key: key);

  @override
  _StepperPageDemoState createState() => _StepperPageDemoState();
}

class _StepperPageDemoState extends State<StepperPageDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep,
                // 步骤点击之后会触发
                onStepTapped: (int index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                // continue点击后会触发
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text("学习基础语法"),
                    subtitle: Text("dart基础语法"),
                    content: Text("速度快放假得劲儿几个多晶硅栅飞机文儿童内退拉女警死垃圾费文件水电费啊"),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text("学习基础部件"),
                    subtitle: Text("flutter常用部件"),
                    content: Text("速度快放假得劲儿几个多晶硅栅飞机文儿童内退拉女警死垃圾费文件水电费啊"),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text("开始开发demo"),
                    subtitle: Text("进入项目阶段"),
                    content: Text("速度快放假得劲儿几个多晶硅栅飞机文儿童内退拉女警死垃圾费文件水电费啊"),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
