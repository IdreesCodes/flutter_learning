import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../model/dbhelper.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}


class _DatabaseScreenState extends State<DatabaseScreen> {

  var check ='';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Screen'),
      ),
        body: Column(

          children: [
            Container(
              child: TextButton(onPressed: () async{
                final dbHelper = DatabaseHelper();
                await dbHelper.open();

                final customJson = '''{
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com"
  }''';


                await dbHelper.insertJson(customJson);


                final jsonDataList = await dbHelper.retrieveJsonData();
                for (final item in jsonDataList) {
                  final jsonData = item['jsonData'];
                  print('Retrieved JSON: $jsonData');
                  check= jsonData;

                }
              }, child: Text(check),

              ),

            ),


          ],
        ),
    );
  }
}
