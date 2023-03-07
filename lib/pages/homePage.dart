import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../controller.dart';
import '../utils/Transaction.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Transaction>>? transactionsFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: FutureBuilder<List<Transaction>>(
          future: transactionsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        
                      ),
                      child: ListTile(
                        title: Text('ID : ${snapshot.data![index].id}'),
                        subtitle:
                            Text('MINISTRY : ${snapshot.data![index].amount}'),
                        trailing: Text('\$${snapshot.data![index].amount}'),
                      ));
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            transactionsFuture = Controller()
                .get("http://192.168.56.1:9999/finance-service/transaction");
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}
