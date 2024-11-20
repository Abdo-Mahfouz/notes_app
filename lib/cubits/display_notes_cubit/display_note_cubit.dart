import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'display_note_state.dart';

class DisplayNotesCubit extends Cubit<DisplayNotesState> {
  List<NoteModel>? notes;

  DisplayNotesCubit() : super(DisplayNotesInitial()) {
    fetchAllNotes();
  }

  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(DisplayNotesSuccess());
  }
}