import '../../../../app/theme/app_assets.dart';
import '../../../../utilities/base_controller.dart';
import '../states/onboarding_state.dart';
import '../viewmodels/onboarding.dart';

class OnboadingController extends BaseController<OnboardingState> {
  OnboadingController() : super(OnboardingInitial());

  @override
  void init() {
    emit(OnboardingLoading());

    final sliders = [
      OnBoardingViewModel(
        text: '',
        imagePath: AppAssets.onboardingImage1,
      ),
      OnBoardingViewModel(
        text: 'Aqui você pode cadastrar animais desaparecidos',
        imagePath: AppAssets.onboardingImage2,
      ),
      OnBoardingViewModel(
        text: 'Cadastrar abrigos de animais desaparecidos',
        imagePath: AppAssets.onboardingImage3,
      ),
      OnBoardingViewModel(
        text: 'E localizar animais desaparecidos pelo microchip ou biometria facial',
        imagePath: AppAssets.onboardingImage4,
      ),
    ];

    emit(OnboardingLoaded(sliders: sliders));
  }

  void onChangeIndex(int index) {
    final oldState = currentState;
    if (oldState is OnboardingLoaded) {
      final state = oldState;
      emit(state.copyWith(currentIndex: index));
    }
  }
}
