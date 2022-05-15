import 'dart:convert';

import 'package:agence/Model/AfficheOffer.dart';
import 'package:agence/clienthome/search.dart';
import 'package:agence/offersdetails/offerdetailclient.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../home/cubitHome/cupit_home.dart';
import '../home/cubitHome/homeStates.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../home/offers.dart';
import '../shimmer_widget.dart';

class Offersclient extends StatelessWidget {
  Offersclient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: ShimmerWidget.rectangular(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 16,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: ShimmerWidget.rectangular(
              width: double.infinity,
              height: 16,
            )),
      ],
    );
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Navbar()));
            },
            child: Icon(
              Icons.place,
              color: CupitHome.get(context).dartSwitch
                  ? Colors.white
                  : Colors.white,
            ),
          ),
          appBar: AppBar(
            elevation: 10,
            title: Text(
              'Offers',
              style: TextStyle(
                  color: CupitHome.get(context).dartSwitch
                      ? Colors.white
                      : Colors.black,
                  fontSize: 34),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    CupitHome.get(context).changeSwitch(
                        value: !CupitHome.get(context).dartSwitch);
                  },
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Search()));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
          body: ConditionalBuilder(
            builder: (BuildContext context) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 16, bottom: 5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ToggleSwitch(
                            onToggle: (index) {
                              print(CupitHome.get(context).type_vente[index!]);
                            },
                            labels: CupitHome.get(context).type_vente,
                            radiusStyle: true,
                            customWidths: [
                              MediaQuery.of(context).size.width / 5,
                              MediaQuery.of(context).size.width / 3.8 + 20,
                              MediaQuery.of(context).size.width / 5,
                              MediaQuery.of(context).size.width / 5,
                            ],
                            minHeight: 50,
                            minWidth: double.infinity,
                            cornerRadius: 50,
                            fontSize: 16,
                            activeBgColor: [
                              CupitHome.get(context).dartSwitch
                                  ? Colors.blueGrey
                                  : Colors.blue,
                              CupitHome.get(context).dartSwitch
                                  ? Colors.blueGrey
                                  : Colors.blue,
                              CupitHome.get(context).dartSwitch
                                  ? Colors.blueGrey
                                  : Colors.blue,
                              CupitHome.get(context).dartSwitch
                                  ? Colors.blueGrey
                                  : Colors.blue,
                            ],
                            inactiveBgColor: CupitHome.get(context).dartSwitch
                                ? const Color(0xff131313)
                                : Colors.white,
                            activeFgColor: Colors.white,
                            inactiveFgColor: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.blue,
                            borderColor: [
                              CupitHome.get(context).dartSwitch
                                  ? const Color(0xff131313)
                                  : Colors.blue,
                            ],
                            borderWidth: 3,
                            dividerColor: CupitHome.get(context).dartSwitch
                                ? const Color(0xff131313)
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) => ListItembuilder(
                              context,
                              CupitHome.get(context)
                                  .allofferModel!
                                  .data!
                                  .offers[index])),
                          itemCount: CupitHome.get(context)
                              .allofferModel!
                              .data!
                              .offers
                              .length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        ),
                      ),
                    ],
                  ));
            },
            condition: CupitHome.get(context).allofferModel != null,
            fallback: (BuildContext context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildFoodShimmer(context),
                  itemCount: 6,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  ListItembuilder(context, OffersModel model) {
    final imageProvider = MemoryImage(base64Decode(model.photo![0]));

    return NeumorphicButton(
      style: NeumorphicStyle(
          color:
              CupitHome.get(context).dartSwitch ? Colors.black : Colors.white,
          depth: 0),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Offerdetailclient()));
      },
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            // color:  CupitHome.get(context).dartSwitch
            //     ? Colors.blueGrey
            //     : Colors.white,
            gradient: CupitHome.get(context).dartSwitch
                ? const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff131313),
                      Color(0xff131313),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                        Colors.blue,
                        const Color(0xffCFD9E2FF),
                      ]),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                "${model.price} \$",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 32,
                    ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                '${model.address}',
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ])
          ]),
          height: 120,
          width: double.infinity,
        )
      ]),
    );
  }
}
