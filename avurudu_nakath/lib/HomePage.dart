import 'package:flutter/material.dart';

import 'data/data.dart'; // Ensure this file contains `dataList`
import 'homePageContainer01.dart';
import 'homePageContainer02.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _scrollProgress = 0.0;

  final double _titleHeight = 160.0;
  final double _container02Height = 130.0;
  final double _topPadding = 50.0;
  final double _scrollThreshold = 50.0;
  final double _maxTransitionOffset = 150.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double rawProgress =
        (_scrollController.offset - _scrollThreshold) /
        (_maxTransitionOffset - _scrollThreshold);
    double progress = rawProgress.clamp(0.0, 1.0);

    bool isNowScrolled = _scrollController.offset > _scrollThreshold;

    if (isNowScrolled != _isScrolled || progress != _scrollProgress) {
      setState(() {
        _isScrolled = isNowScrolled;
        _scrollProgress = progress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFBE45),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: _titleHeight)),

              SliverToBoxAdapter(
                child: Opacity(
                  opacity: 1.0 - _scrollProgress,
                  child: Transform.translate(
                    offset: Offset(0, -50 * _scrollProgress),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: HomePageContainer01(),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/lineArt.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image Not Found',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      children: List.generate(
                        dataList.length,
                        (index) => Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFFF1D6),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataList[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'UNIndeewaree',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                dataList[index].description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'UNGanganee',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

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

          Positioned(
            top: _topPadding,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: _scrollProgress,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Transform.translate(
                  offset: Offset(0, (1.0 - _scrollProgress) * 30),
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
