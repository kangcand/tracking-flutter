import 'package:flutter/material.dart';
import '../models/indonesia_model.dart';
import './../services/indonesia_service.dart';

void main() {
  runApp(new MaterialApp(
    title: "Halaman Data",
    home: new Data(),
  ));
}

class Data extends StatelessWidget {
  final GetIndonesia _getIndoData = new GetIndonesia();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Tracking Data"),
      ),
      body: new Container(
        child: FutureBuilder(
          future: _getIndoData.manggilIndonesiaData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Indonesia>> snapshot) {
            if (snapshot.hasData) {
              List<Indonesia> dataIndo = snapshot.data;
              return ListView.builder(
                itemCount: dataIndo.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.grey, Colors.blue],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Card(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    "Tracking Covid 19",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height * 0.20,
                              padding: EdgeInsets.all(10),
                              child: Card(
                                color: Colors.amber,
                                child: Center(
                                  child: Text(
                                    "Positif \n" +
                                        dataIndo[index].positif.toString() +
                                        " Orang",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height * 0.20,
                              padding: EdgeInsets.all(10),
                              child: Card(
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "Sembuh \n" +
                                        dataIndo[index].sembuh.toString() +
                                        " Orang",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.20,
                              padding: EdgeInsets.all(5),
                              child: Card(
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    "Meninggal \n" +
                                        dataIndo[index].meninggal.toString() +
                                        " Orang",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
