import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/ui_component/colors.dart';

class MainStateCheckScreen extends StatelessWidget {
  const MainStateCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Material 위젯 추가
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('상태라이브러리 메인', style: TextStyle(fontSize: 16)),
            MaterialButton(
              onPressed: () {},
              color: AppColors.accent100,
              textColor: Colors.white,
              child: Text('PROVIDER VIEWMODEL '),
            ),
            MaterialButton(
              onPressed: () {},
              color: AppColors.accent40,
              textColor: Colors.white,
              child: Text('PROVIDER NAVIGATION SHARE DATA '),
            ),
            SizedBox(height: 12),
            MaterialButton(
              onPressed: () {},
              color: AppColors.primary100,
              textColor: Colors.white,
              child: Text('LIVERPOD VIEWMODEL '),
            ),
            MaterialButton(
              onPressed: () {},
              color: AppColors.primary40,
              textColor: Colors.white,
              child: Text('LIVERPOD NAVIGATION SHARE DATA '),
            ),
            SizedBox(height: 12),
            MaterialButton(
              onPressed: () {},
              color: AppColors.secondary100,
              textColor: Colors.white,
              child: Text('BLOC VIEWMODEL '),
            ),
            MaterialButton(
              onPressed: () {},
              color: AppColors.secondary40,
              textColor: Colors.white,
              child: Text('BLOC NAVIGATION SHARE DATA '),
            ),
            SizedBox(height: 12),
            MaterialButton(
              onPressed: () {},
              color: AppColors.black100,
              textColor: Colors.white,
              child: Text('GETX VIEWMODEL '),
            ),
            MaterialButton(
              onPressed: () {},
              color: AppColors.black40,
              textColor: Colors.white,
              child: Text('GETX NAVIGATION SHARE DATA '),
            ),
          ],
        ),
      ),
    );
  }
}
