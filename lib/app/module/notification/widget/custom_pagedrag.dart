// import 'package:flutter/material.dart';

// class DragPage extends StatefulWidget {
//   const DragPage({super.key});

//   @override
//   _DragPageState createState() => _DragPageState();
// }

// class _DragPageState extends State<DragPage> {
//   double _xOffset = 0;
//   double _yOffset = 0;
//   bool _isDragging = false; // Track if dragging is in progress

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Full-screen draggable page
//           Positioned(
//             left: _xOffset,
//             top: _yOffset,
//             child: GestureDetector(
//               onPanDown: (_) {
//                 // Set isDragging to true when dragging starts
//                 setState(() {
//                   _isDragging = true;
//                 });
//               },
//               onPanUpdate: (details) {
//                 setState(() {
//                   // Update the position of the page based on the pan gesture
//                   _xOffset += details.delta.dx;
//                   _yOffset += details.delta.dy;
//                 });
//               },
//               onPanEnd: (_) {
//                 // Check if dragging is no longer on hold
//                 if (!_isDragging) {
//                   return;
//                 }

//                 setState(() {
//                   // Set isDragging to false when dragging ends
//                   _isDragging = false;
//                 });

//                 // Check if page is dragged beyond the offset of more or less than two
//                 if (_xOffset.abs() > 2 || _yOffset.abs() > 2) {
//                   // Pop the page from the Navigator stack
//                   Navigator.pop(context);
//                 }
//               },
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 color:
//                     Colors.blue, // Replace with your desired background color
//               ),
//             ),
//           ),
//           // Optional: Add other UI elements on top of the draggable page
//           // ...
//         ],
//       ),
//     );
//   }
// }
