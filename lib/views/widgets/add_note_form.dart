
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/views/widgets/color_item_list_view.dart';
import 'custom_text_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // First TextField (original size)
            CustomTextFormField(
              onSaved: (value) {
                title = value;
              },
              labelText: "Title",
              maxLines: 1,
            ),
            const SizedBox(height: 16), // Spacing between the fields
            // Second TextField (height: 200)
            CustomTextFormField(
              onSaved: (value) {
                content = value;
              },
              labelText: "content",
              maxLines: 6,
            ),
            const SizedBox(
              height: 32,
            ),
  const ColorItemListView(),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
  builder: (context, state) {
    return CustomTextButton(
      isLoading: state is AddNoteLoading ?true:false,
              text: 'Add',
              function: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  DateTime now = DateTime.now();

                  // Format the date as d/month name/y
                  String date = DateFormat('d-MMMM-y').format(now);
                  NoteModel noteModel = NoteModel(title: title!, content: content!, date: date, color: Colors.cyan.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                }else{
                  autovalidateMode=AutovalidateMode.always;
                }
              },
            );
  },
),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}