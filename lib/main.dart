import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/display_notes_cubit/display_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constants.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),

        ), BlocProvider(
          create: (context) => DisplayNotesCubit(),

        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          EditNoteView.id: (context) => const EditNoteView(),
          NotesView.id: (context) => const NotesView(),
        },
        initialRoute: NotesView.id,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const NotesView(),
      ),
    );
  }
}
