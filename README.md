
#  Flutter App  

## Overview

TechJar is a Flutter application designed to display a list of users fetched from an external API (JSONPlaceholder). For each user, you can view their posts, albums, and photos. The app uses the BLoC (Business Logic Component) pattern for state management to ensure a scalable and maintainable codebase.

## Features

- Display a list of users.
- View posts, albums, and photos for each user.
- Navigate between the list of users and detailed views for posts, albums, and photos.
- Add comments to posts.

## Dependencies

- [Flutter](https://flutter.dev)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- 
## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/Elishakarki/techjar.git
   cd techjar

## Install

To  Install the dependencies

```bash
  flutter pub get

```

## Run
 To run the app
 ```bash
  flutter  run
```

## API Endpoints
The app fetches data from the JSONPlaceholder API:

Users: https://jsonplaceholder.typicode.com/users
User Posts: https://jsonplaceholder.typicode.com/users/{user_id}/posts
User Albums: https://jsonplaceholder.typicode.com/users/{user_id}/albums
Album Photos: https://jsonplaceholder.typicode.com/albums/{album_id}/photos


## Directories
lib/blocs: Contains BLoC classes for managing state.

lib/models: Contains model classes representing data structures.

lib/ui: Contains UI components and screens.

lib/repositories: Contains classes responsible for making API calls.


## State Management
The app uses the BLoC pattern for state management. Each feature has its own BLoC to handle state transitions:


PostBloc: Manages the state of posts and comments data.
