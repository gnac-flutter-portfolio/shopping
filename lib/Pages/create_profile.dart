import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create profile'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: const Text('Back'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
