import 'package:stack_chart/stack_chart.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
}


// Widget stackWidget([data]) {
//   String dd = "";
//   if (data != null) {
//     dd = data['type'];
//   } else {
//     dd = "empty";
//   }
//   return Column(
//     children: [
//       Container(
//           margin: const EdgeInsets.only(top: 12.5),
//           width: MediaQuery.of(context).size.width * 0.05,
//           height: MediaQuery.of(context).size.width * 0.07,
//           color: dd == 'impromptu'
//               ? const Color(0xFFD9177E)
//               : dd == 'trymd'
//                   ? const Color(0xFFF75C1E)
//                   : dd == 'No Slot'
//                       ? Colors.white
//                       : dd == 'cancel'
//                           ? const Color(0xFFF70000)
//                           : dd == 'available'
//                               ? const Color(0xFF21B000)
//                               : dd == 'empty'
//                                   ? Colors.white
//                                   : dd == 'telephone'
//                                       ? const Color.fromARGB(255, 238, 226, 59)
//                                       : const Color(0xFFE2E5EC)),
//     ],
//   );
// }
