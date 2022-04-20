import 'package:agence/offersdetails/offerdetailclient.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../home/cubitHome/cupit_home.dart';
import '../home/cubitHome/homeStates.dart';

class Offersclient extends StatelessWidget {
  Offersclient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  : Colors.blue,
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) => ListItembuilder(context)),
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 0,
                  );
                },
              )),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  ListItembuilder(context) => NeumorphicButton(
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
