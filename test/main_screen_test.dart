import 'package:dars15/model/product_model.dart';
import 'package:dars15/views/screens/main_screen.dart';
import 'package:dars15/vievmodel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mocks/mock_viewmodel.mocks.dart';

@GenerateMocks([Viewmodel])
void main() {
  testWidgets("productlarni apidan olib kelsh", (tester) async {
    final mockViewmodel = MockViewmodel();

    final product = ProductsModel(
      id: 1,
      nameUz: "Kompyuter texnikasi",
      nameCrl: "Компьютер техникаси",
      nameRu: "Компьютерная техника",
      image: "https://example.com/image.png",
      backgroundImg: "https://example.com/bg.png",
      subCategories: [],
      products: [
        ProductModel(
          id: 101,
          nameUz: "ASUS",
          nameCrl: "ASUS",
          nameRu: "ASUS",
          color: "#000000",
          price: "10000000",
          qty: 10,
          discountedPrice: 9000000,
          discount: "10%",
          discountType: "percentage",
          discountStart: "2025-01-01",
          discountEnd: "2025-02-01",
          descriptionUz: "ASUS desc",
          descriptionCrl: "ASUS desc",
          descriptionRu: "ASUS desc",
          categoryId: 3,
          brandId: 1,
          images: [],
        ),
      ],
    );

    when(mockViewmodel.getProducts()).thenAnswer((_) async => product);

    await tester.pumpWidget(
      MaterialApp(home: MainScreen(viewmodel: mockViewmodel)),
    );

    await tester.pumpAndSettle();

    expect(find.text("Kompyuter texnikasi"), findsOneWidget);
    expect(find.text("ASUS"), findsOneWidget);

    await tester.tap(find.text("ASUS"));
    await tester.pumpAndSettle();

    expect(find.text("Product Details"), findsOneWidget);
  });
}
