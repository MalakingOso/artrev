import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:artrev/core/constants/app_colors.dart';

class CustomTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  
  const CustomTitleBar({
    super.key,
    required this.title,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        windowManager.startDragging();
      },
      child: Container(
        height: 48,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Menu button or app icon
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: onMenuPressed,
            ),
            
            // App title - this area also acts as a drag handle
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            
            // Window controls
            Row(
              children: [
                // Minimize
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.white),
                  onPressed: () {
                    windowManager.minimize();
                  },
                ),
                // Maximize/Restore
                IconButton(
                  icon: const Icon(Icons.crop_square, color: Colors.white),
                  onPressed: () async {
                    if (await windowManager.isMaximized()) {
                      windowManager.restore();
                    } else {
                      windowManager.maximize();
                    }
                  },
                ),
                // Close
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    windowManager.close();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}