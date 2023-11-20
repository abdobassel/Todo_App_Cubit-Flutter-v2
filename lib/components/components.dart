import 'package:flutter/material.dart';
import 'package:todo_app_v2/bloc_cubit/cubit.dart';

Widget ItemTaskBuilder(
  context, {
  required String txt,
  required String date,
  required String time,
  required int id,
  required String status,
}) =>
    Dismissible(
      key: Key('$id'),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDb(id: id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5.5, top: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white.withOpacity(.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xffDFB6B2),
                child: Text(
                  '$time',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$txt',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '$date',
                      style: TextStyle(color: Colors.grey[300], fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle),
                color: Color(0xffD5EBCB),
                iconSize: 30,
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.archive),
                color: Colors.white,
                iconSize: 30,
              )
            ],
          ),
        ),
      ),
    );

//Form Field Text
Widget DefaultTextForm({
  required TextEditingController controller,
  required String? labeltext,
  required String? Function(String?)? validate,
  String? Function(String?)? onSubmit,
  String? Function(String?)? onchange, //null-safety
  required TextInputType type,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffixIcon,
  Function()? showPassfunc,
  Function()? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      onChanged: onchange,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      validator: validate,
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: labeltext,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        prefix: Icon(
          prefix,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: showPassfunc, icon: Icon(suffixIcon))
            : null,
      ),
    );
