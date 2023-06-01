import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';

class GroupOptions extends StatefulWidget {
  const GroupOptions({super.key});

  @override
  State<GroupOptions> createState() => _GroupOptionsState();
}

String? selectedOption; // The selected option from the dropdown

List<String> options = [
  'Awesome',
  'Good',
  'Great',
  'Not so',
  'Fine',
]; // List of available options

int? radioOption; // The selected option from the radio list

List<String> roptions = [
  'Awesome',
  'Good',
  'Great',
  'Not so',
  'Fine',
]; // List of available options

class _GroupOptionsState extends State<GroupOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLearn,
      body: Center(
        child: SizedBox(
          width: 700,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ClipPath(
                      clipper: const ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWhite,
                            border: Border(
                                bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 8.0))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DropdownButton<String>(
                                hint: const Text('-select-'),
                                isExpanded: true,
                                value: selectedOption,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedOption =
                                        newValue; // Update the selected option
                                  });
                                },
                                items: options.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(options[index]),
                                );
                              },
                            ),
                          ],
                        ),
                      ))),
              w24,
              Expanded(
                  child: ClipPath(
                      clipper: const ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      child: Container(
                        width: 200.0,
                        decoration: BoxDecoration(
                            color: kWhite,
                            border: Border(
                                bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 8.0))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                title: Text('How are you feeling today?',
                                    style: textStyleHeading)),
                            ListView(
                              shrinkWrap: true,
                              children: roptions
                                  .asMap()
                                  .entries
                                  .map(
                                    (MapEntry<int, String> entry) =>
                                        RadioListTile<int>(
                                      value: entry.key,
                                      groupValue: radioOption,
                                      onChanged: (int? value) {
                                        setState(() {
                                          radioOption =
                                              value; // Update the selected option
                                        });
                                      },
                                      title: Text(entry.value),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
