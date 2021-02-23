//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
//import 'package:hoizzi/mockData/homepageData.dart';
//import 'package:hoizzi/routes.dart';
//import 'SqliteLibraries/userManagement.dart';
// import 'package:http/http.dart' as http;
// import 'package:start_count/featured.dart';
// import 'package:start_count/mockData/homepageData.dart';
// import 'package:start_count/routes.dart';
// import 'package:start_count/sampleComponent.dart';
//import 'package:hoizzi/webService.dart';

// ------ T R A N S F E R   D A T A   C O N T R O L ------

class SamplePage extends StatefulWidget {
  final dynamic transferData;

  SamplePage({Key key, this.transferData}) : super(key: key);
  @override
  _SamplePageState createState() => _SamplePageState(this.transferData);
}

// ------ T R A N S F E R   D A T A   C O N T R O L    E N D S ------

class _SamplePageState extends State<SamplePage> {
  // ------ N E T W O R K   I M A G E S   C O N T R O L ------

  //String protocol2 = StateVariables.protocolPath;
  //String protocol3 = 'http://cquiz.com.ng/radrloop/controllers/adminProcessors/';
  //String protocol3 = 'http://192.168.43.17/radrloop/controllers/adminProcessors/';
  //String protocol2 = 'http://cquiz.com.ng/elearn/controllers/adminProcessors/elearnui';
  //final String phpEndPoint = 'http://192.168.43.17/radrloop/controllers/adminProcessors/uploadUserPic.php';
  //final String phpEndPoint = 'http://cquiz.com.ng/radrloop/controllers/adminProcessors/uploadUserPic.php';

  // ------ N E T W O R K   I M A G E S   C O N T R O L    E N D S ------

  // ------ M E D I A  Q U E R Y   C O N T R O L ------

  dynamic deviceWidth;
  dynamic deviceHeight;
  MediaQuery orientation;

  // ------ M E D I A  Q U E R Y   C O N T R O L   E N D S ------

  // ------ P A G E  D A T A   M A N A G E M E N T ------
  dynamic transferData;
  Map<String, dynamic> userData = {'username': 'default'};
  dynamic pageData = [];
  // ------ P A G E  D A T A   M A N A G E M E N T   E N D S ------

  // ------ P A G E   S T A T E  C O N T R O L   V A R I A B L E S ------

  bool loading = true;
  String responseStatus;
  BuildContext scaf;

  // ------ P A G E   S T A T E  C O N T R O L   V A R I A B L E S   E N D S ------

  // ------ P A G E   T H E M E   M A N A G E M E N T ------

  Color containerBack = Color(0xffE8EBE4);
  Color general = Color(0xff0C4A60);
  Color science = Color(0xffEF6C33);
  Color social = Color(0xffE1DDDB);
  Color arts = Color(0xffE1DDDB);

  // ------ P A G E   T H E M E   M A N A G E M E N T   E N D S ------

  _SamplePageState(this.transferData);

  // ------ P A G E   I N I T I A L I Z A T I O N   M E T H O D  E N D S ------

  @override
  initState() {
    //retrieveUser(1);
    print(transferData);
    super.initState();
  }

  // ------ P A G E   I N I T I A L I Z A T I O N   M E T H O D ------

  // ------ D E V I C E   S T O R A G E   C O N T R O L S ------

  retrieveUser(dataID) async {
    //var result = await UserManagement.retrieve(dataID);
    //userData = result[0];

    //userData['username'] = name;
    setState(() {
      loadPageData();
    });
    //print(userData['username']);
  }

  // ------ D E V I C E   S T O R A G E   C O N T R O L S E N D S ------

  // ------ H T T P   O N L O A D   C A L L S ------

  loadPageData() async {
    var sendData = {
      'user_id': "${userData['user_id']}",
      'category_id': "${transferData['category_id']}",
    };

    print(sendData);

    loading = true;
    //var result = await getProductPageDetails(http.Client(),sendData);
    loading = false;

    setState(() {
      //pageData = result[0];

      print('page datas here');
      print(pageData);
    });
  }

