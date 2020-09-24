import 'package:flutter/material.dart';
import 'FormPage.dart';
import 'GetUser.dart';
import 'User.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchUsers(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,index){
                  Users user = snapshot.data[index];
                  return Table(
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Text('${user.name}'),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Text('${user.password}'),
                              )
                            ],
                          ),
                        ]
                      )
                    ],
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
      floatingActionButton: FloatingActionButton.extended(
         label : Text('+',
           style: TextStyle(fontSize: 30),
         ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage()),).then((value) => setState(() {})),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
