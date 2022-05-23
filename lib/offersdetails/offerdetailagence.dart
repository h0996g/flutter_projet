import 'dart:convert';

import 'package:agence/Model/AfficheOffer.dart';
import 'package:agence/offersdetails/CubitOfferDetailState.dart';
import 'package:agence/offersdetails/cubitOfferDetail.dart';
import 'package:agence/offersdetails/formulairemodifieroffre.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
  var msgController = TextEditingController();
  Map<String, dynamic> sendinfomsg = {};

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 35,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  // height: 295,
                  height: double.infinity,

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
                    itemBuilder: (context, index) {
                      // return Ala(CupitHome.get(context)
                      //     .dataOfferModel!
                      //     .data!
                      //     .offers[position]);

                      List? k;
                      k = CupitHome.get(context)
                          .offerAgencModel!
                          .data!
                          .offers[position]
                          .photo
                          ?.map((e) {
                        return base64Decode(e);
                      }).toList();
                      return Image(
                        image: MemoryImage(k![index]),
                        width: 400,
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: CupitHome.get(context)
                        .offerAgencModel!
                        .data!
                        .offers[position]
                        .photo!
                        .length,
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
                Positioned(
                  top: 45,
                  right: -5,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.black
                        : Colors.blue,
                    child: Icon(
                      Icons.place,
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  // bottom: 20,
                  // left: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SmoothPageIndicator(
                          controller: onbordingController, // PageController
                          count: CupitHome.get(context)
                              .offerAgencModel!
                              .data!
                              .offers[position]
                              .photo!
                              .length,
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
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                  "${CupitHome.get(context).offerAgencModel!.data!.offers[position].price}",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 32,
                      ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Formulairemodifier(
                                  position: position,
                                )));
                  },
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
                    '${CupitHome.get(context).offerAgencModel!.data!.offers[position].address}',
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       'Se Loger',
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     )),
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
            flex: 51,
            child: BlocConsumer<CubitDetail, DetailStates>(
              builder: (BuildContext context, state) {
                return Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 54,
                              child: MaterialButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  // setState(() {   -------- hadi lawla
                                  //   a = 0;
                                  // });
                                  CubitDetail.get(context)
                                      .changeNavDetailAgence(0);
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Icon(
                                      Icons.description_outlined,
                                      color: CubitDetail.get(context)
                                                  .indexAgence ==
                                              0
                                          ? CupitHome.get(context).dartSwitch
                                              ? Colors.white
                                              : Colors.redAccent
                                          : CupitHome.get(context).dartSwitch
                                              ? Colors.blueGrey
                                              : Colors.blue,
                                    ),
                                    Text('Information',
                                        style: TextStyle(
                                            color: CubitDetail.get(context)
                                                        .indexAgence ==
                                                    0
                                                ? CupitHome.get(context)
                                                        .dartSwitch
                                                    ? Colors.white
                                                    : Colors.redAccent
                                                : CupitHome.get(context)
                                                        .dartSwitch
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
                                  CubitDetail.get(context)
                                      .changeNavDetailAgence(1);
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Icon(
                                      Icons.menu_sharp,
                                      color: CubitDetail.get(context)
                                                  .indexAgence ==
                                              1
                                          ? CupitHome.get(context).dartSwitch
                                              ? Colors.white
                                              : Colors.redAccent
                                          : CupitHome.get(context).dartSwitch
                                              ? Colors.blueGrey
                                              : Colors.blue,
                                    ),
                                    Text('Details',
                                        style: TextStyle(
                                            color: CubitDetail.get(context)
                                                        .indexAgence ==
                                                    1
                                                ? CupitHome.get(context)
                                                        .dartSwitch
                                                    ? Colors.white
                                                    : Colors.redAccent
                                                : CupitHome.get(context)
                                                        .dartSwitch
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
                            child: SizedBox(
                              height: 54,
                              child: MaterialButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  print(
                                      '${CupitHome.get(context).offerAgencModel!.data!.offers[position].id}');
                                  // setState(() { -------hadi 3
                                  //   a = 2;
                                  // });
                                  CubitDetail.get(context)
                                      .changeNavDetailAgence(2);
                                  CubitDetail.get(context).getAllMsg(data: {
                                    'offer_id':
                                        '${CupitHome.get(context).offerAgencModel!.data!.offers[position].id}'
                                  });
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Icon(
                                      Icons.message_outlined,
                                      color: CubitDetail.get(context)
                                                  .indexAgence ==
                                              2
                                          ? CupitHome.get(context).dartSwitch
                                              ? Colors.white
                                              : Colors.redAccent
                                          : CupitHome.get(context).dartSwitch
                                              ? Colors.blueGrey
                                              : Colors.blue,
                                    ),
                                    Text('Commentaire',
                                        style: TextStyle(
                                            color: CubitDetail.get(context)
                                                        .indexAgence ==
                                                    2
                                                ? CupitHome.get(context)
                                                        .dartSwitch
                                                    ? Colors.white
                                                    : Colors.redAccent
                                                : CupitHome.get(context)
                                                        .dartSwitch
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
                            child: SizedBox(
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                                            color: CupitHome.get(context)
                                                    .dartSwitch
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
                        child: CubitDetail.get(context).indexAgence == 0
                            ? Information(
                                context,
                                CupitHome.get(context)
                                    .offerAgencModel!
                                    .data!
                                    .offers[position])
                            : (CubitDetail.get(context).indexAgence == 1
                                ? Details(
                                    context,
                                    CupitHome.get(context)
                                        .offerAgencModel!
                                        .data!
                                        .offers[position],
                                    position)
                                : ConditionalBuilder(
                                    builder: (BuildContext context) {
                                      return Commentaire(context);
                                    },
                                    condition: state is! LodinGetAllMsgState &&
                                        CubitDetail.get(context).allmsgmodel !=
                                            null,
                                    fallback: (BuildContext context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )),
                      ),
                    ),
                  ],
                );
              },
              listener: (BuildContext context, Object? state) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget Commentaire(context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                // var ind = index;
                return Listemessage(
                    context, CubitDetail.get(context).allmsgmodel[index]);
              }),
              itemCount: CubitDetail.get(context).allmsgmodel.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 1,
                );
              },
            )),
            const SizedBox(height: 8),
            Container(
              height: 58,
              child: defaultForm(
                lable: Text(
                  'write a message',
                  style: TextStyle(
                      color: CupitHome.get(context).dartSwitch
                          ? Colors.white
                          : Colors.grey),
                ),
                sufixIcon: IconButton(
                    onPressed: () {
                      sendinfomsg = {
                        'text': msgController.text,
                        'offer_id':
                            ' ${CupitHome.get(context).offerAgencModel!.data!.offers[position].id}'
                      };

                      CubitDetail.get(context)
                          .sendMessage(data: sendinfomsg)
                          .then((value) {
                        CubitDetail.get(context).getAllMsg(data: {
                          'offer_id':
                              '${CupitHome.get(context).offerAgencModel!.data!.offers[position].id}'
                        });
                      });
                      msgController = TextEditingController();
                    },
                    icon: const Icon(Icons.send_sharp)),
                textInputAction: TextInputAction.done,
                controller: msgController,
                context: context,
                type: TextInputType.text,
                valid: (value) {
                  if (value.isEmpty) {
                    return 'you can not add an umpty message';
                  }
                },
              ),
            )
          ],
        ),
      );
}

