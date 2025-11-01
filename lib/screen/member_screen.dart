import 'package:flutter/material.dart';
import '../widgets/member.dart';
import '../widgets/group_info.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: memberProfile());
  }

  Widget memberProfile() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            GroupInfo(),
            SizedBox(height: 20),
            Member(
              memberPhoto: 'lib/assets/jiwoo.jpg',
              memberName: 'Jiwoo (지우)',
              position: 'Leader, Lead Dancer, Sub Vocalist, Visual',
              dob: 'September 7, 2006',
            ),

            Member(
              memberPhoto: 'lib/assets/carmen.jpg',
              memberName: 'Carmen (카르멘)',
              position: 'Main Vocalist',
              dob: 'March 28, 2006',
            ),

            Member(
              memberPhoto: 'lib/assets/yuha.jpg',
              memberName: 'Yuha (유하)',
              position: 'Main Vocalist, Lead Dancer',
              dob: 'April 12, 2007',
            ),

            Member(
              memberPhoto: 'lib/assets/stella.jpg',
              memberName: 'Stella (스텔라)',
              position: 'Lead Vocalist',
              dob: 'June 18, 2007',
            ),

            Member(
              memberPhoto: 'lib/assets/juun.jpg',
              memberName: 'Juun (주은)',
              position: 'Main Rapper, Main Dancer, Sub Vocalist',
              dob: 'December 3, 2008',
            ),

            Member(
              memberPhoto: 'lib/assets/ana.jpg',
              memberName: 'A-na (에이나)',
              position: ' Rapper, Sub Vocalist, Visual',
              dob: 'December 20, 2008',
            ),

            Member(
              memberPhoto: 'lib/assets/ian.jpg',
              memberName: 'Ian (이안)',
              position: 'Lead Dancer, Sub Vocalist, Visual, Center',
              dob: 'October 9, 2009',
            ),

            Member(
              memberPhoto: 'lib/assets/yeon.jpg',
              memberName: 'Ye-on (예온)',
              position: 'Lead Vocalist, Maknae',
              dob: 'April 19, 2010',
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Members',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    );
  }
}
