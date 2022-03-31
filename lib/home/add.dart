import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
    return BlocConsumer<CupitHome, ShopeHomeStates>(
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
                  physics: BouncingScrollPhysics(),
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      defaultForm(
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
                      const SizedBox(
                        height: 26,
                      ),
                      defaultForm(
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
                              hint: const Text(
                                'Wilaya',
                              ),
                              items: CupitHome.get(context)
                                  .items
                                  .map(buildMenuItem)
                                  .toList(),
                              onChanged: (value) {
                                CupitHome.get(context)
                                    .changevalueDropdown(value);
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
                            'Adresse',
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
                      IntlPhoneField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'DZ',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios))
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
        child: Text(
          item,
        ),
        value: item,
      );
}
