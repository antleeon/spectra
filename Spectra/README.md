# Spectra

Spectra is a client-server application designed for discovering and announcing local creative events hosted by independent artists. The app provides a user-friendly interface for users to explore events, manage their profiles, and interact with other users.

## Features

- **Home Feed**: A main feed displaying event cards with filter options for date, genre, and location.
- **Event Details**: Detailed information about each event, including title, location, date, description, and options to RSVP or comment.
- **Map View**: A map interface showing nearby events with search and filter capabilities.
- **User Profile**: Displays user information, upcoming events, and options to edit or share profiles.
- **Organization Profile**: Similar to user profiles but for organizations hosting events.
- **Edit Profile**: A screen for users to update their profile information and avatar.
- **Favorites**: A collection of saved events displayed in a similar format to the home feed.
- **Comments**: A section for users to view and add comments on events.
- **Add Event**: A form for users to create and publish new events.
- **Login**: A login screen for user authentication.

## Architecture

The application follows a modular architecture using VIPER (View, Interactor, Presenter, Entity, Router) for better separation of concerns and maintainability. Each module is responsible for its own functionality, making it easier to manage and scale the application.

## Design

The UI design is created in Figma. Assets and components can be exported in formats compatible with Xcode, such as PNG or PDF for images. For SwiftUI components, tools like Figma to SwiftUI can be utilized to convert designs directly into SwiftUI code.

## SVG Integration

The app's logo is provided in SVG format. To integrate the SVG logo on the login screen, the `UIImage+SVG` extension is used to load and display the SVG file in an `UIImageView` or a SwiftUI `Image` view, ensuring high-quality rendering.

## Installation

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the application on a simulator or device.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.