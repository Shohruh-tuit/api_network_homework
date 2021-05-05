import 'package:api_netwok_homework/model/emp_model.dart';
import 'package:api_netwok_homework/model/emplist_model.dart';
import 'package:api_netwok_homework/services/http_service.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static final String id = "details_page";
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Employee> item = new List();

  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response),
            })
        .catchError((onError) => {
              print("Error: $onError"),
            });
  }

  void _showResponse(String response) {
    EmpList empList = Network.parseEmpList(response);
    setState(() {
      item = empList.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
