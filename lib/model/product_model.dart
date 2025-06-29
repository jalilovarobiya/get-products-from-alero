class ProductsModel {
  final int id;
  final String nameUz;
  final String nameCrl;
  final String nameRu;
  final String image;
  final String backgroundImg;
  final List<SubProductsModel> subCategories;
  final List<ProductModel> products;

  ProductsModel({
    required this.id,
    required this.nameUz,
    required this.nameCrl,
    required this.nameRu,
    required this.image,
    required this.backgroundImg,
    required this.subCategories,
    required this.products,
  });

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'],
      nameUz: map['name_uz'],
      nameCrl: map['name_crl'],
      nameRu: map['name_ru'],
      image: map['image'],
      backgroundImg: map['background_img'],
      subCategories: List<SubProductsModel>.from(
        map['sub_categories']?.map((x) => SubProductsModel.fromMap(x)) ?? [],
      ),
      products: List<ProductModel>.from(
        map['products']?.map((x) => ProductModel.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameUz,
      'name_crl': nameCrl,
      'name_ru': nameRu,
      'image': image,
      'background_img': backgroundImg,
      'sub_categories': subCategories.map((x) => x.toMap()).toList(),
      'products': products.map((x) => x.toMap()).toList(),
    };
  }
}

class SubProductsModel {
  final int id;
  final String nameUz;
  final String nameCrl;
  final String nameRu;
  final String image;
  final int categoryId;

  SubProductsModel({
    required this.id,
    required this.nameUz,
    required this.nameCrl,
    required this.nameRu,
    required this.image,
    required this.categoryId,
  });

  factory SubProductsModel.fromMap(Map<String, dynamic> map) {
    return SubProductsModel(
      id: map['id'],
      nameUz: map['name_uz'],
      nameCrl: map['name_crl'],
      nameRu: map['name_ru'],
      image: map['image'],
      categoryId: map['category_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameUz,
      'name_crl': nameCrl,
      'name_ru': nameRu,
      'image': image,
      'category_id': categoryId,
    };
  }
}

class ProductModel {
  final int id;
  final String nameUz;
  final String nameCrl;
  final String nameRu;
  final String color;
  final String price;
  final int qty;
  final int discountedPrice;
  final String discount;
  final String discountType;
  final String discountStart;
  final String discountEnd;
  final String descriptionUz;
  final String descriptionCrl;
  final String descriptionRu;
  final int categoryId;
  final int brandId;
  final List<ProductImageModel> images;

  ProductModel({
    required this.id,
    required this.nameUz,
    required this.nameCrl,
    required this.nameRu,
    required this.color,
    required this.price,
    required this.qty,
    required this.discountedPrice,
    required this.discount,
    required this.discountType,
    required this.discountStart,
    required this.discountEnd,
    required this.descriptionUz,
    required this.descriptionCrl,
    required this.descriptionRu,
    required this.categoryId,
    required this.brandId,
    required this.images,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      nameUz: map['name_uz'],
      nameCrl: map['name_crl'],
      nameRu: map['name_ru'],
      color: map['color'],
      price: map['price'],
      qty: map['qty'],
      discountedPrice: map['discounted_price'],
      discount: map['discount'],
      discountType: map['discount_type'],
      discountStart: map['discount_start'],
      discountEnd: map['discount_end'],
      descriptionUz: map['description_uz'],
      descriptionCrl: map['description_crl'],
      descriptionRu: map['description_ru'],
      categoryId: map['category_id'],
      brandId: map['brand_id'],
      images: List<ProductImageModel>.from(
        map['images']?.map((x) => ProductImageModel.fromMap(x)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_uz': nameUz,
      'name_crl': nameCrl,
      'name_ru': nameRu,
      'color': color,
      'price': price,
      'qty': qty,
      'discounted_price': discountedPrice,
      'discount': discount,
      'discount_type': discountType,
      'discount_start': discountStart,
      'discount_end': discountEnd,
      'description_uz': descriptionUz,
      'description_crl': descriptionCrl,
      'description_ru': descriptionRu,
      'category_id': categoryId,
      'brand_id': brandId,
      'images': images.map((x) => x.toMap()).toList(),
    };
  }
}

class ProductImageModel {
  final int id;
  final String image;

  ProductImageModel({required this.id, required this.image});

  factory ProductImageModel.fromMap(Map<String, dynamic> map) {
    return ProductImageModel(id: map['id'], image: map['image']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'image': image};
  }
}
