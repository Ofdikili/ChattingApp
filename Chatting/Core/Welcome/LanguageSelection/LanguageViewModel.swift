import SwiftUI

class LanguageViewModel: ObservableObject {
    @AppStorage("selectedLanguage") private var storedLanguage: String = LanguageType.english.rawValue
    @Published var selectedLanguage: LanguageType
    @Published var availableLanguages: [LanguageType] = []

    init() {
        let savedLanguage = LanguageType(rawValue: UserDefaults.standard.string(forKey: "selectedLanguage") ?? LanguageType.english.rawValue) ?? .english
        self.selectedLanguage = savedLanguage
        self.availableLanguages = Bundle.main.localizations
            .compactMap { LanguageType(rawValue: $0) }

        // ✅ Uygulama başlatıldığında dili uygula
        applyLanguage(selectedLanguage)
    }

    /// Kullanıcının seçtiği dili değiştirir, saklar ve uygular
    func changeLanguage(to language: LanguageType) {
        selectedLanguage = language
        storedLanguage = language.rawValue
        applyLanguage(language)
    }

    /// 📌 Uygulamanın dilini değiştiren fonksiyon
    private func applyLanguage(_ language: LanguageType) {
        UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

        // UIKit desteği için dil dosyalarını değiştir
        if let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            Bundle.main.setValue(bundle, forKey: "bundle")
        }

        // UI güncellenmesi için bildir
        objectWillChange.send()
    }
}
