
import 'package:flutter/material.dart';
import 'package:spend/features/common/color_constant.dart';


class AppTextFeild extends StatelessWidget {
  const AppTextFeild(
      {super.key,
        this.hintText,
        this.controller,
        this.validator,
        this.prefixIcon,
        this.maxLength,
        this.minLines=1,
        this.textInputType = TextInputType.text,
        this.onChanged});
  final String? hintText;
  final int? maxLength;
  final int? minLines;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final ValueChanged? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLength,
      minLines: minLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Colors.black38),
        prefixIcon: prefixIcon,
        isDense: true,
        filled: true,
        fillColor: lightGrey,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade100,
          ),),
        focusedBorder :OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: lightGrey,
          ),),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: lightGrey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            )),
      ),
      // keyboardType: TextInputType.,
    );
  }
}





class AppPasswordFeild extends StatefulWidget {
   AppPasswordFeild(
      {super.key,
        this.hintText,
        this.controller,
        this.validator,
        this.obscureText = true,
        this.isPasswordobscure = false,
        this.textInputType = TextInputType.text,
        this.onChanged});
  final TextInputType textInputType;
  final String? hintText;
  bool obscureText;
  bool isPasswordobscure;
  final ValueChanged? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;



  @override
  State<AppPasswordFeild> createState() => _AppPasswordFeildState();
}

class _AppPasswordFeildState extends State<AppPasswordFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText:widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Colors.black38),
        isDense: true,
        filled: true,
        fillColor: lightGrey,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.red)),
        enabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: lightGrey,
          ),),
        focusedBorder :const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: lightGrey,
          ),),
        border:const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: lightGrey,
            ),
            borderRadius:  BorderRadius.all(
              Radius.circular(5.0),
            )),

      suffixIcon:   IconButton(
            onPressed: () {
              setState(() {
                !widget.obscureText
                    ? widget.obscureText = true
                    : widget.obscureText = false;
              });
            },
            icon: widget.isPasswordobscure
                ? Container(
              width: 2,
            )
                : widget.obscureText
                ? const Text("SHOW",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Colors.black38))
                : const Text("HIDE",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Colors.black38),)),
      ),
      // keyboardType: TextInputType.,
    );
  }
}

