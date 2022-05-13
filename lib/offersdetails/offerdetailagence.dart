import 'dart:convert';

import 'package:agence/Model/AfficheOffer.dart';
import 'package:agence/offersdetails/CubitOfferDetailState.dart';
import 'package:agence/offersdetails/cubitOfferDetail.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../home/cubitHome/cupit_home.dart';
import '../home/home.dart';
import '../shared/components/components.dart';

class Offerdetailagence extends StatelessWidget {
  final int position;
  Offerdetailagence({required this.position}) : super();

  var onbordingController = PageController();

  List<String> models = [
    'assets/images/on2.png',
    'assets/images/building.jpg',
    'assets/images/design.png'
  ];

  // int a = 0;
  // String number='07666666';
  // void initState() {
  //   super.initState();
  //   number='06666554';
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitDetail, DetailStates>(
      builder: (BuildContext context, state) {
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
                        itemBuilder: (context, index) => Ala(
                            CupitHome.get(context)
                                .dataOfferModel!
                                .data!
                                .offers[position]),
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
                // child: Ala(CupitHome.get(context)
                //     .dataOfferModel!
                //     .data!
                //     .offers[position]),
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
                flex: 7,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 54,
                        child: MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            // setState(() {   -------- hadi lawla
                            //   a = 0;
                            // });
                            CubitDetail.get(context).declarA(0);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.description_outlined,
                                color: CubitDetail.get(context).a == 0
                                    ? CupitHome.get(context).dartSwitch
                                        ? Colors.white
                                        : Colors.redAccent
                                    : CupitHome.get(context).dartSwitch
                                        ? Colors.blueGrey
                                        : Colors.blue,
                              ),
                              Text('Information',
                                  style: TextStyle(
                                      color: CubitDetail.get(context).a == 0
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
                            // setState(() {      -- hadi tnya
                            //   a = 1;
                            // });
                            CubitDetail.get(context).declarA(1);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.menu_sharp,
                                color: CubitDetail.get(context).a == 1
                                    ? CupitHome.get(context).dartSwitch
                                        ? Colors.white
                                        : Colors.redAccent
                                    : CupitHome.get(context).dartSwitch
                                        ? Colors.blueGrey
                                        : Colors.blue,
                              ),
                              Text('Details',
                                  style: TextStyle(
                                      color: CubitDetail.get(context).a == 1
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
                            // setState(() { -------hadi 3
                            //   a = 2;
                            // });
                            CubitDetail.get(context).declarA(2);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.message_outlined,
                                color: CubitDetail.get(context).a == 2
                                    ? CupitHome.get(context).dartSwitch
                                        ? Colors.white
                                        : Colors.redAccent
                                    : CupitHome.get(context).dartSwitch
                                        ? Colors.blueGrey
                                        : Colors.blue,
                              ),
                              Text('Commentaire',
                                  style: TextStyle(
                                      color: CubitDetail.get(context).a == 2
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
                                            // setState(() { ----- hadi mt7tajch setstate
                                            Navigator.of(context).pop();
                                            // });
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
                  child: CubitDetail.get(context).a == 0
                      ? Information(
                          context,
                          CupitHome.get(context)
                              .dataOfferModel!
                              .data!
                              .offers[position])
                      : (CubitDetail.get(context).a == 1
                          ? Details(
                              context,
                              CupitHome.get(context)
                                  .dataOfferModel!
                                  .data!
                                  .offers[position])
                          : const Text('sousou')),
                ),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

Widget Ala(OffersModel model) => Image(
      image: MemoryImage(base64Decode(model.photo![0])),
      fit: BoxFit.cover,
    );

Widget Ala2(OffersModel model) {
  var carouselController = CarouselController();
  // return Image(
  //   image: AssetImage('${k}'),
  //   fit: BoxFit.cover,
  // );
  return Column(
    children: [
      Expanded(
        child: CarouselSlider(
            carouselController: carouselController,
            items: model.photo
                ?.map((e) => Image(
                      image: MemoryImage(base64Decode(e)),
                      width: 400,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1.0,
            )),
      ),
      // AnimatedSmoothIndicator(activeIndex: activeIndex, count: count)
    ],
  );
}

Widget Information(context, OffersModel model) => Padding(
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
            Text(
              '${model.description} ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );

Widget Details(context, OffersModel model) => Padding(
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
                      '${model.wilaya}',
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
                      '${model.space} m2',
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
                      '${model.nEtage} ',
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
                      '${model.nChambre} chambre(s)',
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
                      '${model.typeVente}',
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
                      '${model.typeOffer}',
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
