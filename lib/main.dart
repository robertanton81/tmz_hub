import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final teamNameProvider = StateProvider<String>((ref) => '');
final sportTypeProvider = StateProvider<String>((ref) => '');
final cityProvider = StateProvider<String>((ref) => '');

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Team Registration',
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  RegistrationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var email = ref.watch(emailProvider);
    var password = ref.watch(passwordProvider);
    var teamName = ref.watch(teamNameProvider);
    var sportType = ref.watch(sportTypeProvider);
    var city = ref.watch(cityProvider);

    var sportTypes = const [
      DropdownMenuItem(value: "USA", child: Text("USA")),
      DropdownMenuItem(value: "Canada", child: Text("Canada")),
      DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      DropdownMenuItem(value: "England", child: Text("England")),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Team Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {
                  email = value;
                  // context.read(emailProvider).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                  // context.read(passwordProvider).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Team Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your team name';
                  }
                  return null;
                },
                onChanged: (value) {
                  teamName = value;
                  // context.read(teamNameProvider).state = value;
                },
              ),
              DropdownButtonFormField<String>(
                value: "USA",
                decoration: const InputDecoration(
                  labelText: 'Sport Type',
                ),
                items: sportTypes.toList(),
                onChanged: (value) {
                  sportType = value!;
                  // context.read(sportTypeProvider).state = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'City',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                onChanged: (value) {
                  city = value;
                  // context.read(cityProvider).state = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null
                        // _formKey.currentState?.validate()
                        ) {
                      // TODO: Submit registration form
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
