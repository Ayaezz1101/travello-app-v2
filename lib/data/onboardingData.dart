class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnboardingModel> onboardingContents = [
  OnboardingModel(
    image: 'assets/images/undraw_traveling_yhxq.png',
    title: 'Explore the world easily',
    subTitle: 'To your desire',
  ),
  OnboardingModel(
    image: 'assets/images/undraw_off_road_re_leme.png',
    title: 'Reach the unknown spot',
    subTitle: 'To your destination',
  ),
  OnboardingModel(
    image: 'assets/images/undraw_departing_re_mlq3.png',
    title: 'make connects with travello',
    subTitle: 'To your dream trip',
  ),

];