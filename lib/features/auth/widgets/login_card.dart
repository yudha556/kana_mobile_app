import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'animated_bg.dart';
import 'register_screen.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool isStudent = true;
  bool isCameraOpen = false;
  
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    if (isStudent) {
      _setupCamera();
    }
  }

  Future<void> _setupCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      _initializeControllerFuture = _cameraController!.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint("Gagal mematikan kamera: $e");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

void _toggleTab(bool value) {
  if (isStudent == value) return;
  setState(() {
    isStudent = value;
    isCameraOpen = false; 
  });
  _cameraController?.dispose();
  _cameraController = null;
}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Let'sGetStarted!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Choose your login type",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),

            Container(
              height: 55,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabItem(false, "Teacher"),
                  _buildTabItem(true, "Student"),
                ],
              ),
            ),

            const SizedBox(height: 32),

            if (isStudent) ...[
              _buildFaceRecognitionView(),
            ] else ...[
              _buildTeacherFormView(),
            ],

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5BC0DE),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(isStudent ? "Login Student" : "Login Teacher"),
            ),

            if (!isStudent) ...[
              const SizedBox(height: 16),
              _buildCreateAccountRow(),
            ] else ...[
              const SizedBox(height: 12),
              _buildUploadButton(),
            ],
          ],
        ),
      ),
    );
  }

Widget _buildFaceRecognitionView() {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          if (!isCameraOpen) {
            setState(() {
              isCameraOpen = true;
            });
            _setupCamera(); 
          }
        },
        child: Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF5BC0DE), width: 3),
            color: Colors.grey[50],
          ),
          child: ClipOval(
            child: isCameraOpen 
              ? FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done && _cameraController != null) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: CameraPreview(_cameraController!),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                    }
                  },
                )
              : const Icon(
                  Icons.camera_alt_outlined, 
                  size: 50, 
                  color: Colors.black26
                ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        isCameraOpen ? "Camera Active" : "Face Recognition Login", 
        style: const TextStyle(fontWeight: FontWeight.bold)
      ),
      Text(
        isCameraOpen 
            ? "Position your face within the circle." 
            : "Click the circle to start camera recognition.",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    ],
  );
}

  Widget _buildTeacherFormView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: "Teacher Email",
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        const Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(bool value, String title) {
    bool selected = isStudent == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => _toggleTab(value),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: selected ? [const BoxShadow(color: Colors.black12, blurRadius: 4)] : [],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? const Color(0xFF5BC0DE) : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.upload_outlined),
      label: const Text("Upload Photo"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blueGrey,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: Colors.blueGrey),
      ),
    );
  }

Widget _buildCreateAccountRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have an account? "),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Stack(
                  children: [
                    AnimatedBackground(),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: SingleChildScrollView(child: RegisterCard()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Text(
          "Create new account",
          style: TextStyle(color: Color(0xFF5BC0DE), fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
}