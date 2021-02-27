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
            children: [
              Container(
                child: TextFormField(
                  controller: _latitudeTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Latitude Value',
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  focusNode: _longituteFocusNode,
                  controller: _longitudeTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Longitude Value',
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  focusNode: _radiusFocusNode,
                  controller: _radiusTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Radius Value',
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text('Sumbit'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
