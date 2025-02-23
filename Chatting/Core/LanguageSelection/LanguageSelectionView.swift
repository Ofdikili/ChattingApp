
import SwiftUI
struct LanguageSelectionView: View {
    @ObservedObject var viewModel = LanguageViewModel()

    var body: some View {
        VStack {
            Text("Selected Language: \(viewModel.selectedLanguage.rawValue)")
                .font(.headline)
                .padding()

            List(viewModel.availableLanguages, id: \.self) { language in
                HStack {
                    Text(Locale.current.localizedString(forLanguageCode: language.rawValue) ?? language.rawValue)
                    Spacer()
                    if language == viewModel.selectedLanguage {
                        Image(systemName: "checkmark.circle.fill") // ✅ Seçili dili göster
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle()) // ✅ Daha kolay tıklanabilir hale getir
                .onTapGesture {
                    viewModel.changeLanguage(to: language) // ✅ Kullanıcı tıkladığında dili değiştir
                }
            }
        }
    }
}
