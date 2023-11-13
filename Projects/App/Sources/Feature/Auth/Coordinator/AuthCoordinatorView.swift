import ComposableArchitecture
import SwiftUI
import TCACoordinators

public struct AuthCoordinatorView: View {
    private let store: StoreOf<AuthCoordinator>
    
    public init(store: StoreOf<AuthCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .setInViteCode:
                    CaseLet(/AuthScreen.State.setInViteCode, action: AuthScreen.Action.setInViteCode, then: InViteCodeView.init)
                case .setOnBoarding:
                    CaseLet(/AuthScreen.State.setOnBoarding, action: AuthScreen.Action.setOnBoarding, then: OnBoardingView.init)
                case .setTogether:
                    CaseLet(/AuthScreen.State.setTogether, action: AuthScreen.Action.setTogether, then: TogetherView.init)
                case .setRegist:
                    CaseLet(/AuthScreen.State.setRegist, action: AuthScreen.Action.setRegist, then: RegistView.init)
//                case .setPinNumber:
//                    CaseLet(/AuthScreen.State.setPinNumber, action: AuthScreen.Action.setPinNumber, then: PinNumberView.init)
                }
            }
        }
    }
}
