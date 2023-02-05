import SwiftUI
import ScalingHeaderScrollView

struct ContentView: View {
    var body: some View {
        LoginScreen(viewModel: LoginScreenViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
