
abstract class AfkState {}
class InitialState extends AfkState{}


class OnLoadingLoginState extends AfkState{}
class OnSuccessLoginState extends AfkState{}
class OnErrorLoginState extends AfkState{}

class OnLoadingGetDataState extends AfkState{}
class OnSuccessGetDataState extends AfkState{}
class OnErrorGetDataState extends AfkState{}

class OnChangeCustomerTypeState extends AfkState{}
class OnChangePaymentTypeState extends AfkState{}
class OnChangeStoreState extends AfkState{}

class OnCounterPlusState extends AfkState{}
class OnCounterMinusState extends AfkState{}


class OnLoadingAddPaymentState extends AfkState{}
class OnSuccessAddPaymentState extends AfkState{}
class OnErrorAddPaymentState extends AfkState{}
