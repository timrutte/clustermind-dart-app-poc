
# Clustermind Flutter Application Proof of Concept

This project is a simple Flutter application that demonstrates storing and retrieving data via an API. 
It provides frontend functionality for the Clustermind Go backend application, available at: [Clustermind Go API POC](https://github.com/timrutte/clustermind-go-api-poc).

## Getting Started

To run this project on your local machine, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/timrutte/clustermind-dart-app-poc.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd clustermind-dart-app-poc
   ```

3. **Install dependencies**:  
   Ensure you have [Flutter](https://flutter.dev/docs/get-started/install) installed. Then, run:
   ```bash
   flutter pub get
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

## Project Structure

The project follows the standard Flutter directory layout:

- **`lib/`**: Contains the Dart source code.
- **`test/`**: Contains test files.
- **Platform-specific directories**:
  - **`android/`**: Android-specific configurations.
  - **`ios/`**: iOS-specific configurations.
  - **`web/`**: Web-specific configurations.
  - **`linux/`**, **`macos/`**, **`windows/`**: Desktop-specific configurations.

## Dependencies

The project uses the following dependencies, as specified in `pubspec.yaml`:

- **`flutter`**: The Flutter framework.
- **`cupertino_icons`**: Icons for iOS style.

For a complete list of dependencies, refer to the `pubspec.yaml` file.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For questions or suggestions, please open an issue in this repository.
