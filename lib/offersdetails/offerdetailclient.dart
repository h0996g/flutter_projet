import 'package:agence/home/home.dart';
import 'package:agence/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/cubitHome/cupit_home.dart';

class Offerdetailclient extends StatefulWidget {
  Offerdetailclient({Key? key}) : super(key: key);

  @override
  State<Offerdetailclient> createState() => _OfferdetailclientState();
}

class _OfferdetailclientState extends State<Offerdetailclient> {
  var onbordingController = PageController();

  List<String> models = [
    'assets/images/on2.png',
    'assets/images/building.jpg',
    'assets/images/design.png'
  ];

  int a=0;
  String number='07666666';
  void initState() {
    super.initState();
    number='06666554';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 295,

                color: Colors.white54,
                // child: Image(image:AssetImage('assets/images/building.jpg'),fit: BoxFit.cover,),
                child: PageView.builder(
                  onPageChanged: (int index) {
                    // if (index == models.length - 1) {
                    //   islast = true;
                    //
                    //   setState(() {
                    //     nextIcon = const Icon(Icons.done);
                    //   });
                    // } else {
                    //   islast = false;
                    //
                    //   setState(() {
                    //     nextIcon = const Icon(Icons.arrow_forward_ios);
                    //   });
                    // }
                  },
                  controller: onbordingController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Ala(models[index]),
                  itemCount: 3,
                ),
              ),
              Positioned(
                top: 45,
                left: -5,


                child: MaterialButton(
                  onPressed: () {Changepage(context, Home());},
shape: const CircleBorder(),
                  color: CupitHome.get(context).dartSwitch ? Colors.black : Colors.blue,
                  child: Icon(Icons.arrow_back_ios_outlined,color:CupitHome.get(context).dartSwitch ? Colors.white : Colors.white, ),

                ),
              ),
              Positioned(bottom:20,left:140,child: SmoothPageIndicator(
                  controller: onbordingController, // PageController
                  count: models.length,
                  effect: ScrollingDotsEffect(
                    dotColor:CupitHome.get(context).dartSwitch ? Color(0xffb3b2b2) : Colors.white,
                    activeDotColor: CupitHome.get(context).dartSwitch ?  Color(0xff131313): Colors.blue,
                  ),

                  // effect: const ExpandingDotsEffect(
                  //
                  //     dotWidth: 20,
                  //     dotHeight: 15,
                  //     dotColor: Colors.black26,
                  //     activeDotColor:
                  //     Colors.deepOrange), // your preferred effect
                  onDotClicked: (index) {}),)

            ],
          ),

          Divider(
            color: CupitHome.get(context).dartSwitch
                ? Colors.blueGrey
                : Color(0xffF3F3F3FF),
            height: 1,
            thickness: 2,
          ),
          SizedBox(height: 5,),
          Row(children: [
            SizedBox(width: 20,),
            Text(
              "\$245.00",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 32,
              ),
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              color: CupitHome.get(context).dartSwitch ? Color(0xff8d8d8d): Colors.blue,
              child: Icon(Icons.favorite_sharp,color:CupitHome.get(context).dartSwitch ? Colors.white : Colors.white, ),

            )
          ],),
          SizedBox(height: 6,),
          Row(children: [
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                '730 Columbus Ave, Manhattan, Ny 10025',
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 20,),
            Text('Se Loger',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(width: 20,),

          ],),
          SizedBox(height: 12,),
          Divider(
            color: CupitHome.get(context).dartSwitch
                ? Colors.blueGrey
                : Color(0xffF3F3F3FF),
            height: 1,
            thickness: 2,
          ),
          Row(children: [

            Expanded(
              child: Container(

                height: 54,
                child: MaterialButton(padding: EdgeInsets.all(0),onPressed: () {setState(() {
                  a=0;
                });  },
                  child: Column(children: [
                    SizedBox(height: 5,),
                    Icon(Icons.description_outlined,color:a == 0 ? Colors.red: Colors.blue,),
                    Text('Description',style:TextStyle(color:a == 0 ? Colors.red: Colors.blue,fontSize: 14)),
                    SizedBox(height: 7,)
                  ],),

                ),

              ),
            ),

    //         VerticalDivider(
    //           thickness: 2,
    //            width: 2,
    //            color: CupitHome.get(context).dartSwitch
    // ? Color(0xff131313)
    //     : Color(0xffF3F3F3FF),
    //         ),

            Expanded(
              child: Container(
                color: CupitHome.get(context).dartSwitch
                    ? Color(0xff131313)
                    : Colors.white,
                height: 54,
                child: MaterialButton(padding: EdgeInsets.all(0),onPressed: () { setState(() {
                  a=1;
                }); },
                child: Column(children: [
                  SizedBox(height: 5,),
    Icon(Icons.menu_sharp,color:a == 1 ? Colors.red: Colors.blue,),
    Text('Details',style:TextStyle(color:a == 1 ? Colors.red: Colors.blue,fontSize: 14)),
                  SizedBox(height: 7,)
                ],),

              ),
            ),),
            // VerticalDivider(
            //     thickness: 2,
            //   width: 2,
            //     color: CupitHome.get(context).dartSwitch
            //         ? Color(0xff131313)
            //         : Color(0xffF3F3F3FF),
            // ),
            Expanded(
              child: Container(

                height: 54,
                child: MaterialButton(padding: EdgeInsets.all(0),onPressed: () {  setState(() {
                  a=2;
                });},
                  child: Column(children: [
                    SizedBox(height: 5,),
                    Icon(Icons.message_outlined,color:a == 2 ? Colors.red: Colors.blue,),
                    Text('Commentaire',style:TextStyle(color:a == 2 ? Colors.red: Colors.blue,fontSize: 14)),
                    SizedBox(height: 7,)
                  ],),

                ),

              ),
            ),
            // VerticalDivider(
            //     thickness: 2,
            //   width: 2,
            //     color: CupitHome.get(context).dartSwitch
            //         ? Color(0xff131313)
            //         : Color(0xffF3F3F3FF),
            // ),
            Expanded(
              child: Container(

                height: 54,
                child: MaterialButton(padding: EdgeInsets.all(0), onPressed: () async {
                  FlutterPhoneDirectCaller.callNumber(number);
                },
                  child: Column(children: [
                    SizedBox(height: 5,),
                    Icon(Icons.call,color: Colors.blue,),
                    Text('Call',style:TextStyle(color:Colors.blue,fontSize: 14)),
                    SizedBox(height: 7,)
                  ],),

                ),

              ),
            ),

          ],),
          Divider(
            color: CupitHome.get(context).dartSwitch
                ? Colors.blueGrey
                : Color(0xffF3F3F3FF),
            height: 1,
            thickness: 2,
          ),

          Container(
            child: a==0 ? Text('ala') : (a==1 ?Text('baba'): Text('sousou')),
          ),

        ],
      ),
    );
  }
}

Widget Ala(String k) => Image(
image: AssetImage('${k}'),fit: BoxFit.cover,);


