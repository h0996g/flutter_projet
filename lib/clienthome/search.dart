import 'package:agence/Api/httplaravel.dart';
import 'package:agence/clienthome/cupitSearch/cupitsearch_cubit.dart';
import 'package:agence/clienthome/cupitSearch/cupitsearch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../Api/constApi.dart';
import '../Model/AfficheOffer.dart';
import '../home/cubitHome/cupit_home.dart';
import 'dart:convert' as convert;

import '../offersdetails/offerdetailclient.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitsearchCubit, CupitsearchStates>(
      builder: (BuildContext context, state) {
        var shearchcontroller = TextEditingController();

        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            // getOfferAgence('a');
          }),
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 16, bottom: 5),
                child: ToggleSwitch(
                  changeOnTap: false,
                  initialLabelIndex:
                      CupitsearchCubit.get(context).toggelindexshearch,
                  onToggle: (index) {
                    CupitsearchCubit.get(context)
                        .changeToggelIndexSearch(index);
                  },
                  labels: CupitsearchCubit.get(context).type_search,
                  radiusStyle: true,
                  customWidths: [
                    MediaQuery.of(context).size.width / 2 - 20,
                    MediaQuery.of(context).size.width / 2 - 20,
                  ],
                  minHeight: 45,
                  minWidth: double.infinity,
                  cornerRadius: 50,
                  fontSize: 18,
                  activeBgColor: [
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
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:
                      //  defaultForm(
                      //     context: context,
                      //     controller: shearchcontroller,
                      //     type: TextInputType.text,
                      //     valid: () {},
                      //     lable: Text(
                      //       'Search',
                      //       style: TextStyle(
                      //           color: CupitHome.get(context).dartSwitch
                      //               ? Colors.white
                      //               : Colors.grey),
                      //     ),
                      //     prefixIcon: Icon(
                      //       Icons.search,
                      //       color: CupitHome.get(context).dartSwitch
                      //           ? Colors.white
                      //           : Colors.grey,
                      //     )),
                      TypeAheadFormField(
                    itemBuilder: (BuildContext context, OffersModel? model) {
                      final offer = model!;
                      return
                          //  ListTile(
                          //   title: Text(offer.address!),

                          // );
                          NeumorphicButton(
                        style: NeumorphicStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.black
                                : Colors.white,
                            depth: 0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Offerdetailclient()));
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/building.jpg'),
                                  fit: BoxFit.cover),
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
                              borderRadius: const BorderRadius.vertical(
                                  bottom: const Radius.circular(20)),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "${model.price}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(fontSize: 16),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ])
                                ]),
                            height: 100,
                            width: double.infinity,
                          )
                        ]),
                      );
                    },
                    suggestionsCallback: getOfferAgence,
                    onSuggestionSelected: (OffersModel? k) {},
                  )),
              const SizedBox(
                height: 10,
              ),
              // Expanded(
              //     child: ListView.separated(
              //         physics: const BouncingScrollPhysics(),
              //         itemBuilder: ((context, index) => Listoffers(context,)),
              //         separatorBuilder: (BuildContext context, int index) {
              //           return const SizedBox(
              //             height: 0,
              //           );
              //         },
              //         itemCount: 6))
            ]),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  // Listoffers(context, OffersModel model) =>
  // NeumorphicButton(
  //       style: NeumorphicStyle(
  //           color:
  //               CupitHome.get(context).dartSwitch ? Colors.black : Colors.white,
  //           depth: 0),
  //       onPressed: () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => Offerdetailclient()));
  //       },
  //       child: Column(mainAxisSize: MainAxisSize.min, children: [
  //         Container(
  //           height: 150,
  //           width: double.infinity,
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //             image: DecorationImage(
  //                 image: AssetImage('assets/images/building.jpg'),
  //                 fit: BoxFit.cover),
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             // color:  CupitHome.get(context).dartSwitch
  //             //     ? Colors.blueGrey
  //             //     : Colors.white,
  //             gradient: CupitHome.get(context).dartSwitch
  //                 ? const LinearGradient(
  //                     begin: Alignment.topRight,
  //                     end: Alignment.bottomLeft,
  //                     colors: [
  //                       Color(0xff131313),
  //                       Color(0xff131313),
  //                     ],
  //                   )
  //                 : const LinearGradient(
  //                     begin: Alignment.topRight,
  //                     end: Alignment.bottomLeft,
  //                     colors: [
  //                         Colors.blue,
  //                         const Color(0xffCFD9E2FF),
  //                       ]),
  //             borderRadius: const BorderRadius.vertical(
  //                 bottom: const Radius.circular(20)),
  //           ),
  //           child:
  //               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Row(children: [
  //               const SizedBox(
  //                 width: 8,
  //               ),
  //               Text(
  //                 "${model.price}",
  //                 style: Theme.of(context).textTheme.headline4?.copyWith(
  //                       fontSize: 32,
  //                     ),
  //               )
  //             ]),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Row(children: [
  //               const SizedBox(
  //                 width: 8,
  //               ),
  //               Text(
  //                 '${model.address}',
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .bodyText2
  //                     ?.copyWith(fontSize: 16),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               )
  //             ])
  //           ]),
  //           height: 100,
  //           width: double.infinity,
  //         )
  //       ]),
  //     );

}

DataOffer? offerAgencModel;
var offers;
Future<List<OffersModel>> getOfferAgence(String query) async {
  List<OffersModel> kk;

  // offerAgencModel = null;
  kk = await Httplar.httpget(path: GETOFFERSAGENCE).then((value) {
    var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;

    offerAgencModel = DataOffer.fromJson(jsonResponse);
    print('ook');
    offers = offerAgencModel!.data!.offers;
    print(offerAgencModel!.data!.offers.runtimeType);
    return offers.where((offer) {
      final String wilaya = offer.wilaya.toLowerCase();
      final lowerQuery = query.toLowerCase();
      return wilaya.contains(lowerQuery);
    }).toList();
    // print(offerAgencModel!.data!.offers[0].address);
    // print(offerAgencModel!.data!.offers[0].latitude);
    // print(offerAgencModel!.data!.offers[0].longitude);
  });
  return kk;
}

var offersclient;
DataOffer? allofferModel;
Future<List<OffersModel>> getOfferAgencetoclient(String query) async {
  List<OffersModel> kk;

  // offerAgencModel = null;
  kk = await Httplar.httpget(path: GETOFFERCATEGORIES + '/Tout').then((value) {
    var jsonResponse = convert.jsonDecode(value.body) as Map<String, dynamic>;

    allofferModel = DataOffer.fromJson(jsonResponse);
    print('ook');
    offers = allofferModel!.data!.offers;
    print(allofferModel!.data!.offers.runtimeType);
    return offers.where((offer) {
      final String wilaya = offer.wilaya.toLowerCase();
      final lowerQuery = query.toLowerCase();
      return wilaya.contains(lowerQuery);
    }).toList();
    // print(offerAgencModel!.data!.offers[0].address);
    // print(offerAgencModel!.data!.offers[0].latitude);
    // print(offerAgencModel!.data!.offers[0].longitude);
  });
  return kk;
}
