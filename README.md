
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

## Screenshots
![0-02-03-5d1965b11f2f1b0cac6d2b5caad119ec3a19b1ef78c531b53a702cf8339a7d39_4f56832b228aefda](https://github.com/user-attachments/assets/7c8a3c5b-dccb-![0-02-03-002ca6c48b9abd59e316f4b41a77785d77da4351e9f018d5aba0d2c06a00dd5b_6b113beced6b8794](https://github.com/user-attachments/assets/631f10dc-b9db-4a98-86c6-451bc0cfb702)
4![0-02-03-4dc2801b4d3babf86cd91d51a8bc4ca7028b82f6f3288ef55129ffca965d6e63_1a192d5b9d2abeb4](https://github.com/user-attachments/assets/0dc4a2c5-e41b-4476-bb24-0c394c771e60)
eac-8dfc-1f854412b88e)





