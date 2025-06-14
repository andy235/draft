import 'dart:io';
import 'package:birthday_data/ui/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/list_provider.dart';

class AddPeopleBirthday extends StatefulWidget {
  const AddPeopleBirthday({Key? key}) : super(key: key);

  @override
  State<AddPeopleBirthday> createState() => _AddPeopleBirthdayState();
}

class _AddPeopleBirthdayState extends State<AddPeopleBirthday> {
  final _picker = ImagePicker();
  File? _image;

  final _nameController = TextEditingController();
  final _dataController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late String newName;
  late String newData;
  late String newPhotoURL;


  void _pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(file!.path);
      newPhotoURL = file.path;
    });
    // if (mounted && file != null) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute<void>(
    //           builder: (BuildContext context) =>
    //               VideoEditorPage(file: File(file.path))));
    // }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _pickImage();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _dataController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление именинника"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _formKey.currentState?.save(); // null check
              Provider.of<ListProvider>(context, listen: false).addToListModel(newName, newData, newPhotoURL);
              // _formKey.currentState?.reset();
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));

            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildImagePicker(context),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'ФИО именинника',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _nameController.clear();
                        },
                        child: const Icon(
                          Icons.cancel,
                        ),
                      )),
                  onSaved: (value) => newName = value!,
                ),
                TextFormField(
                  controller: _dataController,
                  decoration: InputDecoration(
                      labelText: 'Дата рождения',
                      prefixIcon: Icon(Icons.calendar_today),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _dataController.clear();
                        },
                        child: const Icon(
                          Icons.cancel,
                        ),
                      )),
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1920),
                        lastDate: DateTime(2050));
                    if (pickedDate != null) {
                      setState(() {
                        _dataController.text =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                      });
                    }
                  },
                  onSaved: (value) => newData = value!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildImagePicker(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: _image != null
                  ? Image.file(
                      _image!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          child: Text('Добавить фото'),
          onPressed: () {
            _showPicker(context);
          },
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
