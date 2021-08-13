import 'package:bakerpops_app_v2/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddItemWidget extends StatefulWidget {
  //const AddItemWidget({Key? key}) : super(key: key);
  final String text;

  AddItemWidget({required this.text});

  @override
  _AddItemWidgetState createState() {
    return _AddItemWidgetState(text);
  }
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final String text;
  bool autoValidate = true;
  bool readOnly = false;
  ValueChanged _onChanged = (val) => print(val);
  //final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormBuilderState>();
  //final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  _AddItemWidgetState(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    CustomText(text: 'Cake Name', size: 18),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                //Divider(height: 5.0, color: Colors.black),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Add TextFormFields and ElevatedButton here.
                      FormBuilderRadioGroup(
                        name: 'Flavour',
                        validator: FormBuilderValidators.required(context),
                        decoration: InputDecoration(
                            labelText: 'Base Flavour',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        options: [
                          "Chocolate",
                          "Bluberry",
                          "Vanilla",
                          "Nutella",
                          "Mixed Fruit"
                        ]
                            .map((flavour) => FormBuilderFieldOption(
                                  value: flavour,
                                  child: Text('$flavour'),
                                ))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        name: 'i_flavour',
                        validator: FormBuilderValidators.required(context),
                        decoration: InputDecoration(
                            labelText: 'Icing Flavour',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        options: [
                          "Chocolate",
                          "Bluberry",
                          "Vanilla",
                          "Nutella",
                          "Mixed Fruit"
                        ]
                            .map((flavour) => FormBuilderFieldOption(
                                  value: flavour,
                                  child: Text('$flavour'),
                                ))
                            .toList(growable: false),
                      ),
                      FormBuilderRadioGroup(
                        name: 'f_flavour',
                        validator: FormBuilderValidators.required(context),
                        decoration: InputDecoration(
                            labelText: 'Fondant Flavour',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        options: [
                          "Chocolate",
                          "Bluberry",
                          "Vanilla",
                          "Nutella",
                          "Mixed Fruit"
                        ]
                            .map((flavour) => FormBuilderFieldOption(
                                  value: flavour,
                                  child: Text('$flavour'),
                                ))
                            .toList(growable: false),
                      ),
                    ],
                  ),
                  onChanged: () => print('Form has changed'),
                  autovalidateMode: AutovalidateMode.always,
                  initialValue: {
                    'Flavour': 'Chocolate',
                    'i_flavour': 'Chocolate',
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState!.save();
                          final data =
                              _formKey.currentState!.fields['Flavour']!.value;
                          print(data);
                          final alldata = _formKey.currentState!.value;
                          print(alldata);
                          //_formKey.currentState!.save();
                          //if (_formKey.currentState!.validate()) {
                          //  print(_formKey.currentState.value);
                          //} else {
                          //  print("validation failed");
                          //print(_formKey.currentStat);
                          //  print(_formKey.currentState!.value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
