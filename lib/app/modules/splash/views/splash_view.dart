import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('🟢 SplashView dibuka');
    print('📦 Mengakses controller: $controller'); // ⬅️ Ini wajib agar controller aktif

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: AnimatedSplashBody(),
    );
  }
}

class AnimatedSplashBody extends StatefulWidget {
  @override
  _AnimatedSplashBodyState createState() => _AnimatedSplashBodyState();
}

class _AnimatedSplashBodyState extends State<AnimatedSplashBody>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _loadingController;
  
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _titleSlideAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<double> _subtitleSlideAnimation;
  late Animation<double> _subtitleFadeAnimation;
  late Animation<double> _loadingFadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize controllers
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    // Logo animations
    _logoScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));
    
    _logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
    ));
    
    // Title animations
    _titleSlideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
    ));
    
    _titleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    ));
    
    // Subtitle animations
    _subtitleSlideAnimation = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
    ));
    
    _subtitleFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    ));
    
    // Loading animation
    _loadingFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _loadingController,
      curve: Curves.easeInOut,
    ));
    
    // Start animations
    _startAnimations();
  }
  
  void _startAnimations() async {
    // Delay awal sebelum logo muncul
    await Future.delayed(const Duration(milliseconds: 300));
    _logoController.forward();
    
    // Delay sebelum text muncul
    await Future.delayed(const Duration(milliseconds: 600));
    _textController.forward();
    
    // Delay sebelum loading indicator muncul
    await Future.delayed(const Duration(milliseconds: 1000));
    _loadingController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Logo with scale and fade
          AnimatedBuilder(
            animation: _logoController,
            builder: (context, child) {
              return Transform.scale(
                scale: _logoScaleAnimation.value,
                child: Opacity(
                  opacity: _logoFadeAnimation.value,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          
          
          // Animated Main Title with slide and fade
          AnimatedBuilder(
            animation: _textController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _titleSlideAnimation.value),
                child: Opacity(
                  opacity: _titleFadeAnimation.value,
                  child: const Text(
                    'EduMind',
                    style: TextStyle(
                      color: const Color(0xFF2A6352),
                      fontSize: 42,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              );
            },
          ),
          
          const SizedBox(height: 4),
          
          // Animated Subtitle with delayed slide and fade
          AnimatedBuilder(
            animation: _textController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _subtitleSlideAnimation.value),
                child: Opacity(
                  opacity: _subtitleFadeAnimation.value,
                  child: const Text(
                    'Counseling Center',
                    style: TextStyle(
                      color: Color(0xFF64B6AC),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Animated Loading Indicator
          const SizedBox(height: 40),
          AnimatedBuilder(
            animation: _loadingController,
            builder: (context, child) {
              return Opacity(
                opacity: _loadingFadeAnimation.value,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}