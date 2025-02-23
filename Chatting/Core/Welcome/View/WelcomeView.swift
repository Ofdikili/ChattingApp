import SwiftUI

struct WelcomeView: View {
    @State var showLanguageSheet = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer().frame(height: 30)
                buildWelcomeImage(geometry: geometry)
                welcomeAppMessage
                privacyAndPolicyView.padding(.top, 16)
                languageButton.padding(.top, 8)
                Spacer()
                agreeAndContinueButton.padding(.bottom, 8)
            }
            .padding()
        }.sheet(isPresented: $showLanguageSheet) {
            LanguageSelectionView() .presentationDetents([.medium])
                .presentationDragIndicator(.visible) 

    }
    }
}

extension WelcomeView {
    func buildWelcomeImage(geometry: GeometryProxy) -> some View {
        Image("welcome_image")
            .resizable()
            .frame(width: geometry.size.width - 80,
                   height: geometry.size.width - 60)
    }
    
    var welcomeAppMessage: some View {
        Text(LocalizedStringKey("welcome_message"))
            .font(.title2)
            .fontWeight(.bold)
    }
    
    var privacyAndPolicyView: some View {
        Text(LocalizedStringKey("terms_of_service"))
            .bold()
            .foregroundColor(.blue) +
        Text(LocalizedStringKey("accept_terms"))
    }
    
    var languageButton: some View {
        Capsule()
            .fill(Color(.systemGray5))
            .frame(width: 160, height: 40).onTapGesture {
                showLanguageSheet.toggle()
            }
            .overlay(
                HStack {
                    Image(systemName: "globe")
                    Spacer()
                    Text(LocalizedStringKey("language_selection"))
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding(.horizontal)
                .foregroundStyle(Color(.darkGray))
            )
            
    }
    
    var agreeAndContinueButton: some View {
        Button(action: {}, label: {
            Text(LocalizedStringKey("agree_and_continue")) 
        })
        .frame(width: 300, height: 50)
        .background(Color(.darkGray))
        .foregroundStyle(.white)
        .clipShape(.capsule)
    }
}

#Preview {
    WelcomeView()
}
