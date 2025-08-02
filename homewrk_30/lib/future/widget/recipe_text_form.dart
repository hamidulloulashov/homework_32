import 'package:flutter/material.dart';
import 'package:homewrk_30/theme/app_theme.dart';

class RecipiTextForm extends StatefulWidget {
  final String hint;
  final String text;
  final bool isPassword;
  final TextEditingController? controller;

  const RecipiTextForm({
    super.key,
    required this.hint,
    required this.text,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<RecipiTextForm> createState() => _RecipiTextFormState();
}

class _RecipiTextFormState extends State<RecipiTextForm> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        SizedBox(
          width: 357,
          height: 41,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscure : false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.container,
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    )
                  : null,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '${widget.text}ni kiriting';
              }
              if (widget.isPassword && value.length < 6) {
                return 'Parol kamida 6 ta belgidan iborat bolishi kerak';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
