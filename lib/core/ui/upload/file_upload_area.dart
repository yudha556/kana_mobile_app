import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_colors.dart';
import 'upload_types.dart';

class FileUploadArea extends StatefulWidget {
  final UploadType type;
  final void Function(html.File file)? onFileSelected;

  const FileUploadArea({
    super.key,
    required this.type,
    this.onFileSelected,
  });

  @override
  State<FileUploadArea> createState() => _FileUploadAreaState();
}

class _FileUploadAreaState extends State<FileUploadArea> {
  bool hovering = false;
  String? fileName;
  String? error;

  void pickFile() {
    final input = html.FileUploadInputElement();
    input.accept =
        widget.type.allowedExtensions.map((e) => '.$e').join(',');

    input.click();

    input.onChange.listen((event) {
      final files = input.files;
      if (files == null || files.isEmpty) return;

      final file = files.first;

      final sizeMB = file.size / (1024 * 1024);
      final ext = file.name.split('.').last.toLowerCase();

      if (!widget.type.allowedExtensions.contains(ext)) {
        setState(() => error = "Invalid file type");
        return;
      }

      if (sizeMB > widget.type.maxSizeMB) {
        setState(() => error = "File too large (max ${widget.type.maxSizeMB}MB)");
        return;
      }

      if (!mounted) return;

      setState(() {
        fileName = file.name;
        error = null;
      });

      widget.onFileSelected?.call(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderColor =
        error != null ? Colors.red : (hovering ? AppColors.primary : AppColors.border);

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: pickFile,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: hovering ? AppColors.secondaryHover : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor, width: 1.4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.upload,
                size: 42,
                color: hovering ? AppColors.primary : Colors.grey,
              ),

              const SizedBox(height: 14),

              Text(
                "Upload ${widget.type.label}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 6),

              const Text(
                "Drag and drop or click to browse",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Text(
                  "Choose File",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                error ??
                    (fileName == null
                        ? ".${widget.type.allowedExtensions.join(", .")} only, max ${widget.type.maxSizeMB}MB"
                        : "Selected: $fileName"),
                style: TextStyle(
                  fontSize: 12,
                  color: error != null ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
