import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({ super.key,  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 68,
              width: 50,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1)
                ],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if(value.length==1){
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            );
  }
}