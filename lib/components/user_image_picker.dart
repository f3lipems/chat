import 'dart:io';

import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;

  const UserImagePicker({super.key, required this.onImagePick});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: null,
        ),
        TextButton(
          onPressed: () {},
          child: Text('Adicionar Foto'),
        ),
      ],
    );
  }
}