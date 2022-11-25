class PageConfiguration {
  final bool unknown;
  final String? detailId;
  final String? nameReview;
  final String? review;

  PageConfiguration.home()
      : unknown = false,
        detailId = null,
        nameReview = null,
        review = null;

  PageConfiguration.detail(String id)
      : unknown = false,
        detailId = id,
        nameReview = null,
        review = null;

  PageConfiguration.review(String name, String this.review)
      : unknown = false,
        detailId = null,
        nameReview = name;

  PageConfiguration.unknown()
      : unknown = true,
        detailId = null,
        nameReview = null,
        review = null;

  bool get isHomePage =>
      unknown == false &&
      detailId == null &&
      nameReview == null &&
      review == null;
  bool get isDetailPage =>
      unknown == false &&
      detailId != null &&
      nameReview == null &&
      review == null;
  bool get isUnknownPage => unknown == true;
  bool get isReviewPage =>
      unknown == false && nameReview != null && review != null;
}
