import 'package:agence/clienthome/cupitSearch/cupitsearch_cubit.dart';
import 'package:agence/clienthome/cupitSearch/cupitsearch_state.dart';
import 'package:agence/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../home/cubitHome/cupit_home.dart';
import '../home/offers.dart';
import '../offersdetails/offerdetailclient.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitsearchCubit, CupitsearchStates>(
      builder: (BuildContext context, state) {
        var shearchcontroller = TextEditingController();

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: defaultForm(
                    context: context,
                    controller: shearchcontroller,
                    type: TextInputType.text,
                    valid: () {},
                    lable:  Text('Search',style: TextStyle(
                        color: CupitHome.get(context).dartSwitch
                            ? Colors.white
                            : Colors.grey),),
                    prefixIcon:  Icon(Icons.search,color: CupitHome.get(context).dartSwitch
                        ? Colors.white
                        : Colors.grey,)),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ((context, index) =>
                          Listoffers(context)),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 0,
                        );
                      },
                      itemCount: 6))
            ]),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Listoffers(context) => NeumorphicButton(
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage('assets/images/building.jpg'),
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
              "\$245.00",
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
              '730 Columbus Ave, Manhattan, \n Ny 10025',
              style: Theme.of(context).textTheme.bodyText2,
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


}

