import 'package:crafty_bay/features/auth/presentation/providers/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileProvider _userProfileProvider = UserProfileProvider();

  final _firstNameTE = TextEditingController();
  final _lastNameTE = TextEditingController();
  final _emailTE = TextEditingController();
  final _phoneTE = TextEditingController();
  final _cityTE = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _userProfileProvider.loadUser();

      final user = _userProfileProvider.user;
      if (user != null) {
        _firstNameTE.text = user.firstName;
        _lastNameTE.text = user.lastName;
        _emailTE.text = user.email;
        _phoneTE.text = user.phone;
        _cityTE.text = user.city;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: ChangeNotifierProvider.value(
        value: _userProfileProvider,
        child: Consumer<UserProfileProvider>(
          builder: (context, provider, _) {
            if (provider.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.localization.first_name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(controller: _firstNameTE),

                  const SizedBox(height: 10),

                  Text(
                    context.localization.last_name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(controller: _lastNameTE),

                  const SizedBox(height: 10),

                  Text(
                    context.localization.email,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(controller: _emailTE),

                  const SizedBox(height: 10),

                  Text(
                    context.localization.phone,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(controller: _phoneTE),

                  const SizedBox(height: 10),

                  Text(
                    context.localization.city,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(controller: _cityTE),

                  const SizedBox(height: 16),

                  FilledButton(
                    onPressed: () async {
                      await _userProfileProvider.logout();
                      if (!mounted) return;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInScreen.name,
                        (route) => false,
                      );
                    },
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userProfileProvider.dispose();
    _firstNameTE.dispose();
    _lastNameTE.dispose();
    _emailTE.dispose();
    _phoneTE.dispose();
    _cityTE.dispose();
    super.dispose();
  }
}
