import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workshop/business_logic/notes/notes_cubit.dart';

import '../../views/constancts/app_color.dart';
import '../../widgets/registeration/default_text_form_field.dart';




class AddNotesScreen extends StatelessWidget {


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
              title: Text('Add Note',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),),

              centerTitle: true,
              elevation: 0,
            ),

            body: Form(
              key: notesCubit.addNoteKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ListView(
                        children: [
                          SizedBox(height:5.h),
                          DefaultTextFormField(
                            maxLines:1,
                            labelText: 'Title',
                            hintText: 'Enter Title',
                            validation: (val)
                            {
                              if (val.isEmpty)
                              {
                                return 'Please Enter Your Title';
                              }

                              else if(val.length>50)
                              {
                                return "Title must be less than 50 characters";
                              }
                            },
                              onChanged: (value) {
                              notesCubit.title = value;
                            },
                            controller: notesCubit.titleController,),
                          SizedBox(height:5.h),
                          DefaultTextFormField(
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
                                notesCubit.description = value;
                              },
                            controller: notesCubit.descriptionController,),
                          SizedBox(height:5.h),


                          ElevatedButton(

                              child:const Text( "Add"),
                              onPressed: () {
                                if (notesCubit.addNoteKey.currentState!.validate())
                                {
                                  notesCubit.insert(context);

                                }
                              }),
                        ],
                      ),
              ),
            ));
      },
    );
  }
}