Widget Listemessage(context, msg) => Container(
      decoration: BoxDecoration(
          color: CupitHome.get(context).dartSwitch
              ? const Color(0xff131313)
              : Colors.lightBlue,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage:
                      AssetImage('assets/images/profile_avatar.jpg'),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(msg['name'],
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 7,
                ),
                Text('${msg['created_at']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    )),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                    child: Text(
                  msg['text'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
                // Spacer(),
                const SizedBox(
                  width: 7,
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  color: CupitHome.get(context).dartSwitch
                      ? const Color(0xff8d8d8d)
                      : Colors.blue,
                  child: Icon(
                    Icons.delete,
                    color: CupitHome.get(context).dartSwitch
                        ? Colors.white
                        : Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 0,
                ),
              ],
            )
          ],
        ),
      ),
    );

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
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );

Widget Details(context, OffersModel model, position) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Card(
          color: CupitHome.get(context).dartSwitch
              ? const Color(0xff131313)
              : Colors.lightBlue,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 2,
                color: CupitHome.get(context).dartSwitch
                    ? const Color(0xff131313)
                    : Colors.lightBlue),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                        width: 130,
                        child: Text(
                          'Wilaya ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.wilaya}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                        width: 130,
                        child: Text(
                          'Superficie ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.space} m2',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                        width: 130,
                        child: Text(
                          'Etages ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.nEtage} ',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                        width: 130,
                        child: Text(
                          'Chambres ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.nChambre} chambre(s)',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                        width: 130,
                        child: Text(
                          'Type de vente ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.typeVente}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                        width: 130,
                        child: Text(
                          'Categorie ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.typeOffer}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 1,
                ),
                SizedBox(
                  height: 28,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                          width: 130,
                          child: Text(
                            'Specification ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: listSpecefication(
                            context,
                            CupitHome.get(context)
                                .offerAgencModel!
                                .data!
                                .offers[position]),
                        // child: ListView.separated(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: 3,
                        //   itemBuilder: ((context, index) =>
                        //       listoption(context)),
                        //   physics: const BouncingScrollPhysics(),
                        //   separatorBuilder: (BuildContext context, int index) {
                        //     return const SizedBox(
                        //       width: 5,
                        //     );
                        //   },
                        // ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 28,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                          width: 130,
                          child: Text(
                            'paiement ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: listPaiment(
                            context,
                            CupitHome.get(context)
                                .offerAgencModel!
                                .data!
                                .offers[position]),
                        // child: ListView.separated(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: 3,
                        //   itemBuilder: ((context, index) =>
                        //       listoption(context)),
                        //   physics: const BouncingScrollPhysics(),
                        //   separatorBuilder: (BuildContext context, int index) {
                        //     return const SizedBox(
                        //       width: 5,
                        //     );
                        //   },
                        // ),
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

// listoption(context) => Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.blueAccent,
//       ),
//       child: Center(
//           child: Row(children: const [
//         SizedBox(
//           width: 6,
//         ),
//         Text(
//           '5 chambre',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//         SizedBox(
//           width: 6,
//         )
//       ])),
//     );

listSpecefication(context, OffersModel model) => ListView(
      scrollDirection: Axis.horizontal,
      children: model.specification!
          .map((e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueAccent,
                ),
                child: Center(
                    child: Row(children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '$e',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 6,
                  )
                ])),
              ))
          .toList(),
    );
listPaiment(context, OffersModel model) => ListView(
      scrollDirection: Axis.horizontal,
      children: model.conditionDePaiment!
          .map((e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueAccent,
                ),
                child: Center(
                    child: Row(children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '$e',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 6,
                  )
                ])),
              ))
          .toList(),
    );
