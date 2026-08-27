import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../Core/Utils/AppImages.dart';
import 'ads_states.dart';

@injectable
class AdsViewModel extends Cubit<AdsStates> {
  AdsViewModel() : super(AdsInitialState());

  List<String> imagesList = [
    Appimages.Offer1,
    Appimages.Offer2,
    Appimages.Offer3,
  ];
}
