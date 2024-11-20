import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<DisplayNotesCubit>(context).notes ??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount:notes.length,
              itemBuilder: (context, index) {
                return NoteItem(note:notes[index]);
              }),
        );
      },
    );
  }
}
