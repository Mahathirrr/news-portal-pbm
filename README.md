# News Portal

A Flutter-based mobile application for browsing news articles, developed as a mid-term project for the Mobile-Based Programming course at Universitas Syiah Kuala.

## Project Details

- **Author**: Muhammad Mahathir
- **NPM**: 2208107010056
- **Course**: Pemrograman Berbasis Mobile
- **Institution**: Jurusan Informatika, Universitas Syiah Kuala

## Overview

The **News Portal** application allows users to browse news articles from various categories, view detailed articles, authenticate via login or registration, and manage their profile. Built with Flutter, the app integrates with NewsAPI for real-time news data and uses a custom API for user authentication. The project demonstrates core mobile programming concepts, including API integration, state management, and responsive UI design.

## Features

- **News Browsing**: View a list of top news articles with images, titles, and dates.
- **Category Selection**: Filter news by categories such as business, technology, and entertainment.
- **Article Details**: Access detailed news articles with a return-to-home button.
- **User Authentication**: Login and registration functionality with data stored using Shared Preferences.
- **Profile Management**: Display user information or prompt for login/registration.
- **Responsive Navigation**: Curved bottom navigation bar for seamless page transitions.

## Getting Started

### Prerequisites

- **Flutter SDK**: Install Flutter (version 3.0 or higher). Follow the [official guide](https://docs.flutter.dev/get-started/install).
- **Dart**: Included with Flutter.
- **IDE**: Visual Studio Code or Android Studio recommended.
- **Emulator/Device**: Android emulator or physical device for testing.
- **NewsAPI Key**: Sign up at [NewsAPI](https://newsapi.org/) to obtain an API key.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Mahathirrr/news-portal-pbm.git
   cd news-portal-pbm
   ```

2. **Install Dependencies**:
   Run the following command to install required packages:
   ```bash
   flutter pub get
   ```

3. **Configure NewsAPI Key**:
   - Open `lib/home.dart` and `lib/kategori.dart`.
   - Replace `YOUR_NEWS_API_KEY` with your actual NewsAPI key:
     ```dart
     const apiKey = 'your_actual_api_key_here';
     ```

4. **Run the Application**:
   Connect an emulator or device and run:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/main.dart`: Entry point and navigation setup with CurvedNavigationBar.
- `lib/home.dart`: Displays a list of news articles.
- `lib/kategori.dart`: Allows category-based news filtering.
- `lib/detail.dart`: Shows detailed news articles.
- `lib/formlogin.dart`: Handles user login.
- `lib/formregist.dart`: Handles user registration.
- `lib/profil.dart`: Manages user profile and authentication state.

## Dependencies

- `curved_navigation_bar: ^1.0.3`
- `http: ^1.2.2`
- `shared_preferences: ^2.2.3`
- `fluttertoast: ^8.2.8`

Defined in `pubspec.yaml`.

## Usage

1. **Launch the App**: Start the app to access the Home page with top news articles.
2. **Navigate**: Use the bottom navigation bar to switch between Categories, Home, and Profile.
3. **Browse News**: Select a category or click an article to view details.
4. **Authenticate**: Go to the Profile page to log in or register.
5. **Log Out**: Log out from the Profile page to clear user data.

## Screenshots

*(Add screenshots of the app here, e.g., home page, category page, etc. Place images in a `screenshots` folder and reference them like this:)*

![Home Page](screenshots/screenshot_home.png)
![Category Page](screenshots/screenshot_category.png)

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure your code follows Flutter best practices.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter Team for the robust framework.
- NewsAPI for providing news data.
- Universitas Syiah Kuala for the learning opportunity.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [NewsAPI Documentation](https://newsapi.org/docs)

For further assistance, contact the repository owner or open an issue.