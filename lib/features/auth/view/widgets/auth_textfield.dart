import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final String title;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool isPassword;

  @override
  void initState() {
    super.initState();
    isPassword = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
            ),
            errorStyle: const TextStyle(color: Colors.red),
            suffixIcon:
                widget.obscureText
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon:
                          isPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                    )
                    : null,
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
