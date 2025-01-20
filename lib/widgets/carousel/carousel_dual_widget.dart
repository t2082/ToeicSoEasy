import 'package:flutter/material.dart';

class CarouselDualWidget extends StatefulWidget {
  final List<Widget> firstChildren;
  final List<Widget> secondChildren;
  final double firstHeight;
  final double secondHeight;
  final double spacing;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final bool autoPlay;
  final bool showIndicator;
  final bool isConnectChildren;
  final Color indicatorColor;
  final Color activeIndicatorColor;

  CarouselDualWidget({
    super.key,
    required this.firstChildren,
    required this.secondChildren,
    this.firstHeight = 200.0,
    this.secondHeight = 200.0,
    this.spacing = 0.0,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),
    this.autoPlay = true,
    this.showIndicator = true,
    this.isConnectChildren = true,
    this.indicatorColor = Colors.grey,
    this.activeIndicatorColor = Colors.blue,
  }) {
    if (firstChildren.length != secondChildren.length) {
      throw ArgumentError(
        'On CarouselDualWidget, the number of firstChildren and secondChildren must be the same.',
      );
    }
  }

  @override
  // ignore: library_private_types_in_public_api
  _CarouselDualWidgetState createState() => _CarouselDualWidgetState();
}

class _CarouselDualWidgetState extends State<CarouselDualWidget> {
  late PageController _firstPageController;
  late PageController _secondPageController;
  int _currentFirstPage = 0;

  @override
  void initState() {
    super.initState();
    _firstPageController = PageController();
    _secondPageController = PageController();

    if (widget.isConnectChildren) {
      _firstPageController.addListener(() {
        if (_secondPageController.page != _firstPageController.page) {
          _secondPageController.jumpTo(_firstPageController.position.pixels);
        }
      });

      // _secondPageController.addListener(() {
      //   if (_isFirstPageViewScrolling) {
      //     if (_secondPageController.page != _firstPageController.page) {
      //       _firstPageController.jumpTo(_secondPageController.position.pixels);
      //     }
      //   }
      // });
    }

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    Future.delayed(widget.autoPlayInterval).then((_) {
      if (mounted && widget.autoPlay) {
        if (_currentFirstPage < widget.firstChildren.length - 1) {
          _currentFirstPage++;
        } else {
          _currentFirstPage = 0;
        }

        _firstPageController.animateToPage(
          _currentFirstPage,
          duration: widget.animationDuration,
          curve: Curves.easeInOut,
        );

        if (widget.isConnectChildren) {}

        _startAutoPlay();
      }
    });
  }

  @override
  void dispose() {
    _firstPageController.dispose();
    _secondPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: widget.spacing,
      children: [
        SizedBox(
          height: widget.firstHeight,
          child: PageView.builder(
            controller: _firstPageController,
            onPageChanged: (index) {
              setState(() {
                _currentFirstPage = index;
              });
            },
            itemCount: widget.firstChildren.length,
            itemBuilder: (context, index) {
              return widget.firstChildren[index];
            },
          ),
        ),
        if (widget.showIndicator) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.firstChildren.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentFirstPage == index
                      ? widget.activeIndicatorColor
                      : widget.indicatorColor,
                ),
              ),
            ),
          ),
        ],
        SizedBox(
          height: widget.secondHeight,
          child: PageView.builder(
            controller: _secondPageController,
            onPageChanged: (index) {
              setState(() {
                _currentFirstPage = index;
              });
            },
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.secondChildren.length,
            itemBuilder: (context, index) {
              return widget.secondChildren[index];
            },
          ),
        ),
      ],
    );
  }
}
