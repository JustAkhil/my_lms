import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isObscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int maxLine;
  final bool enabled;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLine = 1,
    this.enabled = true,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscureText;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isObscureText,

      validator: widget.validator,
      onChanged: widget.onChanged,
      maxLines: widget.isObscureText ? 1 : widget.maxLine,
      enabled: widget.enabled,
      focusNode: widget.focusNode,

      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,

        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon)
            : null,

        suffixIcon: widget.isObscureText
            ? IconButton(
          onPressed: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },
          icon: Icon(
            _isObscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        )
            : widget.suffixIcon != null
            ? Icon(widget.suffixIcon)
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}