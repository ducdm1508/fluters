import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }

}

class _LoginScreenState extends State<LoginScreen>{
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16) ,
          child: Center(
            child: Card(
              color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Bug Master",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF008541),
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Enterprise Bug Management System",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF66768D),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Đăng nhập hệ thống",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tên đăng nhập hoặc Email",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        color: Color(0xFF66768D),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Color(0xFF66768D),
                        ),
                        hintText: "Nhập email công ty của bạn...",
                        hintStyle: TextStyle(
                          color: Color(0xFF66768D),
                        ),

                        filled: true,
                        fillColor: Color(0xFFF5F8F7),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF66768D),
                            width: 1.2,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF66768D),
                            width: 1.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mật khẩu",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                        obscureText: _obscurePassword,
                      style: TextStyle(
                        color: Color(0xFF66768D),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFF66768D),
                        ),
                        hintText: "Nhập mật khẩu",
                        hintStyle: TextStyle(
                          color: Color(0xFF66768D),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF66768D),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Color(0xFFF5F8F7),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF66768D),
                            width: 1.2,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xFF66768D),
                            width: 1.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF008541),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          children: [
                            Text(
                              "Đăng nhập",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white70,

                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.login_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        )
                      ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F3F4), // màu khác
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "data",
                            style: TextStyle(
                              color: Color(0xFF66768D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}