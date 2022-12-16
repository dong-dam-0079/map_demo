import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BitmapConvert {
  static Future<BitmapDescriptor> bitmapSvg(
    BuildContext context,
    int id,
  ) async {
    // Default bitmap is pin_red
    String svgString = await DefaultAssetBundle.of(context)
        .loadString('assets/images/ic_pin_red.svg');

    if (id % 2 == 0) {
      svgString = await DefaultAssetBundle.of(context)
          .loadString('assets/images/ic_pin_blue.svg');
    }

    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, 'svg');

    // Calculate parameters of bitmap (width - height)
    MediaQueryData queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    double width = 24 * devicePixelRatio;
    double height = 24 * devicePixelRatio;

    // Draw to image and convert to byte
    ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));
    ui.Image image = await picture.toImage(width.toInt(), height.toInt());
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  static Future<BitmapDescriptor> _bitmapGroup(
    String text,
    int size,
  ) async {

    /// Đoạn này là mình define Canvas để chuẩn bị vẽ và khởi tạo loại màu để fill lên hình tròn
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orangeAccent;
    final Paint paint2 = Paint()..color = Colors.white;

    /// Chỗ này là hàm có sẵn của Canvas giúp vẽ hình tròn
    /// Ở đây mình vẽ 3 hình tròn để lấy được border bên ngoài hình tròn
    /// Mình chỉ việc đưa vào:
    /// Offset: Tọa độ (dx,dy)
    /// size/2.0: bán kính hình tròn
    /// paint1: màu sẽ fill lên hình tròn đó
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint1);

    /// Chỗ này sẽ tạo text số lượng marker được group
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text,
      style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal),
    );
    painter.layout();

    /// Xong rồi gán vào hàm paint để vẽ hình tròn với text ở giữa
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );
    ui.Image img = await pictureRecorder.endRecording().toImage(size, size);
    ByteData? data = await img.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}
