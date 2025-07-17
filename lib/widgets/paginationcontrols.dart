import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/activitycontroller.dart';

class PaginationControls extends StatelessWidget {
  final ActivityController controller;

  const PaginationControls({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      final isFirstPage = controller.page.value <= 1;
      final isLastPage = controller.logs.length < controller.limit;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous Button
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isFirstPage ? 0.0 : 1.0,
                    child: ElevatedButton.icon(
                      onPressed: isFirstPage ? null : controller.previousPage,
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      label: const Text("Previous"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),

                  // Page Number
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: Text(
                      "${controller.page.value}",
                      key: ValueKey<int>(controller.page.value),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Next Button
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isLastPage ? 0.0 : 1.0,
                    child: ElevatedButton.icon(
                      onPressed: isLastPage ? null : controller.nextPage,
                      icon: const Icon(Icons.arrow_forward_ios, size: 16),
                      label: const Text("Next"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
