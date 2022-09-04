import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Helper/Color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        SvgPicture.asset("assets/no_internet.svg"),
        SizedBox(height: 50),
        Text('Login functionality will come soon',style: TextStyle(fontSize: 18,color: colors.primary),)

      ],
    );
  }
}
