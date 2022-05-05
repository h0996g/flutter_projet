import 'package:agence/clienthome/cupitSearch/cupitsearch_cubit.dart';
import 'package:agence/clienthome/cupitSearch/cupitsearch_state.dart';
import 'package:agence/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/offers.dart';

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
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              defaultForm(
                  context: context,
                  controller: shearchcontroller,
                  type: TextInputType.text,
                  valid: () {},
                  lable: const Text('Search'),
                  prefixIcon: const Icon(Icons.search)),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: ((context, index) =>
                          ListItembuilder(context)),
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
}
