import 'package:flutter/material.dart';

class CustomCheckbox extends FormField<bool> {
  CustomCheckbox({
    Widget title,
    FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool> validator,
    bool initialValue = false,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<bool> state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  // dense: state.hasError,
                  // title: title,
                  value: state.value,
                  onChanged: state.didChange,
                  // subtitle: state.hasError
                  //     ? Builder(
                  //         builder: (BuildContext context) => Text(
                  //           state.errorText,
                  //           style:
                  //               TextStyle(color: Theme.of(context).errorColor),
                  //         ),
                  //       )
                  //     : null,
                  // controlAffinity: ListTileControlAffinity.leading,
                ),
                title,
                state.hasError
                    ? Builder(
                        builder: (BuildContext context) => Text(
                          state.errorText,
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      )
                    : Text(""),
              ],
            );
          },
        );
}

// thanks to https://stackoverflow.com/a/57897318/6262571
