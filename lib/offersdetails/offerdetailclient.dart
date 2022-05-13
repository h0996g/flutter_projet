import 'package:agence/clienthome/navbar.dart';
import 'package:agence/offersdetails/CubitOfferDetailState.dart';
import 'package:agence/offersdetails/cubitOfferDetail.dart';

import 'package:agence/shared/components/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home/cubitHome/cupit_home.dart';

class Offerdetailclient extends StatelessWidget {
  Offerdetailclient({Key? key}) : super(key: key);

  var onbordingController = PageController();

  var alaController = TextEditingController();

  List<String> models = [
    'assets/images/on2.png',
    'assets/images/building.jpg',
    'assets/images/design.png'
  ];

  int a = 0;
  String number = '07666666';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitDetail, DetailStates>(
      builder: (BuildContext context, Object? state) {
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
                        onPageChanged: (int index) {},
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
                          Changepage(context, const Navbar());
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
                        top: 46,
                        right: -5,
                        child: MaterialButton(
                          onPressed: () {},
                          shape: const CircleBorder(),
                          color: CupitHome.get(context).dartSwitch
                              ? const Color(0xff8d8d8d)
                              : Colors.blue,
                          child: Icon(
                            Icons.favorite_sharp,
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.white,
                          ),
                        )),
                    Positioned(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SmoothPageIndicator(
                              controller: onbordingController, // PageController
                              count: models.length,
                              effect: ScrollingDotsEffect(
                                dotColor: CupitHome.get(context).dartSwitch
                                    ? const Color(0xffb3b2b2)
                                    : Colors.white,
                                activeDotColor:
                                    CupitHome.get(context).dartSwitch
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
                        Icons.place,
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.white,
                      ),
                    ),
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
                            CubitDetail.get(context).changeNavDetailClient(0);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.description_outlined,
                                color: CubitDetail.get(context).indexClient == 0
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
                                                  .indexClient ==
                                              0
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
                    Expanded(
                      child: Container(
                        color: CupitHome.get(context).dartSwitch
                            ? const Color(0xff131313)
                            : Colors.white,
                        height: 54,
                        child: MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            // setState(() {
                            //   a = 1;
                            // });
                            CubitDetail.get(context).changeNavDetailClient(1);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.menu_sharp,
                                color: CubitDetail.get(context).indexClient == 1
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
                                                  .indexClient ==
                                              1
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
                    Expanded(
                      child: Container(
                        height: 54,
                        child: MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            // setState(() {
                            //   a = 2;
                            // });
                            CubitDetail.get(context).changeNavDetailClient(2);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.message_outlined,
                                color: CubitDetail.get(context).indexClient == 2
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
                                                  .indexClient ==
                                              2
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
                    Expanded(
                      child: Container(
                        height: 54,
                        child: MaterialButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () async {
                            FlutterPhoneDirectCaller.callNumber(number);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.call,
                                color: CupitHome.get(context).dartSwitch
                                    ? Colors.blueGrey
                                    : Colors.blue,
                              ),
                              Text('Call',
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
                  child: CubitDetail.get(context).indexClient == 0
                      ? Information(context)
                      : (CubitDetail.get(context).indexClient == 1
                          ? Details(context)
                          : Commentaire(context)),
                ),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }

  Widget Commentaire(context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) => Listemessage(context)),
              itemCount: 5,
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
                    onPressed: () {}, icon: const Icon(Icons.send_sharp)),
                textInputAction: TextInputAction.done,
                controller: alaController,
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

Widget Listemessage(context) => Container(
      color: Colors.blueAccent,
      height: 80,
    );

Widget Ala(String k) => Image(
      image: AssetImage('${k}'),
      fit: BoxFit.cover,
    );

Widget Information(context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Text(
              'Description ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
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
        physics: const BouncingScrollPhysics(),
        child: Card(
          color: CupitHome.get(context).dartSwitch
              ? Colors.blueGrey
              : Colors.lightBlue,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.lightBlue),
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
                    Container(
                        width: 130,
                        child: const Text(
                          'Wilaya ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Constantine',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                    Container(
                        width: 130,
                        child: const Text(
                          'Superficie ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '140 m2',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                    Container(
                        width: 130,
                        child: const Text(
                          'Etages ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '4 ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                    Container(
                        width: 130,
                        child: const Text(
                          'Chambres ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '5 chambre(s)',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
                    Container(
                        width: 130,
                        child: const Text(
                          'Type de vente ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '5 chambre(s)',
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
                    Container(
                        width: 130,
                        child: const Text(
                          'Categorie ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '5 chambre(s)',
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
                Container(
                  height: 28,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                          width: 130,
                          child: const Text(
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
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 28,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                          width: 130,
                          child: const Text(
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
        color: CupitHome.get(context).dartSwitch
            ? Colors.blueGrey
            : Colors.blueAccent,
      ),
      child: Center(
          child: Row(children: const [
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
