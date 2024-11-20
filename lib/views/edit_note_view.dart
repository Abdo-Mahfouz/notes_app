import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_color_list_view.dart';

import '../cubits/display_notes_cubit/display_note_cubit.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key});
  static String id = 'EditNotes';

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              actionFunction: () {
                args.title = title ?? args.title;
                args.content = content ?? args.content;
                BlocProvider.of<DisplayNotesCubit>(context).fetchAllNotes();
                args.save();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              hintText: args.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              onChanged: (value) {
                content = value;
              },
              hintText: args.content,
              maxLines: 7,
            ),
            const SizedBox(
              height: 24,
            ),
            EditNoteColorsListView(note:args),
          ],
        ),
      ),
    );
  }
}
