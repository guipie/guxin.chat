import '../../../base.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: S.current.phone,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      keyboardType: TextInputType.phone,
      forceErrorText: '错误',
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 11) {
          return 'Please enter your name';
        }
        return null;
      },
      onSaved: (phone) {
        phone.e();
      },
    );
  }
}
