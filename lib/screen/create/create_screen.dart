import 'package:contact/widgets/form_input.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  int? id;
  String? nameUser;
  String? jobUser;
  String action;

  CreateScreen(
      {Key? key, this.nameUser, this.jobUser, required this.action, this.id})
      : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController name = TextEditingController(text: '');
  TextEditingController job = TextEditingController(text: '');

  bool cekForm() {
    if (name.text.isEmpty || job.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/icons/ic_user.png'))),
          ),
          FormInput(
            controller: name..text = widget.nameUser ?? '',

            title: 'Name',
            hint: 'full name',
          ),
          const SizedBox(
            height: 20,
          ),
          FormInput(
            controller:job..text = widget.jobUser ?? '',
            title: 'Job',
            hint: 'example : ceo',
          ),
          const SizedBox(
            height: 20,
          ),
          
               RoundedButton(
                  func: () {
                   
                  
                  },
                  titleButton: widget.action)
            
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    job.clear();
    name.clear();
  }
}
