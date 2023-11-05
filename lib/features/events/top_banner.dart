import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({super.key});
  @override
  State<TopBanner> createState() {
    return _TopBannerState();
  }
}

class _TopBannerState extends State<TopBanner> with SingleTickerProviderStateMixin {
  //declare the variables
  late AnimationController _animationController;
  // late Animation<double> _nextPage;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    //Start at the controller and set the time to switch pages
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    // _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        const int page = 3; //Number of pages in your PageView
        if (_currentPage < page - 1) {
          _currentPage++;
          _pageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 1500), curve: Curves.easeOutExpo);
        } else {
          _currentPage = 0;
          _pageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 600), curve: Curves.easeOut);
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List _banner = [
    'assets/images/banner3.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: _banner.length,
            onPageChanged: (value) {
              _animationController.forward();
            },
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(_banner[index]),
                    )),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
            controller: _pageController,
            count: _banner.length,
            effect:
                const ExpandingDotsEffect(dotHeight: 4, dotWidth: 4, activeDotColor: Colors.black))
      ],
    );
  }
}
