import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masar_app/components/credit_card_componentt/card_string.dart';
import 'package:masar_app/constant.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}


class _RadioButtonState extends State<RadioButton> {
  String? card; // The selected card type (Visa or Mastercard)
  
  // Method to set the selected radio value
  void setSelectedRadio(String value) {
    setState(() {
      card = value;
    });
  }

  // Method to validate if a radio button is selected
  String? validateRadio() {
    if (card == null) {
      return Strings.cardType; // Show error message if no card type is selected
    }
    return null; // No error if a card type is selected
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for radio buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<String>(
              activeColor: kPrimaryColor,
              value: "Visa", // Value for Visa
              groupValue: card, // Group value for selected card type
              onChanged: (val) {
                setSelectedRadio(val!); // Set the selected card type to Visa
              },
            ),
            Text(
              "16".tr,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: fontColor),
            ),
            Radio<String>(
              activeColor: kPrimaryColor,
              value: "Mastercard", // Value for Mastercard
              groupValue: card, // Group value for selected card type
              onChanged: (val) {
                setSelectedRadio(val!); // Set the selected card type to Mastercard
              },
            ),
            Text(
              "17".tr,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: fontColor),
            ),
          ],
        ),
        
        // Display validation error if no card type is selected
        if (validateRadio() != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              validateRadio()!,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
      ],
    );
  }
}




/*class _RadioButtonState extends State<RadioButton> {
  String? card;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio( 
            activeColor: kPrimaryColor,
            value: "Visa",
            groupValue: card,      
            onChanged: (val) {
              setState(() {
                card = val;
              });
            }),
        Text(
          "16".tr,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: fontColor),
        ),
        Radio(
            activeColor: kPrimaryColor,
            value: "Mastercard",
            groupValue: card,
            onChanged: (val) {
              setState(() {
                card = val;
              });
            }),
        Text(
          "17".tr,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: fontColor),
        ),
      ],
    );
  }
}
*/