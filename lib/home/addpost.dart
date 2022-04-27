import 'package:agence/home/addphoto/addphoto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../shared/components/components.dart';
import 'cubitHome/cupit_home.dart';
import 'cubitHome/homeStates.dart';

class AddPost extends StatelessWidget {
  var superficieController = TextEditingController();
  var etageController = TextEditingController();
  var descriptionController = TextEditingController();
  var nChambres = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CupitHome, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 15,
              title: Text('Add Offer',
                  style:
                      //  TextStyle(
                      //     color: CupitHome.get(context).dartSwitch
                      //         ? Colors.white
                      //         : Colors.black,
                      //     fontSize: 34),
                      Theme.of(context).textTheme.headline4),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                'Vente',
                                style: TextStyle(
                                    color: CupitHome.get(context).dartSwitch
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                              items: CupitHome.get(context)
                                  .vende
                                  .map(buildMenuItem)
                                  .toList(),
                              onChanged: (value) {
                                CupitHome.get(context).vendeDropDown(value);
                              },
                              value: CupitHome.get(context).vendevalueDrop,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                'Appartement',
                                style: TextStyle(
                                    color: CupitHome.get(context).dartSwitch
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                              items: CupitHome.get(context)
                                  .appartement
                                  .map(buildMenuItem)
                                  .toList(),
                              onChanged: (value) {
                                CupitHome.get(context)
                                    .appartementDropDown(value);
                              },
                              value:
                                  CupitHome.get(context).appartementvalueDrop,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      defaultForm(
                          context: context,
                          type: TextInputType.text,
                          lable: Text(
                            'Superficie',
                            style: TextStyle(
                                color: CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          valid: () {},
                          controller: superficieController,
                          sufixText: 'm2'),
                      const SizedBox(
                        height: 26,
                      ),
                      Visibility(
                        visible: CupitHome.get(context).isvisibility['etages']!,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 26),
                          child: defaultForm(
                            context: context,
                            type: TextInputType.text,
                            lable: Text(
                              'Etage(s)',
                              style: TextStyle(
                                  color: CupitHome.get(context).dartSwitch
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                            valid: () {},
                            controller: etageController,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 26,
                      // ),
                      Visibility(
                        visible:
                            CupitHome.get(context).isvisibility['N-champre']!,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 26),
                          child: defaultForm(
                            context: context,
                            type: TextInputType.text,
                            lable: Text(
                              '\u2116chambres',
                              style: TextStyle(
                                  color: CupitHome.get(context).dartSwitch
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                            valid: () {},
                            controller: nChambres,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 26,
                      // ),
                      MultiSelectDialogField(
                        dialogHeight: 150,
                        items: CupitHome.get(context).paymentVar,
                        // title: Text("Conditions de paiment"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        buttonText: Text(
                          "Conditions de paiment",
                          style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        onConfirm: (results) {
                          print(results);
                        },
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      MultiSelectDialogField(
                        dialogHeight: 150,
                        items: CupitHome.get(context).speceficationVar,
                        // title: Text("Conditions de paiment"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),
                        buttonText: Text(
                          "Specification",
                          style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        onConfirm: (results) {
                          print(results);
                        },
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      MultiSelectDialogField(
                        dialogHeight: 150,
                        items: CupitHome.get(context).papiersVar,
                        // title: Text("Conditions de paiment"),
                        selectedColor: Colors.blue,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),
                        buttonText: Text(
                          "Papiers",
                          style: TextStyle(
                            color: CupitHome.get(context).dartSwitch
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        onConfirm: (results) {
                          print(results);
                        },
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              style: TextStyle(
                                  color: CupitHome.get(context).dartSwitch
                                      ? Colors.white
                                      : Colors.black),
                              dropdownColor: CupitHome.get(context).dartSwitch
                                  ? Colors.black
                                  : Colors.white,
                              isExpanded: true,
                              hint: Text(
                                'Wilaya',
                                style: TextStyle(
                                    color: CupitHome.get(context).dartSwitch
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                              items: CupitHome.get(context)
                                  .items
                                  .map(buildMenuItem)
                                  .toList(),
                              onChanged: (value) {
                                CupitHome.get(context).wilaraDropdown(value);
                              },
                              value: CupitHome.get(context).valueDropdown,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.text_snippet_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultForm(
                        context: context,
                        type: TextInputType.text,
                        valid: () {},
                        controller: descriptionController,
                        maxline: 6,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      defaultForm(
                          context: context,
                          type: TextInputType.emailAddress,
                          lable: Text(
                            'E-Adresse',
                            style: TextStyle(
                                color: CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          valid: () {},
                          controller: superficieController,
                          sufixText: '@'),
                      const SizedBox(
                        height: 26,
                      ),

                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Addphoto()));
                            },
                            icon: Icon(Icons.arrow_forward_ios,
                                color: CupitHome.get(context).dartSwitch
                                    ? Colors.white
                                    : Colors.grey),
                          )
                        ],
                      )
                    ],
                  )),
                ),
              ),
            ));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        onTap: () {},
        child: Text(
          item,
        ),
        value: item,
      );
}
