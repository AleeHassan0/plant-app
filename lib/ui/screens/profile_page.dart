import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/ui/screens/widgets/profile_widget.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold (
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/profile.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                      color: Constants.primaryColor.withOpacity(.5)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width*.3,
                child: Row(
                  children: [
                    Text('John Doe',style: TextStyle(
                      color:Constants.blackColor,
                      fontSize: 20,
                    ),),
                    SizedBox(
                      height: 25,
                      child: Image.asset('assets/verified.png'),
                    )
                  ],
                ),
              ),
              Text('johndoe@gmail.com',style: TextStyle(
                color: Constants.blackColor.withOpacity(.3)
              ),),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height*.7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profilewidget(icon: Icons.person,title: 'My Profile',),
                    profilewidget(icon: Icons.settings,title: 'Settings',),
                    profilewidget(icon: Icons.notifications,title: 'Notifications',),
                    profilewidget(icon: Icons.chat,title: 'FAQs',),
                    profilewidget(icon: Icons.share,title: 'Share',),
                    profilewidget(icon: Icons.logout,title: 'Log Out',),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


