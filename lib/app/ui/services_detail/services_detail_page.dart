import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hakaton/app/resources/res_colors.dart';
import 'package:hakaton/app/resources/ui_icon.dart';
import 'package:hakaton/app/util/text_theme.dart';

enum FeedType {
  problem,
  feet,
  def,
}

class ServicesDetailPage extends StatefulWidget {
  final FeedType type;

  const ServicesDetailPage({Key? key, this.type = FeedType.def})
      : super(key: key);

  @override
  State<ServicesDetailPage> createState() => _ServicesDetailPageState();
}

class _ServicesDetailPageState extends State<ServicesDetailPage> {
  List<File> files = [];

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
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Color(0xFF1C355A),
                    ),
                    child: Text(
                      'отправить',
                      style: ResTextTheme.caption,
                    ),
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
