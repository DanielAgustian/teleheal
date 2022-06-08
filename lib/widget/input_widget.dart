import 'package:flutter/material.dart';

import '../config/const.dart';

class InputWidget1 extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController fieldController;
  final Function callbackChange;
  final Function callbackValidation;
  final IconData icon;
  final Function callbackIcon;
  final String preText;
  final Color fillColor;
  final bool isProtected;
  final bool isEditable;
  final bool centerText;
  final FocusNode focusNode;
  final TextInputType keyType;
  final bool isRight;
  final String errorText;
  final Widget prefix;
  final Function callbackTap;
  final bool readOnly;
  const InputWidget1(
      {Key key,
      this.hintText,
      this.labelText,
      this.fieldController,
      this.callbackChange,
      this.callbackValidation,
      this.icon,
      this.callbackIcon,
      this.preText,
      this.fillColor,
      this.isProtected = false,
      this.isEditable,
      this.centerText,
      this.focusNode,
      this.keyType,
      this.isRight = true,
      this.errorText,
      this.callbackTap,
      this.prefix,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        readOnly: readOnly,
        onTap: callbackTap,
        enabled: isEditable,
        validator: callbackValidation,
        controller: fieldController,
        keyboardType: keyType,
        obscureText: isProtected,
        onChanged: callbackChange,
        focusNode: focusNode,
        textAlign: centerText == true ? TextAlign.center : TextAlign.start,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: colorWhite,
          errorText: isRight ? errorText : null,
          errorStyle: const TextStyle(fontSize: 11, height: 0.3),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  width: 3,
                  color:
                      isRight ? colorPrimary : colorError)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  width: 3, color: isRight ? colorPrimary.withOpacity(0.25) : colorError)),
          suffixIcon: GestureDetector(
            onTap: callbackIcon,
            child: Icon(
              icon,
              color: colorNeutral,
              size: 18,
            ),
          ),
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: colorNeutral),
        ),
      ),
    );
  }
}
