import 'dart:convert';
import 'package:agence/Model/AfficheOffer.dart';
import 'package:agence/clienthome/navbar.dart';
import 'package:agence/home/cubitHome/cupit_home.dart';
import 'package:agence/offersdetails/cubitOfferDetail.dart';
import 'package:agence/offersdetails/offerdetailagence.dart';
import 'package:agence/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../clienthome/search.dart';

import '../shimmer_widget.dart';
import 'cubitHome/homeStates.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);
  // Map<String, dynamic> getallmsg = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  Navbar()));
              Changepage(context, const Navbar());
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
            title: Text('Offers', style: Theme.of(context).textTheme.headline4),
            actions: [
              IconButton(
                  onPressed: () {
                    // String k = '\\"' + 'ggg' + '\\"';
                    // print(k);
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
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return CupitHome.get(context).getOfferAgence();
                    },
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: ((context, index) {
                        int position = index;

                        return ListItembuilder(
                            position,
                            context,
                            CupitHome.get(context)
                                .offerAgencModel!
                                .data!
                                .offers[index]);
                      }),
                      itemCount: CupitHome.get(context)
                          .offerAgencModel!
                          .data!
                          .offers
                          .length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ));
            },
            condition: CupitHome.get(context).offerAgencModel != null &&
                state is! ConditionalLodinOfferAgenceState,
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

        // return ConditionalBuilder(
        //   builder: (BuildContext context) {
        //     return

        //   },
        //   condition: CupitHome.get(context).dataOfferModel != null,
        //   fallback: (BuildContext context) {
        //     return const Center(child: CircularProgressIndicator());
        //   },
        // );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

ListItembuilder(int position, context, OffersModel model) {
  // Uint8List bytes = base64Decode();
  // Image img = Image.memory(base64Decode(model.photo![0]));
  final imageProvider = MemoryImage(base64Decode(model.photo![0]));

  return NeumorphicButton(
    style: NeumorphicStyle(
        color: CupitHome.get(context).dartSwitch ? Colors.black : Colors.white,
        depth: 0),
    onPressed: () {
      print(position);
      Map<String, dynamic> getallmsg = {'offer_id': '3'};
      CubitDetail.get(context).getAllMsg(data: getallmsg);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Offerdetailagence(
                    position: position,
                  )));
    },
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                      Color(0xffCFD9E2FF),
                    ]),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

buildFoodShimmer(context) => Column(
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
