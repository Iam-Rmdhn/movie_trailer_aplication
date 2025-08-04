import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/auth/auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Setup fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));

    // Setup scale animation
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    // Start animations
    _animationController.forward();

    // Navigate to main app after animation
    _navigateToMainApp();
  }

  void _navigateToMainApp() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AuthGate(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1024;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    const Color(0xFF1a1a1a),
                    const Color(0xFF121212),
                    const Color(0xFF000000),
                  ]
                : [
                    const Color(0xFFFFFFFF),
                    const Color(0xFFF8F9FA),
                    const Color(0xFFF0F0F0),
                  ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop
                          ? size.width * 0.2
                          : isTablet
                              ? size.width * 0.1
                              : 24.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // App Logo with Animation
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: FadeTransition(
                                opacity: _fadeAnimation,
                                child: Container(
                                  width: isDesktop
                                      ? 150
                                      : isTablet
                                          ? 140
                                          : size.width * 0.25,
                                  height: isDesktop
                                      ? 150
                                      : isTablet
                                          ? 140
                                          : size.width * 0.25,
                                  padding: EdgeInsets.all(
                                    isDesktop
                                        ? 25
                                        : isTablet
                                            ? 22
                                            : 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.black.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(
                                      isDesktop
                                          ? 35
                                          : isTablet
                                              ? 32
                                              : 30,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: isDark
                                            ? Colors.white.withOpacity(0.1)
                                            : Colors.black.withOpacity(0.1),
                                        blurRadius: isDesktop ? 25 : 20,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/images/app_logo_png.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(
                            height: isDesktop
                                ? 50
                                : isTablet
                                    ? 45
                                    : 40),

                        // Lottie Animation
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Container(
                                  width: isDesktop
                                      ? 300
                                      : isTablet
                                          ? 250
                                          : size.width * 0.5,
                                  height: isDesktop
                                      ? 300
                                      : isTablet
                                          ? 250
                                          : size.width * 0.5,
                                  constraints: const BoxConstraints(
                                    maxWidth: 350,
                                    maxHeight: 350,
                                    minWidth: 150,
                                    minHeight: 150,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      isDesktop
                                          ? 25
                                          : isTablet
                                              ? 22
                                              : 20,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: isDesktop ? 20 : 15,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Lottie.asset(
                                    'assets/animations/popcorn.json',
                                    fit: BoxFit.contain,
                                    repeat: true,
                                    animate: true,
                                    errorBuilder: (context, error, stackTrace) {
                                      // Fallback to backup animation if main file fails
                                      return Lottie.asset(
                                        'assets/animations/popcorn_backup.json',
                                        fit: BoxFit.contain,
                                        repeat: true,
                                        animate: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          // Final fallback to icon
                                          return Icon(
                                            Icons.movie,
                                            size: isDesktop
                                                ? 120
                                                : isTablet
                                                    ? 100
                                                    : 80,
                                            color: Colors.orange,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(
                            height: isDesktop
                                ? 50
                                : isTablet
                                    ? 45
                                    : 40),

                        // App Title with Animation
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: Transform.translate(
                                offset:
                                    Offset(0, 20 * (1 - _fadeAnimation.value)),
                                child: Column(
                                  children: [
                                    Text(
                                      'Movie App',
                                      style: theme.textTheme.headlineMedium
                                          ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black87,
                                        letterSpacing: 1.5,
                                        fontSize: isDesktop
                                            ? 36
                                            : isTablet
                                                ? 32
                                                : size.width < 350
                                                    ? 24
                                                    : 28,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                        height: isDesktop
                                            ? 12
                                            : isTablet
                                                ? 10
                                                : 8),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isDesktop
                                            ? 40
                                            : isTablet
                                                ? 30
                                                : 20,
                                      ),
                                      child: Text(
                                        'Discover Amazing Movies',
                                        style:
                                            theme.textTheme.bodyLarge?.copyWith(
                                          color: isDark
                                              ? Colors.white70
                                              : Colors.black54,
                                          letterSpacing: 0.5,
                                          fontSize: isDesktop
                                              ? 20
                                              : isTablet
                                                  ? 18
                                                  : size.width < 350
                                                      ? 14
                                                      : 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(
                            height: isDesktop
                                ? 80
                                : isTablet
                                    ? 70
                                    : 60),

                        // Loading Indicator
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: isDesktop
                                        ? 50
                                        : isTablet
                                            ? 45
                                            : 40,
                                    height: isDesktop
                                        ? 50
                                        : isTablet
                                            ? 45
                                            : 40,
                                    child: CircularProgressIndicator(
                                      strokeWidth: isDesktop
                                          ? 4
                                          : isTablet
                                              ? 3.5
                                              : 3,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        isDark
                                            ? Colors.white70
                                            : Colors.black54,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: isDesktop
                                          ? 20
                                          : isTablet
                                              ? 18
                                              : 16),
                                  Text(
                                    'Loading...',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.black54,
                                      letterSpacing: 0.5,
                                      fontSize: isDesktop
                                          ? 18
                                          : isTablet
                                              ? 16
                                              : size.width < 350
                                                  ? 12
                                                  : 14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        // Extra bottom padding for very small screens
                        SizedBox(height: size.height < 600 ? 20 : 0),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
