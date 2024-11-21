import '../base.dart';
import 'home/home_page.dart';
import 'home/home_pc_page.dart';
import 'login/login_pwd_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (F.mobile) {
          F.pushReplacementNoAnimation(LoginPage());
        } else {
          F.pushReplacementNoAnimation(LoginPage());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
