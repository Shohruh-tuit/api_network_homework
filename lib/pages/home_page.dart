import 'package:api_netwok_homework/model/emp_model.dart';
import 'package:api_netwok_homework/model/emplist_model.dart';
import 'package:api_netwok_homework/pages/details_page.dart';
import 'package:api_netwok_homework/services/http_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = new List();

  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
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
      items = empList.data;
    });
  }

  //
  @override // dwdwd
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
    // _apiEmpOne(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.id);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              emp.employee_name + "(" + emp.employee_age.toString() + ")",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              emp.employee_salary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
