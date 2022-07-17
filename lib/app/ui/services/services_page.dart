import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/ui/services/services_card.dart';
import 'package:hakaton/app/util/text_theme.dart';

class ServicesPage extends StatefulWidget {
  ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final controller = TextEditingController();

  var newServicesList = servicesList;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        newServicesList = servicesList
            .where((element) =>
                element.name
                    .toUpperCase()
                    .contains(controller.text.toUpperCase()) ||
                controller.text.isEmpty)
            .toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: ResColors.bgGray0),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: const Color(0xFF1C355A),
                      hintText: 'Услуги',
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintStyle: ResTextTheme.body1
                          .merge(const TextStyle(color: ResColors.textInfo)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: ResColors.textInfo,
                          width: 1,
                        ),
                      ),
                      prefixIcon: const Icon(
                        UiIcon.search,
                        color: ResColors.iconSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: newServicesList
                      .mapIndexed(
                        (i, e) => ServicesCard(
                          controller: controller,
                          gradient: gradients[i % (gradients.length)],
                          title: e.name,
                          subtitle: e.description,
                          icon: Icon(
                            iconsServices[e.id % (iconsServices.length)],
                            size: 40,
                            color: ResColors.bgGray60,
                          ),
                          isPrimary: e.isHot,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
