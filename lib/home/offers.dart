import 'dart:convert';
import 'package:agence/Model/AfficheOffer.dart';
import 'package:agence/clienthome/navbar.dart';
import 'package:agence/home/cubitHome/cupit_home.dart';
import 'package:agence/offersdetails/offerdetailagence.dart';
import 'package:agence/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../clienthome/search.dart';
import 'cubitHome/homeStates.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

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
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) => ListItembuilder(
                        context,
                        CupitHome.get(context)
                            .dataOfferModel!
                            .data!
                            .offers[index])),
                    itemCount: CupitHome.get(context)
                        .dataOfferModel!
                        .data!
                        .offers
                        .length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ));
            },
            condition: CupitHome.get(context).dataOfferModel != null,
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
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

ListItembuilder(context, OffersModel model) {
  // Uint8List bytes = base64Decode();
  // Image img = Image.memory(base64Decode(model.photo![0]));
   final imageProvider = MemoryImage(base64Decode(model.photo![0]));

  return NeumorphicButton(
    style: NeumorphicStyle(
        color: CupitHome.get(context).dartSwitch ? Colors.black : Colors.white,
        depth: 0),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Offerdetailagence()));
    },
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        height: 200,

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
            height: 3,
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
        height: 90,
        width: double.infinity,
      )
    ]),
  );
}
