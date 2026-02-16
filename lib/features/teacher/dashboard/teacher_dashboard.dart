import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'data/dashboard_stats.dart';
import 'widgets/stat_card.dart';
import 'package:kana_mobile_app/core/ui/button/app_button.dart';
import 'package:kana_mobile_app/core/ui/card/app_card.dart';
import 'package:kana_mobile_app/core/ui/upload/file_upload_area.dart';
import 'package:kana_mobile_app/core/ui/upload/upload_types.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

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
                SvgPicture.asset(
                  'assets/images/logo1.svg',
                  height: 30,
                ),
                const SizedBox(width: 8),
                const Text(
                  "KANA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  LucideIcons.user,
                  size: 28,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Yudhaa",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 4),
                Icon(
                  LucideIcons.chevronDown,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: _Header(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => StatCard(stat: teacherStats[index]),
                    childCount: teacherStats.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 150,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: _DashboardActions(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: _UploadSection(),
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
          "Teacher Dashboard",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4),
        Text(
          'Upload PDF materials and let AI generate interactive quiz questions automatically',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class _DashboardActions extends StatelessWidget {
  const _DashboardActions();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: isMobile
          ? Column(
              children: [
                _uploadBtn(),
                const SizedBox(height: 12),
                _generateBtn(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _uploadBtn()),
                const SizedBox(width: 12),
                Expanded(child: _generateBtn()),
              ],
            ),
    );
  }

  Widget _uploadBtn() {
    return AppButton(
      label: "Manage Student",
      icon: LucideIcons.users,
      fullWidth: true,
      onPressed: () {},
    );
  }

  Widget _generateBtn() {
    return AppButton(
      label: "View All Deck",
      variant: AppButtonVariant.secondary,
      icon: LucideIcons.bookOpen,
      fullWidth: true,
      onPressed: () {},
    );
  }
}

class _UploadSection extends StatelessWidget {
  const _UploadSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              LucideIcons.plus,
              size: 30,
              color: Colors.primaries[5],
            ),
            const SizedBox(width: 8),
            const Text(
              "Upload New Material",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(height: 16),

        AppCard(
          child: FileUploadArea(
            type: UploadType.pdf,
            onFileSelected: (file) {
              debugPrint("Selected file: ${file.name}");
            },
          ),
        ),
      ],
    );
  }
}
