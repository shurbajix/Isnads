import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class Destilshome {
  String title;
  String imagePath;

  Destilshome({
    required this.imagePath,
    required this.title,
  });

  static List<Destilshome> items = [
    Destilshome(
      imagePath: 'assets/images/vectors/vector.png',
      title: 'نهضة',
    ),
    Destilshome(
      imagePath: 'assets/images/vectors/vector1.png',
      title: 'فعاليات',
    ),
    Destilshome(
      imagePath: 'assets/images/vectors/vector2.png',
      title: 'فعاليات اجتماعية',
    ),
    Destilshome(
      imagePath: 'assets/images/vectors/vector3.png',
      title: 'فعاليات ثقافية',
    ),
  ];
}

// Usage in your widget

final ImagePicker _imagePicker = ImagePicker();
Uint8List? _image;

Future<Uint8List?> pickImage(ImageSource source) async {
  try {
    XFile? file = await _imagePicker.pickImage(source: source);

    if (file != null) {
      List<int> imageBytes = await file.readAsBytes();
      return Uint8List.fromList(imageBytes);
    } else {
      return null;
    }
  } catch (e) {
    print('Error picking image: $e');
    return null;
  }
}
