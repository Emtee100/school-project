import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: FilterChip(
                          //selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
                          showCheckmark: true,
                          backgroundColor: Colors.transparent,
                          label: Text(
                            'Friday',
                            style: GoogleFonts.notoSans(),
                          ),
                          selected: isSelected,
                          onSelected: (value){
                            setState(() {
                              isSelected = value;
                            });
                            print(isSelected);
                          },
                        ),
                      ),
            
            // Text("Home Page"),
          )
        ],
      ),
    );
  }
}
