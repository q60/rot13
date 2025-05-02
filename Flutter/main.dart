import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROT13',
      home: DefaultForm(),
    );
  }
}

class DefaultForm extends StatefulWidget {
  @override
  _DefaultFormState createState() => _DefaultFormState();
}

class _DefaultFormState extends State<DefaultForm> {
  final encodedController = TextEditingController();
  
  @override
  void dispose() {
    encodedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ROT13 encoder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget> [
            TextFormField(
              minLines: 3,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Enter string to encode',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios
                  ),
                  onPressed: null,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(9),
                  )
                )
              ),
              onChanged: (text) {
                String toEncodeText = text;
                String encodedText = '';
                toEncodeText.runes.forEach(
                      (int rune) {
                    int charNormal = String
                        .fromCharCode(rune)
                        .codeUnitAt(0);
                    int charUpper  = String
                        .fromCharCode(rune)
                        .toUpperCase()
                        .codeUnitAt(0);
                    if (charUpper <= 77 && 65 <= charUpper) {
                      encodedText += String.fromCharCode(charNormal + 13);
                    } else if (charUpper <= 90 && 77 <= charUpper) {
                      encodedText += String.fromCharCode(charNormal - 13);
                    } else {
                      encodedText += String.fromCharCode(charNormal);
                    }
                  }
                );
                encodedController.text = encodedText;
              },
            ),
            SizedBox(
              height: 46,
            ),
            TextFormField(
              minLines: 3,
              maxLines: null,
              controller: encodedController,
              decoration: InputDecoration(
                labelText: 'Encoded string',
                suffixIcon: IconButton(
                  icon: Icon(
                      Icons.arrow_back_ios
                  ),
                  onPressed: null,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(9),
                  )
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}