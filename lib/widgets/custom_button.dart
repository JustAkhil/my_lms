import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isOutline;
  final IconData? icon;
  final bool isLoading;
  final double iconSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
    this.height = 55,
    this.backgroundColor,
    this.textColor,
    this.isOutline = false,
    this.icon,
    this.isLoading = false,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height,
      child: isOutline
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: ButtonStyle(
                animationDuration: Duration.zero,
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: isOutline
                        ? (backgroundColor ?? theme.primaryColor)
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  isOutline
                      ? Colors.transparent
                      : (backgroundColor ?? theme.primaryColor),
                ),
              ),
              child: _buildButtonContext(theme),
            )
          : ElevatedButton(
              style: ButtonStyle(animationDuration: Duration.zero),
              onPressed: isLoading ? null : onPressed,
              child: _buildButtonContext(theme),
            ),
    );
  }

  Widget _buildButtonContext(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            isOutline ? theme.primaryColor : Colors.white,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: isOutline
                ? (backgroundColor ?? theme.primaryColor)
                : (textColor ?? Colors.white),
            size: iconSize,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isOutline
                ? (backgroundColor ?? theme.primaryColor)
                : (textColor ?? Colors.white),
          ),
        ),
      ],
    );
  }
}
