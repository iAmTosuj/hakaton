import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakaton/app/bloc/services_cubit.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/util/text_theme.dart';
import 'package:hakaton/main.dart';

enum FeedType {
  problem,
  feet,
  def,
}

class SendFeedbackPage extends StatefulWidget {
  final FeedType type;
  final String name;

  const SendFeedbackPage(
      {Key? key, this.type = FeedType.def, required this.name})
      : super(key: key);

  @override
  State<SendFeedbackPage> createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  List<File> files = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1C355A),
            Color(0xFF0F1E34),
          ],
          tileMode: TileMode.decal,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              UiIcon.close_not_a_circle,
              color: ResColors.bgGray0,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Тема: ${_getCurrentTitle()}',
                    style: ResTextTheme.subtitle1
                        .merge(const TextStyle(color: ResColors.bgGray0))),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Комментарий:',
                  style: ResTextTheme.body1
                      .merge(const TextStyle(color: ResColors.bgGray0)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  style: TextStyle(color: ResColors.bgGray0),
                  maxLines: 7,
                  minLines: 5,
                  controller: controller,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Color(0xFF1C355A),
                    hintText: _getCurrentHint(),
                    contentPadding: EdgeInsets.all(8),
                    hintStyle: ResTextTheme.body1
                        .merge(const TextStyle(color: ResColors.bgGray0)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: ResColors.bgGray0,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.type == FeedType.problem
                      ? 'Фото проблемы:'
                      : 'Фото (не обязательно)',
                  style: ResTextTheme.body1
                      .merge(const TextStyle(color: ResColors.bgGray0)),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  children: [
                    ...files
                        .map((e) => Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFFFFFFF)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              alignment: Alignment.center,
                              child: Image.file(
                                e,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                    GestureDetector(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(allowMultiple: true);

                        if (result != null) {
                          setState(() {
                            files = result.paths
                                .map((path) => File(path!))
                                .toList();
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '+',
                          style: ResTextTheme.headline1.copyWith(
                              color: ResColors.bgGray0,
                              fontWeight: FontWeight.w400,
                              fontSize: 45),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<ServicesCubit, ServicesState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () async {
                          await BlocProvider.of<ServicesCubit>(context)
                              .sendServices(
                            name: widget.name,
                            description: controller.text,
                          );

                          Navigator.pop(context);

                          await PushNotification.plugin.show(
                              12345,
                              "Заявка успешно отправлена",
                              "С вами свяжутся в ближайшее время",
                              PushNotification.platformChannelSpecifics,
                              payload: 'data');

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Заявка успешно отправлена'),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Color(0xFF1C355A),
                        ),
                        child: !state.isLoading
                            ? Text(
                                'отправить',
                                style: ResTextTheme.caption,
                              )
                            : SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCurrentTitle() {
    switch (widget.type) {
      case FeedType.problem:
        return 'Решить проблему';
      case FeedType.feet:
        return 'Обратная связь';
      case FeedType.def:
        return '';
    }
  }

  String _getCurrentHint() {
    switch (widget.type) {
      case FeedType.problem:
        return 'Описание проблемы';
      case FeedType.feet:
        return 'Ваш комментарий';
      case FeedType.def:
        return '';
    }
  }
}
