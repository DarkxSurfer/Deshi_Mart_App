class ItemModel {

  final String productId, productName, productDescription, productThumbNail;
  final String unitPrice;

  const ItemModel({

    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productThumbNail,
    required this.unitPrice

  });
}

List<ItemModel> itemList = [
  // const ItemModel(productId: '1', productName: 'Red Apple', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/pngfuel 1.png', unitPrice: 4.99),
  // const ItemModel(productId: '2', productName: 'Bell Pepper Red', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/Rise.png', unitPrice: 4.99),
  // const ItemModel(productId: '3', productName: 'Ginger', productDescription: '250gm, Price', productThumbNail: 'assets/Banners/Sugar.png', unitPrice: 4.99),
  // const ItemModel(productId: '4', productName: 'Beef Bone', productDescription: '1kg, Price', productThumbNail: 'assets/Banners/bottle.png', unitPrice: 4.99),
  // const ItemModel(productId: '5', productName: 'Organic Banana', productDescription: '1kg, Price', productThumbNail: 'assets/Banners/medicine.png', unitPrice:  4.99),

];