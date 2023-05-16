import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/alerts/alert_succes.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/constants/color_constants.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/constants/sizedbox_constants.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/alerts/alert_error.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/pages/sign_in.dart';
// import 'package:ogrenciden_canli_egitim_uygulamasi/service/auth_register.dart';
// import 'package:rive/rive.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPasswordAgain = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final bool _butState = false;

  AuthService authService = AuthService();

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerName.dispose();
    _controllerPassword.dispose();
    _controllerPasswordAgain.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Image.asset("assets/images/ogrenciden_logo_png.png", height: SizedboxConstans.instance.spaceNormal),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerName,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "İsim Soyisim",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "İsim alanı boş bırakılamaz.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerMail,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Mail alanı boş bırakılamaz.";
                      }
                      if (EmailValidator.validate(value) == false) {
                        return "Lütfen geçerli bir mail girin.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    controller: _controllerPassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key_rounded),
                        contentPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: Get.width * 0.04),
                        labelText: "Şifre",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şifre boş olamaz";
                      }
                      if (_controllerPassword.text != _controllerPasswordAgain.text) {
                        return "Şifreler aynı olmalıdır.";
                      } else if (value.length <= 8 &&
                          (value.contains(RegExp(r'[A-Z]')) != true) &&
                          (value.contains(RegExp(r'[0-9]')) != true)) {
                        return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir büyük harf barındırmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                      } else if (value.length <= 8 && (value.contains(RegExp(r'[A-Z]')) != true)) {
                        return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir büyük harf barındırmalıdır.";
                      } else if (value.length <= 8 && (value.contains(RegExp(r'[0-9]')) != true)) {
                        return "• Şifre 8 karakterden büyük olmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                      } else if ((value.contains(RegExp(r'[A-Z]')) != true) &&
                          (value.contains(RegExp(r'[0-9]')) != true)) {
                        return "• Şifre en az bir büyük harf barındırmalıdır.\n• Şifre en az bir rakam barındırmalıdır.";
                      } else if (value.contains(RegExp(r'[A-Z]')) != true) {
                        return "Şifrede en az bir büyük harf bulunmalıdır.";
                      } else if (value.contains(RegExp(r'[0-9]')) != true) {
                        return "Şifrede en az bir rakam bulunmalıdır.";
                      } else if (value.length <= 8) {
                        return "Şifre 8 karakterden büyük olmalıdır.";
                      }
                      return null;
                    },
                  ),
                ),
}