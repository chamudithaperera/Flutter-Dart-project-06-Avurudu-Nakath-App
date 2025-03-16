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

  // Define heights for proper spacing calculations
  final double _titleHeight = 160.0; // Height of the title section
  final double _container02Height = 130.0; // Height of HomePageContainer02
  final double _topPadding =
      50.0; // Fixed top padding for HomePageContainer02 when scrolled

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
    // Define scroll threshold (when to switch containers)
    const scrollThreshold = 50.0;

    if (_scrollController.offset > scrollThreshold && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= scrollThreshold && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }

    // Limit scrolling - prevent scrolling past the fixed container
    if (_isScrolled) {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      double minScrollExtent = _topPadding + _container02Height;

      if (_scrollController.offset < 0) {
        _scrollController.jumpTo(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFBE45),
      body: Stack(
        children: [
          // Main scrollable content with a scroll boundary
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              // This prevents scrolling beyond the bottom of HomePageContainer02
              if (_isScrolled &&
                  scrollNotification is ScrollUpdateNotification) {
                if (_scrollController.offset <
                    _topPadding + _container02Height - _titleHeight) {
                  // If trying to scroll past the boundary, force it to stay at the boundary
                  _scrollController.jumpTo(
                    _topPadding + _container02Height - _titleHeight,
                  );
                  return true; // Consume the notification
                }
              }
              return false; // Let other notifications through
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Spacer for the main title when not scrolled
                SliverToBoxAdapter(child: SizedBox(height: _titleHeight)),

                // Only show HomePageContainer01 when not scrolled
                if (!_isScrolled)
                  SliverToBoxAdapter(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: HomePageContainer01(),
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
                        color: const Color(0xfff88fff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Fixed positioned title that fades out when scrolling
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isScrolled ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 300),
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

          // Fixed HomePageContainer02 when scrolled
          Positioned(
            top: _topPadding, // Fixed 50px from top as requested
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isScrolled ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Visibility(
                visible: _isScrolled,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: HomePageContainer02(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
