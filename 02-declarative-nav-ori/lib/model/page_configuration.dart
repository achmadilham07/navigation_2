class PageConfiguration {
  final String? detailId;
  final String? nameReview;
  final String? review;

  PageConfiguration.home()
      : detailId = null,
        nameReview = null,
        review = null;

  PageConfiguration.detail(String id)
      : detailId = id,
        nameReview = null,
        review = null;

  PageConfiguration.review(String name, String this.review)
      : detailId = null,
        nameReview = name;

  bool get isHomePage =>
      detailId == null && nameReview == null && review == null;
  bool get isDetailPage =>
      detailId != null && nameReview == null && review == null;
  bool get isReviewPage => nameReview != null && review != null;

  @override
  String toString() {
    return "PageConfiguration($detailId, $nameReview, $review)";
  }
}
