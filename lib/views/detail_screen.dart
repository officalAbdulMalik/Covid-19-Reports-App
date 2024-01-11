import 'package:flutter/material.dart';

import 'cutom_widget/app_custom_widget.dart';

class DetailScreen extends StatefulWidget {
  var data;
  int index;
  DetailScreen({super.key, required this.data, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data[widget.index]['country']),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          children: [
            const SizedBox(
              height: 110,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Card(
                    elevation: 5.5,
                    color: Colors.blue.shade50,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        children: [
                          const Spacer(),
                          Expanded(
                            child: AppCustomWidgt.reusableRow(
                                title: 'Cases',
                                value: widget.data[widget.index]['cases']),
                          ),
                          const Divider(),
                          Expanded(
                            child: AppCustomWidgt.reusableRow(
                                title: 'Deaths',
                                value: widget.data[widget.index]['deaths']),
                          ),
                          const Divider(),
                          Expanded(
                            child: AppCustomWidgt.reusableRow(
                                title: 'Recovered',
                                value: widget.data[widget.index]['recovered']),
                          ),
                          const Divider(),
                          Expanded(
                            child: AppCustomWidgt.reusableRow(
                                title: 'Tests',
                                value: widget.data[widget.index]['tests']),
                          ),
                          const Divider(),
                          Expanded(
                            child: AppCustomWidgt.reusableRow(
                                title: 'Critical',
                                value: widget.data[widget.index]['critical']),
                          ),
                          const Divider(),
                          Expanded(
                            child: AppCustomWidgt.reusableRow(
                                title: 'OneCasePerPeople',
                                value: widget.data[widget.index]
                                    ['oneCasePerPeople']),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    left: 130,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          widget.data[widget.index]['countryInfo']['flag']),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
