import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _longituteFocusNode = new FocusNode();
  final FocusNode _radiusFocusNode = new FocusNode();

  final _homePageFormKey = GlobalKey<FormState>();

  final TextEditingController _latitudeTextEditingController =
      new TextEditingController();
  final TextEditingController _longitudeTextEditingController =
      new TextEditingController();
  final TextEditingController _radiusTextEditingController =
      new TextEditingController();

  String validate(val) {
    if (val.isEmpty) {
      return 'Enter the correct value';
    } else if (val > 300) {
      return 'Incorrect amount of value';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scuba'),
            Text(
              'Divers',
              style: TextStyle(color: Colors.cyan),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _homePageFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: validate,
                    controller: _latitudeTextEditingController,
                    onEditingComplete: () {
                      setState(() {
                        FocusScope.of(context)
                            .requestFocus(_longituteFocusNode);
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Latitude Value',
                      hintStyle: TextStyle(color: Colors.grey[900]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: validate,
                    keyboardType: TextInputType.number,
                    focusNode: _longituteFocusNode,
                    controller: _longitudeTextEditingController,
                    onEditingComplete: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(_radiusFocusNode);
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Longitude Value',
                        hintStyle: TextStyle(color: Colors.grey[900])),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: validate,
                    focusNode: _radiusFocusNode,
                    controller: _radiusTextEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Radius Value',
                        hintStyle: TextStyle(color: Colors.grey[900])),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                    child: Text('Sumbit'),
                    onPressed: () {
                      if (_homePageFormKey.currentState.validate()) {
                        setState(() {});
                      } else
                        return 'Error';
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
