import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:networking/network/test_service.dart';
import 'package:networking/ui/BranchModel.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TestService testService;
  Response<dynamic> testResponse;
  Response<dynamic> testResponse1;
  List<BranchModel> _branchlist = [];
  final homeKey = GlobalKey<ScaffoldState>();
  bool is_loaded =false;

  @override
  void initState() {
    super.initState();
    majak();
  }

  void majak() async{
    testService = await TestService.create();
    var data = {'page': '1', 'uid': '1'};
    testResponse = await testService.getBranches(data);
    List list = testResponse.body['result'] as List;
    _branchlist = list.map<BranchModel>((json) => BranchModel.fromJson(json)).toList();
    setState(() {
      is_loaded =true;
    });
   // print(_branchlist[0].BranchName);
    //print(testResponse.body['result']);
  }

  showAlertDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5),child:Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(" Loading ...",style: TextStyle(fontSize: 18), ),
          )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: homeKey,
      appBar: AppBar(
        title: Text('Majak'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {

              showAlertDialog(context);

              var data = {
                "uid" : "1",
                "BranchName" : "Union",
                "Name" : "Sunny",
                "Mobile" : "7016378313",
                "Email" : "business@koffeekodes.com",
                "Address" : "Udhana",
                "gst" : "24HEEPS7046DIZE",
                "password" : "123"
              };
              testService = await TestService.create();
               testResponse1 = await testService.createBranches(data);
              if( testResponse1.isSuccessful){
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/home');
              }
              else{
                Navigator.pop(context);
                Fluttertoast.showToast(
                  msg: "Error",
                  textColor: Colors.black,
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIos: 2,
                  fontSize: 15,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.white,
                );
              }



            },
          )
        ],
      ),
      body: _branchlist !=null ? Builder(
        builder: (context){
          if(is_loaded==true)
          {
            if (_branchlist.isEmpty) {
              return Center(
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Empty",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(height: 20 ,)
                        ],
                      )
                  ));
            }
          }
          else{
            return Center (
              child: CircularProgressIndicator(),
            );
          }
          return  ListView.builder(
              itemCount: _branchlist.length,
              physics: const AlwaysScrollableScrollPhysics(),
              addAutomaticKeepAlives: true,
              cacheExtent: 100.0,
              scrollDirection: Axis.vertical,
              itemBuilder:  (context, index){
                var sr= index+1;
                return Padding(
                  padding: EdgeInsets.only(top: 5,left: 5,right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        child: Card(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical:10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5,top: 2),
                                        child: Text(sr.toString()+'.',
                                          textAlign: TextAlign.center
                                        )
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Branch Name: "+_branchlist[index].BranchName),
                                              SizedBox(height: 2,),
                                              Text("Branch No: "+_branchlist[index].Mobile),
                                              SizedBox(height: 2,),
                                              Text("Email : "+_branchlist[index].Email),
                                              SizedBox(height: 2,),
                                              Text("Address : "+_branchlist[index].Address),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          );
        },
      ) :Center(child: CircularProgressIndicator(),),
    );
  }
}
