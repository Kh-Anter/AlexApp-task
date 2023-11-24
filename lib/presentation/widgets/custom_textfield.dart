import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? type;
  final int? maxLength;
  final Widget? prefex;
  final String? hintText;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.type,
      this.maxLength,
      this.prefex,
      this.inputFormatters,
      this.hintText,
      this.isPassword = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;

  bool isEdditing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 20, right: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            if (widget.isPassword)
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.lock_outline, color: Colors.grey),
              ),
            Expanded(
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  inputFormatters: widget.inputFormatters,
                  maxLength: widget.maxLength,
                  controller: widget.controller,
                  keyboardType: widget.type,
                  obscureText:
                      widget.isPassword ? (isHidden ? true : false) : false,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    counterText: "",
                    labelText: widget.labelText,
                    labelStyle:
                        const TextStyle(color: Colors.black45, fontSize: 16),
                    border: InputBorder.none,
                  ),
                  onTap: () => setState(() {
                    isEdditing = true;
                  }),
                ),
              ),
            ),
            if (widget.isPassword)
              InkWell(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: Icon(isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined))
          ],
        ));
  }
}
