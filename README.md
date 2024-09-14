

# Digestify

**Digestify** is a Flutter-based news app that fetches news articles using The Guardian API. The app allows users to explore, filter, and read news articles across various categories and topics.

## Features

- Display the latest news articles from The Guardian.
- Get the headlines and most viewed news.
- Filter news by sections and tags.
- Save favorite articles to revisit later.
- Dynamic theme support (light/dark mode).

## Requirements

Before you can run this project, ensure you have the following:

- Flutter SDK installed
- An API key from The Guardian

## Getting Started

### Step 1: Clone the Repository

```bash
git clone https://github.com/OmarAbdelmawgoud5/Digestify.git
cd Digestify
```

### Step 2: Install Dependencies

Install all the required dependencies using the command:

```bash
flutter pub get
```

### Step 3: Get Your API Key

1. Visit [The Guardian API](https://open-platform.theguardian.com/) and sign up for a developer account.
2. Create a new project and generate your API key.

### Step 4: Update the API Key

Navigate to the file `lib/Services/url_to_get.dart` and replace the `apiKey` variable with your own API key.

```dart
final String apiKey = 'your-api-key-here';
```

### Step 5: Run the App

Once the API key is set, you can run the app using:

```bash
flutter run
```

## Contributing

Contributions are welcome! Feel free to open a pull request or raise issues for bug fixes or new features.

## License

This project is licensed under the MIT License.


