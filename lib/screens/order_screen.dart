import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String cupFilling = 'Skim Milk';
  String sugarLevel = 'No Sugar';
  bool highPriority = false;
  final TextEditingController _itemCountController = TextEditingController();
  String? selectedItem; // Set this to null initially

  @override
  void dispose() {
    _itemCountController.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedItem == null ? 'Select an Item' : 'Order $selectedItem', 
          /// If no item is selected, show a prompt in the AppBar
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Dropdown to select coffee type
            DropdownButton<String>(
              value: selectedItem, /// selectedItem will be null initially
              hint: Text('Select Coffee Type'), /// Show hint when no item is selected
              dropdownColor: Colors.brown[100], // Apply the theme color here
              items: ['Latte', 'Cappuccino', 'Flat White'] /// List of coffee types
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) { /// When a new coffee type is selected
                setState(() {
                  selectedItem = newValue; /// Update selectedItem with the new value
                });
              },
            ),
            DropdownButton<String>(
              value: cupFilling,
              dropdownColor: Colors.brown[100], // Apply the theme color here
              items: ['Skim Milk', 'Full Cream Milk', 'Oat Milk']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  cupFilling = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              value: sugarLevel,
              dropdownColor: Colors.brown[100], // Apply the theme color here
              items: ['No Sugar', 'Low Sugar', 'High Sugar']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  sugarLevel = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('High Priority'),
              activeColor: Colors.brown, // Change checkbox color to match theme
              value: highPriority,
              onChanged: (bool? value) {
                setState(() {
                  highPriority = value!;
                });
              },
            ),
            TextField(
              controller: _itemCountController, // Use the general controller for item quantity
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: selectedItem == null ? 'Select an item first' : 'Number of $selectedItem(s)', /// Update label dynamically
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[300],
                foregroundColor: Colors.white, // Set the button text color
              ),
              onPressed: selectedItem == null
                  ? null // Disable the button if no item is selected
                  : () {
                      // Implement the order submission logic here
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Order Submitted'),
                          content: Text(
                            'Your order of ${_itemCountController.text} $selectedItem(s) with $cupFilling and $sugarLevel has been placed.',
                          ), /// Update dialog to reflect selected item and number
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                                Navigator.pop(context); // Navigate back to the previous screen
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
