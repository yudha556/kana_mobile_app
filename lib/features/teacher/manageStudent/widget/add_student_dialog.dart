import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:kana_mobile_app/core/ui/button/app_button.dart';

class AddStudentDialog extends StatefulWidget {
  const AddStudentDialog({super.key});

  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  final TextEditingController _nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _mobileImage;
  Uint8List? _webImageBytes;

  bool _loading = false;

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        setState(() {
          _webImageBytes = result.files.single.bytes;
        });
      }
    } else {
      final picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (picked != null) {
        setState(() {
          _mobileImage = File(picked.path);
        });
      }
    }
  }

  void _submit() async {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student name cannot be empty")),
      );
      return;
    }

    setState(() => _loading = true);

    await Future.delayed(const Duration(seconds: 1));
    // TODO: Replace with real API call

    setState(() => _loading = false);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  ImageProvider? _buildImageProvider() {
    if (kIsWeb) {
      if (_webImageBytes != null) {
        return MemoryImage(_webImageBytes!);
      }
    } else {
      if (_mobileImage != null) {
        return FileImage(_mobileImage!);
      }
    }
    return null;
  }

  bool _hasImage() {
    if (kIsWeb) {
      return _webImageBytes != null;
    } else {
      return _mobileImage != null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Student",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter the students information to add them",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: _buildImageProvider(),
                        child: !_hasImage()
                            ? const Icon(
                                LucideIcons.camera,
                                size: 32,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                      const SizedBox(height: 8),
                      const Text("Upload student Photo"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Student Name",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter Student name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    label: "Cancel",
                    variant: AppButtonVariant.secondary,
                    onPressed:
                        _loading ? null : () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  AppButton(
                    label: "Add Student",
                    loading: _loading,
                    onPressed: _loading ? null : _submit,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}