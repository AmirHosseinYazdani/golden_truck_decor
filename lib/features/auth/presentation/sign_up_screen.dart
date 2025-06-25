// مسیر: lib/features/auth/presentation/signup_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpFormProvider =
    StateProvider<SignUpFormState>((ref) => SignUpFormState());

class SignUpFormState {
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;
  String? error;

  bool get isValid =>
      email.isNotEmpty && password.length >= 6 && password == confirmPassword;
}

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(signUpFormProvider);
    final formNotifier = ref.read(signUpFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ایجاد حساب کاربری'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration:
                  const InputDecoration(labelText: 'ایمیل یا شماره تلفن'),
              onChanged: (val) =>
                  formNotifier.update((state) => state..email = val),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'رمز عبور (حداقل ۶ کاراکتر)'),
              onChanged: (val) =>
                  formNotifier.update((state) => state..password = val),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'تکرار رمز عبور'),
              onChanged: (val) =>
                  formNotifier.update((state) => state..confirmPassword = val),
            ),
            if (!form.isValid && form.confirmPassword.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('رمزها یکسان نیستند یا ضعیف هستند',
                    style: TextStyle(color: Colors.red)),
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: form.isValid && !form.isLoading
                    ? () async {
                        formNotifier.update((state) => state..isLoading = true);
                        await Future.delayed(const Duration(seconds: 2));
                        formNotifier
                            .update((state) => state..isLoading = false);

                        // در آینده اینجا اتصال به API انجام میشه
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('ثبت‌نام با موفقیت انجام شد')),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: form.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('ثبت‌نام'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
