import 'package:flutter/material.dart';

import '../../../tdesign_flutter.dart';

class TDWrapSideBarItem extends StatelessWidget {
  const TDWrapSideBarItem({
    Key? key,
    this.badge,
    required this.disabled,
    this.icon,
    this.label = '',
    this.contentPadding,
    this.textStyle = const TextStyle(
      fontSize: 16,
      height: 1.5,
    ),
    this.selectedTextStyle,
    this.value = -1,
    this.selected = false,
    this.selectedColor,
    this.topAdjacent = false,
    this.bottomAdjacent = false,
    this.onTap,
    required this.style,
  }) : super(key: key);

  final TDBadge? badge;
  final bool disabled;
  final IconData? icon;
  final String label;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final int value;
  final bool selected;
  final Color? selectedColor;
  final bool topAdjacent;
  final bool bottomAdjacent;
  final VoidCallback? onTap;
  final TDSideBarStyle style;

  static const preLineWidth = 3.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: style == TDSideBarStyle.normal
          ? renderNormalItem(context)
          : renderOutlineItem(context),
    );
  }

  Widget renderNormalItem(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: selected
                ? Colors.white
                : const Color.fromRGBO(243, 243, 243, 1),
            borderRadius: bottomAdjacent || topAdjacent
                ? bottomAdjacent
                    ? const BorderRadius.only(bottomRight: Radius.circular(9))
                    : const BorderRadius.only(topRight: Radius.circular(9))
                : null),
        child: Row(
          children: [
            renderPreLine(context),
            Expanded(
                child: Padding(
                    padding: contentPadding ?? const EdgeInsets.all(16),
                    child: renderMainContent(context)))
          ],
        ),
      ),
    );
  }

  Widget renderOutlineItem(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: selected && !disabled
                    ? Theme.of(context).colorScheme.onSecondary
                    : null,
                borderRadius: BorderRadius.circular(6)),
            padding: const EdgeInsets.all(8),
            child: renderMainContent(context),
          ),
        ));
  }

  Widget renderMainContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderIcon(context),
        if (label.isNotEmpty) Expanded(child: renderLabel(context)),
        if (label.length > 4) renderBadge(context),
        // SizedBox(
        //   width: !disabled && selected ? 0 : preLineWidth,
        // )
      ],
    );
  }

  Widget renderPreLine(BuildContext context) {
    return Visibility(
      visible: !disabled && selected,
      replacement: const SizedBox(
        width: preLineWidth,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: preLineWidth,
            height: 14,
            decoration: BoxDecoration(
                color: selectedTextStyle != null
                    ? selectedTextStyle?.color
                    : (selectedColor ?? TDTheme.of(context).brandNormalColor),
                borderRadius: BorderRadius.circular(4)),
          )
        ],
      ),
    );
  }

  Widget renderIcon(BuildContext context) {
    return Visibility(
        visible: icon != null,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            icon,
            size: 20,
            color: disabled
                ? TDTheme.of(context).fontGyColor4
                : selected
                    ? selectedTextStyle != null
                        ? selectedTextStyle?.color
                        : (selectedColor ??
                            TDTheme.of(context).brandNormalColor)
                    : Theme.of(context).colorScheme.onSurface,
          ),
        ));
  }

  Widget renderLabel(BuildContext context) {
    return TDText.rich(
      TextSpan(
        children: [
          WidgetSpan(
              child: TDText(
            label,
            style: selected
                ? (selectedTextStyle ?? TextStyle(color: selectedColor))
                : textStyle,
            fontWeight:
                selected && !disabled ? FontWeight.w600 : FontWeight.w400,
            textColor: disabled
                ? TDTheme.of(context).fontGyColor4
                : selected
                    ? selectedColor ?? TDTheme.of(context).brandNormalColor
                    : Colors.black,
            // forceVerticalCenter: true,
          )),
          if (label.length < 4)
            WidgetSpan(
                child: SizedBox(
              width: 1,
              height: 16,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  badge != null
                      ? Positioned(top: -6, child: badge!)
                      : Container()
                ],
              ),
            ))
        ],
      ),
      softWrap: true,
      style: selectedTextStyle,
    );
  }

  Widget renderBadge(BuildContext context) {
    return SizedBox(
      width: 1,
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          badge != null ? Positioned(top: -6, child: badge!) : Container()
        ],
      ),
    );
  }
}