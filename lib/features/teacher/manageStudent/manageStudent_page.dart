import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kana_mobile_app/features/teacher/manageStudent/data/student_stats.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:kana_mobile_app/core/ui/button/app_button.dart';
import './widget/stat_card.dart';
import './data/student_stats.dart';
import './widget/add_student_dialog.dart';

class ManageStudentPage extends StatelessWidget {
  const ManageStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "KANA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(LucideIcons.user, size: 28),
                const SizedBox(width: 8),
                const Text(
                  "Yudhaa",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 4),
                Icon(LucideIcons.chevronDown, size: 20),
              ],
            ),
          ],
        ),
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 1100),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: _Header(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 30,
                  ),
                  child: _UploadStudent(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final stat = manageStudentStats[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: StudentStatCard(stat: stat),
                    );
                  }, childCount: manageStudentStats.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Manage Student",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4),
        Text(
          'Add, remove, and view student progress',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class _UploadStudent extends StatelessWidget {
  const _UploadStudent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          label: "Add Student",
          icon: LucideIcons.plus,
          fullWidth: true,
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const AddStudentDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
