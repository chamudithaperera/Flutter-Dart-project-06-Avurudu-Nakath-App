import 'package:flutter/material.dart';

import 'homePageContainer01.dart';
import 'homePageContainer02.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a scroll controller to detect scrolling
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _scrollProgress = 0.0; // Track scroll progress for animations

  // Define heights for proper spacing calculations
  final double _titleHeight = 160.0; // Height of the title section
  final double _container02Height = 130.0; // Height of HomePageContainer02
  final double _topPadding =
      50.0; // Fixed top padding for HomePageContainer02 when scrolled

  // Scroll thresholds for transitions
  final double _scrollThreshold = 50.0; // When to start transition
  final double _maxTransitionOffset = 150.0; // When transition completes

  @override
  void initState() {
    super.initState();

    // Add listener to detect when scroll position changes
    _scrollController.addListener(_scrollListener);
  }

  // Clean up the controller when the widget is disposed
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Listener for scroll events
  void _scrollListener() {
    // Calculate scroll progress for smooth transitions
    double rawProgress =
        (_scrollController.offset - _scrollThreshold) /
        (_maxTransitionOffset - _scrollThreshold);
    double progress = rawProgress.clamp(0.0, 1.0);

    // Determine if we're in "scrolled" state
    bool isNowScrolled = _scrollController.offset > _scrollThreshold;

    // Update state only if there's a change to avoid unnecessary rebuilds
    if (isNowScrolled != _isScrolled || progress != _scrollProgress) {
      setState(() {
        _isScrolled = isNowScrolled;
        _scrollProgress = progress;
      });
    }

    // Limit scrolling to prevent content from moving past HomePageContainer02
    if (_isScrolled && _scrollProgress >= 1.0) {
      if (_scrollController.offset <
          _topPadding + _container02Height - _titleHeight) {
        _scrollController.jumpTo(
          _topPadding + _container02Height - _titleHeight,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFBE45),
      body: Stack(
        children: [
          // Main scrollable content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Spacer for the main title when not scrolled
              SliverToBoxAdapter(child: SizedBox(height: _titleHeight)),

              // HomePageContainer01 that moves up while scrolling
              SliverToBoxAdapter(
                child: Opacity(
                  opacity: 1.0 - _scrollProgress,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      -50 * _scrollProgress,
                    ), // Move up while scrolling
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: HomePageContainer01(),
                    ),
                  ),
                ),
              ),

              // Your remaining content - just the one container
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 1000,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Fixed positioned title that fades out when scrolling
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 1.0 - _scrollProgress,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 70, 10, 20),
                child: Text(
                  'සුභ අළුත් අවුරුද්දක් වේවා',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'UNDisapamok',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // HomePageContainer02 that fades in when scrolling
          Positioned(
            top: _topPadding,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: _scrollProgress,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Transform.translate(
                  offset: Offset(
                    0,
                    (1.0 - _scrollProgress) * 30,
                  ), // Slide in from bottom
                  child: const HomePageContainer02(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
