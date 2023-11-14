import 'package:flutter/material.dart';
import 'package:klabs/components/labTile.dart';
import 'package:klabs/providers/fireStoreProvider.dart';
import 'package:klabs/providers/sheetsProvider.dart';
import 'package:provider/provider.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  List<Map<String, dynamic>> labInfo =[
    {'name': 'TC 0-1/TC 0-2', 'size':60},
    {'name': 'TC 0-3', 'size':60},
    {'name': 'TC 0-5/TC 0-6', 'size':65},
    {'name': 'TC 0-7/TC 0-8', 'size':70},
    {'name': 'J1', 'size':60},
    {'name': 'J2', 'size':60},
    {'name': 'DA LAB', 'size':30},    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<SheetData>(
      builder: (context, value, child) => Column(
        
        children: [
          Expanded(child: ListView.builder(
            itemCount: labInfo.length,
            itemBuilder: (context, index) {
              return Labtile(labName: labInfo[index]['name'], computers: labInfo[index]['size']);
            },)),
        ],
      ),
    ));
  }
}
