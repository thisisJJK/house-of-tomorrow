import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      onSubmitted: widget.onSubmitted,
      style: context.typo.headline5,
      cursorColor: context.color.primary,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: context.color.hintContainer,
          hintText: widget.hint,
          hintStyle: context.typo.headline5.copyWith(
            fontWeight: context.typo.light,
            color: context.color.onHintContainer,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          suffixIcon: controller.text.isEmpty
              ? null
              : Button(
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      widget.onClear?.call();
                    });
                  },
                  icon: 'close',
                  type: ButtonType.flat,
                )),
    );
  }
}
