import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshave/views/utils/helper.dart';
import 'introduction2_screen.dart';

class Introduction1Screen extends StatefulWidget {
  const Introduction1Screen({super.key});

  @override
  State<Introduction1Screen> createState() => _Introduction1ScreenState();
}

class _Introduction1ScreenState extends State<Introduction1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  int currentDotIndex = 0;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut);

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _goToNext() async {
    await _fadeController.reverse();
    Navigator.of(context).push(_createFadeRoute(const Introduction2Screen()));
  }

  void _goToSkip() async {
    await _fadeController.reverse();
    Navigator.of(context).pushReplacementNamed('/intro3');
  }

  Route _createFadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/img/img intro 1.png',
                        height: screenHeight(context) * 0.4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "The World at Your Fingertips",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: cPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: cTextBlue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(3, (index) {
                  return AnimatedDot(isActive: index == currentDotIndex);
                }),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _goToSkip,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cLinear,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          'Skip',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _goToNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedDot extends StatelessWidget {
  final bool isActive;

  const AnimatedDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      width: isActive ? 24 : 12,
      height: 12,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isActive ? cPrimary : cLinear,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
