import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:manashmanashmanash/data/widget.dart';

import 'dart:convert';

class DisplayResult extends StatefulWidget {
  @override
  _DisplayResultState createState() => _DisplayResultState();
}

class _DisplayResultState extends State<DisplayResult> {
  Map requestMapResponse;
  // List listOfRequest;
  // List listOfloc;
  List listOfSites;

  Future fetchResult() async {
    http.Response response;
    response = await http.get(
        'http://api.divesites.com/?mode=sites&lat=47.6031537682643&lng=-122.336164712906&dist=25');

    if (response.statusCode == 200) {
      setState(() {
        requestMapResponse = json.decode(response.body);
        listOfSites = requestMapResponse['sites'];
        //sites = requestMapResponse['sites'];

        // listOfloc = requestMapResponse['loc'];
        // listOfSites = requestMapResponse['sites'];
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
      body: Container(
        padding: EdgeInsets.only(top: 25, left: 15, right: 15),
        child: requestMapResponse == null
            ? Center(
                child: Container(
                  child: Text('Error'),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, int index) {
                          return Container(
                            child: Column(
                              children: [
                                ValueContainer(
                                  mainText: 'Current:',
                                  dataText:
                                      listOfSites[index]['currents'].toString(),
                                ),
                                Container(
                                  child: Text(requestMapResponse['timestamp']
                                      .toString()),
                                ),
                              ],
                            ),
                          );
                        }),

                    //     : ValueContainer(
                    //         mainText: 'Current:',
                    //         dataText: listOfSites[index]['currents'].toString(),
                    //       ),

                    // ValueContainer(
                    //   mainText: 'Current:',
                    //   dataText: "Parsed Value",
                    // ),
                    // ValueContainer(
                    //   mainText: 'Current:',
                    //   dataText: "Parsed Value",
                    // ),
                    // ValueContainer(
                    //   mainText: 'Current:',
                    //   dataText: "Parsed Value",
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
