import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop/business_logic/notes/notes_cubit.dart';

import '../../../constants/app_colors.dart';
import '../../views/constancts/app_color.dart';
import '../../widgets/core/default_text.dart';
import '../../widgets/registeration/default_text_form_field.dart';



//This Screen use for edit a note
class EditNotesScreen extends StatelessWidget {

  String title;
  int id;
  String description;
  EditNotesScreen({
    required this.description,
    required this.id,
    required this.title,
  });




  TextEditingController editTitle = TextEditingController();
  TextEditingController editDescription = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(

      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              ),
              title: Text('Edit Note',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),

              centerTitle: true,
              elevation: 0,
            ),

            body: Form(
              key: notesCubit.editNoteKey,
              child: Column(
                children: [

                  //Title
                  SizedBox(height: 5.h),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: DefaultTextFormField(
                      controller: editTitle..text = title,

                        maxLines:1,
                        labelText: 'Title',
                        hintText: 'Enter Title',
                        validation: (val)
                        {
                          if (val.isEmpty)
                          {
                            return 'Please Enter Your Title';
                          }

                          else if(val.length > 50)
                          {
                            return "Title must be less than 50 characters";
                          }
                        },
                        onChanged: (value)
                        {
                          editTitle.text = value;
                        }),
                  ),

                  //Description
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: DefaultTextFormField(
                      controller: editDescription..text = description,
                        maxLines: 5,
                        labelText: 'Description',
                        hintText: 'Enter Description',
                        validation: (val) {
                          if (val.isEmpty)
                          {
                            return 'Please Enter Your Description';
                          }

                        },

                        onChanged: (value) {
                          editDescription.text = value;
                          print("description: $value");
                        },),
                  ),

                  //Button Edit
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(

                        child:DefaultText(text:  "Edit"),
                        onPressed: () {

                          if (notesCubit.editNoteKey.currentState!.validate())
                          {
                            notesCubit.update(
                              context,
                              id,

                              editTitle.text == ""
                                   ? title
                                   : editTitle.text,

                              editDescription.text == ""
                                    ? description
                                    : editDescription.text,
                              DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now()),);


                          }
                        }),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
