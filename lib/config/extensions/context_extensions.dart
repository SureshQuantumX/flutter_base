import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/error/app_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

extension BuildContextExtensions on BuildContext {
  Future<T?> showCustomError<T>(AppError error, {String? title}) =>
      showFlash<T>(
        duration: const Duration(seconds: 3),
        builder: (context, controller) => _CustomFlashBar(
          controller: controller,
          error: error,
          isError: true,
          title: title,
        ),
        context: this,
      );

  Future<T?> showCustomSuccess<T>(String message, {String? title}) =>
      showFlash<T>(
        duration: const Duration(seconds: 3),
        builder: (context, controller) => _CustomFlashBar(
          controller: controller,
          isError: false,
          title: title,
          message: message,
        ),
        context: this,
      );
}

class _CustomFlashBar extends StatelessWidget {
  final bool isError;
  final AppError? error;
  final FlashController controller;
  final String? title;
  final String? message;

  const _CustomFlashBar({
    required this.controller,
    this.isError = true,
    this.error,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlashBar(
        position: FlashPosition.top,
        controller: controller,
        shouldIconPulse: false,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.all(16),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        builder: (context, child) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isError ? Colors.red : Colors.green,
              width: 0.2,
            ),
          ),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    isError ? Icons.error : Icons.check_circle,
                    color: isError ? Colors.red : Colors.green,
                  ),
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? (isError ? 'Error' : 'Success'),
                      // style: AppTextStyles.bodyMediumRegular.copyWith(
                      //   color: context.appColors.black800,
                      // ),
                    ),
                    Text(
                      message ?? error?.message ?? '',
                      // style: AppTextStyles.bodySmallRegular.copyWith(
                      //   color: context.appColors.black600,
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        content: const SizedBox.shrink(),
      ),
    );
  }
}
