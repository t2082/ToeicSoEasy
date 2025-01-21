import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final bool autoPlay;
  final bool showIndicator;
  final Color indicatorColor;
  final Color activeIndicatorColor;

  const CarouselWidget({
    super.key,
    required this.children,
    this.height = 200.0,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),
    this.autoPlay = true,
    this.showIndicator = true,
    this.indicatorColor = Colors.grey,
    this.activeIndicatorColor = Colors.blue,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    Future.delayed(widget.autoPlayInterval).then((_) {
      if (mounted && widget.autoPlay) {
        if (_currentPage < widget.children.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: widget.animationDuration,
          curve: Curves.easeInOut,
        );

        _startAutoPlay();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              return widget.children[index];
            },
          ),
        ),
        if (widget.showIndicator) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.children.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? widget.activeIndicatorColor
                      : widget.indicatorColor,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
