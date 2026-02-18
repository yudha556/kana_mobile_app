import 'package:flutter/material.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({super.key});

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
              "CreateTeacherAccount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Fill in your details to get started",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 24),

            _buildTextField(
              label: "Full Name",
              hint: "Enter Your Full Name",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Email Address",
              hint: "Enter Your Email",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Password",
              hint: "Enter Your Password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Confirm Password",
              hint: "Confirm Your Password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),

            const SizedBox(height: 24),

            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 11, color: Colors.black87),
                children: [
                  TextSpan(text: "By creating an account, you agree to our "),
                  TextSpan(
                    text: "Terms of Service",
                    style: TextStyle(color: Color(0xFF5BC0DE), fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Color(0xFF5BC0DE), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),

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
              child: const Text("Create Account", style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ", style: TextStyle(fontSize: 13)),
                GestureDetector(
                  onTap: () => Navigator.pop(context), // Kembali ke LoginScreen
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Color(0xFF5BC0DE), fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint, required IconData icon, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}