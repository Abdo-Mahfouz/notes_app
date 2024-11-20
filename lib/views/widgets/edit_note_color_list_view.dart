import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'color_item_list_view.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex ;
  @override
  void initState() {
    currentIndex= kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    widget.note.color = kColors[index].value; // Set the color here
                  });
                },
                child: ColorItem(
                  isActive: currentIndex == index,
                  color: kColors[index],
                ),
              ),
            );
          }),
    );
  }
}