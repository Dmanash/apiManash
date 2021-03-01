import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:manashmanashmanash/data/widget.dart';

import 'dart:convert';

import 'package:manashmanashmanash/homepage/homepage.dart';

class DisplayResult extends StatefulWidget {
  @override
  _DisplayResultState createState() => _DisplayResultState();
}

class _DisplayResultState extends State<DisplayResult> {
  Map requestMapResponse;

  List listOfSites;

  Future fetchResult() async {
    http.Response response;
    response = await http.get(
        'http://api.divesites.com/?mode=sites&lat=47.6031537682643&lng=-122.336164712906&dist=25');

    if (response.statusCode == 200) {
      setState(() {
        requestMapResponse = json.decode(response.body);
        listOfSites = requestMapResponse['sites'];
      });
    }
  }

  @override
  void initState() {
    fetchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            }),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          child: requestMapResponse == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Here is the list of available sites:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: requestMapResponse == null
                              ? 0
                              : listOfSites.length,
                          itemBuilder: (context, int index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 20),
                              height: 250,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.purple,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ValueContainer(
                                      mainText: 'Name:',
                                      dataText:
                                          listOfSites[index]['name'].toString(),
                                    ),
                                    ValueContainer(
                                      mainText: 'TimeStamp:',
                                      dataText: requestMapResponse['timestamp']
                                          .toString(),
                                    ),
                                    ValueContainer(
                                      mainText: 'Distance:',
                                      dataText: listOfSites[index]['distance']
                                          .toString(),
                                    ),
                                    ValueContainer(
                                      mainText: 'Latitude:',
                                      dataText:
                                          listOfSites[index]['lat'].toString(),
                                    ),
                                    ValueContainer(
                                      mainText: 'Longitude:',
                                      dataText:
                                          listOfSites[index]['lng'].toString(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
