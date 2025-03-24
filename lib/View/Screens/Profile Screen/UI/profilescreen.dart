import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywell/View%20Model/Provider/authprovider.dart';
import 'package:shopywell/View%20Model/Util/colors.dart';
import 'package:shopywell/View/Screens/Forgot%20Password%20Screen/UI/forgotpasswordscreen.dart';
import 'package:shopywell/View/Screens/Login%20Screen/Ui/loginscreen.dart';
import 'package:shopywell/View/Screens/Register%20Screen/UI/registerscreen.dart';
import 'package:shopywell/View/Widgets/myappbar.dart';
import 'package:shopywell/View/Widgets/mybutton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authProvider = Provider.of<AuthProvider>(context);
    emailController.text = authProvider.user?.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Profile",
        actionWidget: [],
        leadingWidget: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),

              // Profile Picture with Edit Button
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          onPressed: () {}, // Add image picker logic
                          icon: Icon(Icons.edit, color: Colors.white),
                          iconSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Personal Details",
                style: TextStyle(
                  fontFamily: "Montserrat Bold",
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),

              // User Email Field
              Text("Email Address", style: TextStyle(fontSize: 13)),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  fillColor: Util().whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Util().borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 2,
                        color: Util().borderColor), // Border when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Util().placehldrColor,
                        width: 2.0), // Focused border
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.red), // Error border
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontFamily: "Montserrat Medium",
                            color: Util().primaeryColor),
                      )),
                ],
              ),
              SizedBox(height: 30),

              // Logout Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MyButton(
                  text: "Logout",
                  width: double.infinity,
                  height: 50,
                  onPressed: () async {
                    await authProvider.signOut();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Logout Success"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false, // This removes all previous routes
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
