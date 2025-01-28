class BestSellerAssets {
  String title;
  String imageUrl;
  String rate;
  String authorName;
  String reviewCount;
  String price;

  BestSellerAssets(
    this.title,
    this.imageUrl,
    this.rate,
    this.authorName,
    this.reviewCount,
    this.price,
  );
}

List<BestSellerAssets> books = [
  BestSellerAssets(
    'Everything is Illuminated',
    'assets/best_seller/Everything-is-Illuminated-Book-Cover-420x600.jpg',
    '4.5',
    'Jonathan Safran Foer',
    '1,200',
    '19.99',
  ),
  BestSellerAssets(
    'Jaws',
    'assets/best_seller/Jaws-Book-Cover-400x600.jpg',
    '4.7',
    'Peter Benchley',
    '3,400',
    '24.99',
  ),
  BestSellerAssets(
    'Jurassic Park',
    'assets/best_seller/Jurassic-Park-Book-Cover-458x600.jpg',
    '4.8',
    'Michael Crichton',
    '5,200',
    '29.99',
  ),
  BestSellerAssets(
    'Psycho',
    'assets/best_seller/Psycho-Book-Cover-437x600.jpg',
    '4.6',
    'Robert Bloch',
    '800',
    '14.99',
  ),
  BestSellerAssets(
    'The Divine Comedy',
    'assets/best_seller/The-Divine-Comedy-Book-Cover-400x600.jpg',
    '4.7',
    'Dante Alighieri',
    '7,100',
    '34.99',
  ),
  BestSellerAssets(
    'The Godfather',
    'assets/best_seller/The-Godfather-Book-Cover-399x600.jpg',
    '4.8',
    'Mario Puzo',
    '4,900',
    '24.99',
  ),
  BestSellerAssets(
    'The Great Gatsby',
    'assets/best_seller/The-Great-Gatsby-Book-Cover-391x600.jpg',
    '4.4',
    'F. Scott Fitzgerald',
    '6,800',
    '17.99',
  ),
  BestSellerAssets(
    'The Invisible Man',
    'assets/best_seller/The-Invisible-Man-Book-Cover-385x600.jpg',
    '4.3',
    'H.G. Wells',
    '12,000',
    '22.99',
  ),
  BestSellerAssets(
    'The Little Prince',
    'assets/best_seller/The-Little-Prince-Book-Cover-389x600.jpg',
    '4.9',
    'Antoine de Saint-Exupéry',
    '12,000',
    '19.99',
  ),
];
