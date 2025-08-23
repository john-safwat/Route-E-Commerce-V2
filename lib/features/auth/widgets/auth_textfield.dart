import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final String title;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const AuthTextField({
    Key? key,
    required this.hintText,
    required this.title,
    this.validator,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.white,fontSize: 18),),
        const SizedBox(height: 24,),
        TextFormField(
          controller: controller,
          validator:validator ,

          obscureText: obscureText,
          decoration: InputDecoration(

            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[700]!, width: 2),
            ),
          ),
          style: const TextStyle(color: Colors.black87),

        ),
      ],
    );
  }
}