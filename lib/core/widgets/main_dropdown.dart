import 'package:astrology/core/zodiac_sign_model.dart';
import 'package:flutter/material.dart';
import '../helpers/app_logger.dart';
import '../app_colors.dart';

class MainDropDown<T> extends StatelessWidget {
  final List<T> items;
  final Function onSelect;
  final String hint;
  final String defaultValue;
  final bool isSelected;
  final bool isLoading;

  const MainDropDown({
    Key? key,
    required this.hint,
    required this.items,
    required this.onSelect,
    required this.defaultValue,
    this.isSelected = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        border: Border.all(color: AppColors.white),
      ),
      child: DropdownButton<T>(
        borderRadius: BorderRadius.circular(8),
        underline: const SizedBox(),
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
        items: items.map((value) {
          var obj;
          var lbl;

          if (T == String) {
            obj = value as String;
            lbl = obj;
          }
          if (T == ZodiacSign) {
            obj = value as ZodiacSign;
            lbl = obj.name;
          }
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              lbl,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          );
        }).toList(),
        elevation: 4,
        onChanged: isLoading
            ? null
            : (val) {
                onSelect(val);
                Log.debug("selected value : $defaultValue || Hint : $hint");
              },
        hint: Text(
          hint,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: defaultValue == hint
                ? Colors.black.withOpacity(0.5)
                : AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
