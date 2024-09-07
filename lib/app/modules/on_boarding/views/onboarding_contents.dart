class OnboardingContents {
  final String title;
  final String image;
  final String desc;
  final Function() onTap;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
    required this.onTap,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Who We Are",
    image: "assets/images/image1.png",
    desc: "Sheba Innovation, a subsidiary of Sheba Group, stands as a pioneer in Bangladesh's technological revolution, proudly serving the nation for over 30 years",
    onTap: (){}
  ),
  OnboardingContents(
    title: "Our Solutions",
    image: "assets/images/image2.png",
    onTap: (){},
    desc:
        "Our technology solutions are meticulously crafted to align with the evolving landscape of technological advancements.",),

  OnboardingContents(
    title: "Shikkha Sheba",
    image: "assets/images/image3.png",
    onTap: (){
    print('tapped');
    },
    desc:
        "Shikkha Sheba, an ongoing initiative by SIL, a next-generation online learning platform, envisions providing learners with a cutting-edge and futuristic learning experience.",
  ),
];