  // ------ H T T P   O N L O A D   C A L L S  E N D S ------

  // ------ H T T P   S E N D   C A L L S ------

  sends(data, context) async {
    var sendData = {
      'topic_id': '${data['id']}',
      'subject_id': '${data['subject_id']}',
      'user_id': "$userData['user_id']",
      'title': data['title'],
      'exam': data['exam'],
      'path': data['path']
    };
    loading = true;
    setState(() {});
    //var response = await addUserTopic(http.Client(), sendData);
    //responseStatus = response[0];
    print('response here');
    print(responseStatus);
  }

  // ------ H T T P   S E N D   C A L L S   E N D S ------

  // ------ H T T P   G E T   C A L L S ------

  gets(data, context) async {
    var sendData = {
      'topic_id': '${data['id']}',
      'subject_id': '${data['subject_id']}',
      'user_id': "$userData['user_id']",
      'title': data['title'],
      'exam': data['exam'],
      'path': data['path']
    };
    loading = true;
    setState(() {});
    //var response = await addUserTopic(http.Client(), sendData);
    //responseStatus = response[0];
    print('response here');
    print(responseStatus);
  }

  // ------ H T T P   G E T   C A L L S   E N D S ------

  @override
  Widget build(BuildContext context) {
    // ------ E N T R Y   S T A T E   C O N T R O L S ------

    scaf = context;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    // ------ E N T R Y   S T A T E   C O N T R O L S   E N D S------

    // ------ P A G E ------

    return Scaffold(
      //backgroundColor: Colors.white,

      // ------ P A G E   B O D Y ------
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: deviceWidth * 1,
            height: deviceHeight * 0.3,
            //color:Colors.purple,
            decoration: BoxDecoration(
              color: Color(0xff0C4A60),
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: Stack(children: [
              Positioned(
                top: deviceHeight * 0.08,
                child: Container(
                  child: Container(
                    width: deviceWidth * 0.86,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AR Zoo',
                          //   style: GoogleFonts.openSans(
                          //   textStyle:TextStyle(
                          //   fontWeight: FontWeight.w500,
                          //   fontSize: 19,
                          //   color: Colors.white
                          //   ),
                          // ),
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: deviceHeight * 0.16,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: deviceWidth * 0.86,
                  height: deviceHeight * 0.07,
                  //color:Colors.purple,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Search AR...',
                    // style: GoogleFonts.openSans(
                    //         textStyle:TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 15,
                    //         color: Colors.white.withOpacity(0.5)
                    //         ),
                    //       ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: ListView(
              children: [
                FeaturedCards(context),
                SizedBox(height: 13),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(left: 16),
                    child: sHC(context, 'Mammals')),
                // CircleCards(context, HomeData.homeDecor),
                SizedBox(height: 13),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(left: 16),
                    child: sHC(context, 'Reptiles')),
                // CircleCards(context, HomeData.gardeningTools),
                SizedBox(height: 13),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(left: 16),
                    child: sHC(context, 'Birds')),
                //CircleCards(context, HomeData.homeDecor),
                SizedBox(height: 13),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(left: 16),
                    child: sHC(context, 'Fish')),
                // CircleCards(context, HomeData.homeDecor),
                SizedBox(height: 13),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(left: 16),
                    child: sHC(context, 'Amphibians')),
                //  CircleCards(context, HomeData.homeDecor),
              ],
            ),
          )
        ],
      ),

      // ------ P A G E   B O D Y   E N D S ------
    );

    // ------ P A G E   E N D S ------
  }

  // ------ P A G E   C O M P O N E N T S ------

  // Section Header Component
  sHC(context, text) {
    return Container(
        child: Text('$text',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto')));
  }

  // Circle Card Component Start
  CircleCards(context, list) {
    return Container(
        margin: EdgeInsets.only(top: deviceHeight * 0.01, left: 5),
        height: deviceHeight * 0.158,
        child: CircleCardSlide(context, list));
  }

  CircleCardSlide(context, list) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, position) {
            return CircleCardList(context, list[position]);
          }),
    );
  }

  CircleCardList(context, data) {
    return GestureDetector(
      // onTap: (){
      //   transferData = {'title':'Accounting', 'data':data, 'id':userData['user_id'], 'path':'blah'};
      //   Navigator.of(context)
      //   .push(Routes.goToARView(transferData));
      // },
      child: Container(
          margin: EdgeInsets.only(left: 15),
          //padding: EdgeInsets.all(8),
          width: deviceWidth * 0.29,
          height: deviceHeight * 0.48,
          decoration: BoxDecoration(
            //color: Colors.blue,
            borderRadius: new BorderRadius.circular(10.0),
            // boxShadow: [
            //       new BoxShadow(
            //         color: Colors.grey,
            //         offset: new Offset(0.0, 0.0),
            //         blurRadius: 2
            //       )
            //     ],
          ),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: deviceWidth * 0.42,
                  height: deviceHeight * 0.12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('${data['path']}'),
                          fit: BoxFit.cover)),
                ),
              ])),
    );
  }
  // Card Component End

  // Featured Card Component Start
  FeaturedCards(context) {
    return Container(
        margin: EdgeInsets.only(top: deviceHeight * 0.01, left: 5),
        height: deviceHeight * 0.328,
        child: FeaturedCardSlide(context));
  }

  FeaturedCardSlide(context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // itemCount: HomeData.featured.length,
          itemBuilder: (context, position) {
            //  return  FeaturedCardList(context, HomeData.featured[position]);
          }),
    );
  }

  FeaturedCardList(context, data) {
    return GestureDetector(
      // onTap: (){
      //   transferData = {'title':'${data['title']}', 'category_id':data['id'], 'id':userData['user_id'], 'path':'${data['path']}'};
      //   Navigator.of(context)
      //   .push(Routes.goToARView(transferData));
      // },
      child: Container(
          margin: EdgeInsets.only(left: 15),
          //padding: EdgeInsets.all(8),
          width: deviceWidth * 0.89,
          height: deviceHeight * 0.72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10.0),
            // boxShadow: [
            //       new BoxShadow(
            //         color: Colors.grey,
            //         offset: new Offset(0.0, 0.0),
            //         blurRadius: 2
            //       )
            //     ],
          ),
          child: Stack(children: <Widget>[
            Container(
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.23,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  //borderRadius: new BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: AssetImage('${data['path']}'), fit: BoxFit.cover)),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: deviceHeight * 0.13),
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${data['title']}',
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        //   style: GoogleFonts.openSans(
                        //   textStyle:TextStyle(
                        //   fontWeight: FontWeight.w500,
                        //   fontSize: 13,
                        //   color: Colors.white
                        //   ),
                        // ),
                      ),
                      Text(
                        '\$${data['prize']}',
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        //   style: GoogleFonts.openSans(
                        //   textStyle:TextStyle(
                        //   fontWeight: FontWeight.w500,
                        //   fontSize: 13,
                        //   color: Colors.white
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * 0.27,
              left: deviceWidth * 0.2,
              child: Container(
                width: deviceWidth * 0.7,
                child: Text(
                  'Experience the beauty beyong the rivers of south bay constriction',
                  // style: GoogleFonts.openSans(
                  //         textStyle:TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 11,
                  //         color: Colors.grey
                  //         ),
                  //       ),
                ),
              ),
            ),
            Positioned(
                top: deviceHeight * 0.275,
                left: deviceWidth * 0.15,
                child: Text(
                  '|',
                  style: TextStyle(color: Colors.grey),
                )),
            Positioned(
              top: deviceHeight * 0.263,
              left: deviceWidth * 0.05,
              child: Container(
                  child: Column(
                children: [
                  Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                  Text(
                    '${data['views']}',
                    // style: GoogleFonts.openSans(
                    //         textStyle:TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 11,
                    //         color: Colors.grey
                    //         ),
                    //       ),
                  ),
                ],
              )),
            )
          ])),
    );
  }
  // Featured Card Component End

  // ------ P A G E   C O M P O N E N T S   E N D S ------

}
