import 'package:agence/home/home.dart';
import 'package:agence/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home/cubitHome/cupit_home.dart';

class Offerdetailagence extends StatefulWidget {
  Offerdetailagence({Key? key}) : super(key: key);

  @override
  State<Offerdetailagence> createState() => _OfferdetailagenceState();
}

class _OfferdetailagenceState extends State<Offerdetailagence> {
  var onbordingController = PageController();

  List<String> models = [
    'assets/images/on2.png',
    'assets/images/building.jpg',
    'assets/images/design.png'
  ];

  int a = 0;
  // String number='07666666';
  // void initState() {
  //   super.initState();
  //   number='06666554';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 35,
            child: Stack(
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
                    onPressed: () {
                      Changepage(context, const Home());
                    },
                    shape: const CircleBorder(),
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.black
                        : Colors.blue,
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                ),
                // Positioned(
                //     top: 46,
                //     right: -5,
                //
                //
                //     child:     MaterialButton(
                //       onPressed: () {},
                //       shape: const CircleBorder(),
                //       color: CupitHome.get(context).dartSwitch ? Color(0xff8d8d8d): Colors.blue,
                //       child: Icon(Icons.favorite_sharp,color:CupitHome.get(context).dartSwitch ? Colors.white : Colors.white, ),
                //
                //     )
                // ),
                Positioned(
                  bottom: 20,
                  left: 140,
                  child: SmoothPageIndicator(
                      controller: onbordingController, // PageController
                      count: models.length,
                      effect: ScrollingDotsEffect(
                        dotColor: CupitHome.get(context).dartSwitch
                            ? const Color(0xffb3b2b2)
                            : Colors.white,
                        activeDotColor: CupitHome.get(context).dartSwitch
                            ? const Color(0xff131313)
                            : Colors.blue,
                      ),

                      // effect: const ExpandingDotsEffect(
                      //
                      //     dotWidth: 20,
                      //     dotHeight: 15,
                      //     dotColor: Colors.black26,
                      //     activeDotColor:
                      //     Colors.deepOrange), // your preferred effect
                      onDotClicked: (index) {}),
                )
              ],
            ),
          ),
          Divider(
            color: CupitHome.get(context).dartSwitch
                ? Colors.blueGrey
                : const Color(0xffF3F3F3FF),
            height: 1,
            thickness: 2,
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "\$245.00",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 32,
                      ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  color: CupitHome.get(context).dartSwitch
                      ? const Color(0xff8d8d8d)
                      : Colors.blue,
                  child: Icon(
                    Icons.settings,
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.white
                        : Colors.white,
                  ),
                ),

                // MaterialButton(
                //   onPressed: () {},
                //   shape: const CircleBorder(),
                //   color: CupitHome.get(context).dartSwitch ? Color(0xff8d8d8d): Colors.blue,
                //   child: Icon(Icons.favorite_sharp,color:CupitHome.get(context).dartSwitch ? Colors.white : Colors.white, ),
                //
                // )
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    '730 Columbus Ave, Manhattan, Ny 10025',
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Se Loger',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Divider(
            color: CupitHome.get(context).dartSwitch
                ? Colors.blueGrey
                : const Color(0xffF3F3F3FF),
            height: 1,
            thickness: 2,
          ),
          Expanded(
            flex: 8,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 54,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          a = 0;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.description_outlined,
                            color: a == 0
                                ? CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.redAccent
                                : CupitHome.get(context).dartSwitch
                                    ? Colors.blueGrey
                                    : Colors.blue,
                          ),
                          Text('Information',
                              style: TextStyle(
                                  color: a == 0
                                      ? CupitHome.get(context).dartSwitch
                                          ? Colors.white
                                          : Colors.redAccent
                                      : CupitHome.get(context).dartSwitch
                                          ? Colors.blueGrey
                                          : Colors.blue,
                                  fontSize: 14)),
                          const SizedBox(
                            height: 7,
                          )
                        ],
                      ),
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
                        ? const Color(0xff131313)
                        : Colors.white,
                    height: 54,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          a = 1;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.menu_sharp,
                            color: a == 1
                                ? CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.redAccent
                                : CupitHome.get(context).dartSwitch
                                    ? Colors.blueGrey
                                    : Colors.blue,
                          ),
                          Text('Details',
                              style: TextStyle(
                                  color: a == 1
                                      ? CupitHome.get(context).dartSwitch
                                          ? Colors.white
                                          : Colors.redAccent
                                      : CupitHome.get(context).dartSwitch
                                          ? Colors.blueGrey
                                          : Colors.blue,
                                  fontSize: 14)),
                          const SizedBox(
                            height: 7,
                          )
                        ],
                      ),
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
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          a = 2;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.message_outlined,
                            color: a == 2
                                ? CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.redAccent
                                : CupitHome.get(context).dartSwitch
                                    ? Colors.blueGrey
                                    : Colors.blue,
                          ),
                          Text('Commentaire',
                              style: TextStyle(
                                  color: a == 2
                                      ? CupitHome.get(context).dartSwitch
                                          ? Colors.white
                                          : Colors.redAccent
                                      : CupitHome.get(context).dartSwitch
                                          ? Colors.blueGrey
                                          : Colors.blue,
                                  fontSize: 14)),
                          const SizedBox(
                            height: 7,
                          )
                        ],
                      ),
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
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'you want to delete this offer?',
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('yes')),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: const Text('no'))
                                ],
                              );
                            });
                        // FlutterPhoneDirectCaller.callNumber(number);
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.delete,
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.blueGrey
                                : Colors.blue,
                          ),
                          Text('delete',
                              style: TextStyle(
                                  color: CupitHome.get(context).dartSwitch
                                      ? Colors.blueGrey
                                      : Colors.blue,
                                  fontSize: 14)),
                          const SizedBox(
                            height: 7,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: CupitHome.get(context).dartSwitch
                ? Colors.blueGrey
                : const Color(0xffF3F3F3FF),
            height: 1,
            thickness: 2,
          ),
          Expanded(
            flex: 43,
            child: Container(
              child: a == 0
                  ? Information(context)
                  : (a == 1 ? Details(context) : const Text('sousou')),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Ala(String k) => Image(
      image: AssetImage('${k}'),
      fit: BoxFit.cover,
    );

Widget Information(context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Description ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              '  aaaaaaaaaa sssssssssss ddddddd ffffff eeeeeee qqqqqq sdrhfejf wlc lwcw wlehcwfelhf weeee eeeeeeeeeeeeee eeeeeeeeeee eeeeeeeeeeeeee eeeeeeeeeeeeee eeeeeeeeeee eeeeeeeeee e',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );

Widget Details(context) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Card(
          color: CupitHome.get(context).dartSwitch
              ? Colors.blueGrey
              : Colors.lightBlue,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 130,
                        child: Text(
                          'Wilaya ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Constantine',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 130,
                        child: Text(
                          'Superficie ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '140 m2',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 130,
                        child: Text(
                          'Etages ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '4 ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 130,
                        child: Text(
                          'Chambres ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5 chambre(s)',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 130,
                        child: Text(
                          'Type de vente ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5 chambre(s)',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 130,
                        child: Text(
                          'Categorie ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5 chambre(s)',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  height: 28,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                          width: 130,
                          child: Text(
                            'Specification ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: ((context, index) =>
                              listoption(context)),
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 5,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 28,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                          width: 130,
                          child: Text(
                            'paiement ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: ((context, index) =>
                              listoption(context)),
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 5,
                            );
                          },
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
    );

listoption(context) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueAccent,
      ),
      child: Center(
          child: Row(children: [
        SizedBox(
          width: 6,
        ),
        Text(
          '5 chambre',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        SizedBox(
          width: 6,
        )
      ])),
    );
