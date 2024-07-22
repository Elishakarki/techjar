
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
when posts are not available 
![0-02-03-feef9889c659afc3c6e076a7fab71d1b5d5fa74ce7454d7121afc508451a093e_1609736ee0600e7](https://github.com/user-attachments/assets/10e581fd-9195-4b51-8bbb-e4b60bd04344)

comment adding page
![0-02-03-5d1965b11f2f1b0cac6d2b5caad119ec3a19b1ef78c531b53a702cf8339a7d39_4f56832b228aefda](https://github.com/user-attachments/assets/230e76d2-fffa-49e0-bb3f-b54996e1d00c)
 comment loading Page
![0-02-03-4dc2801b4d3babf86cd91d51a8bc4ca7028b82f6f3288ef55129ffca965d6e63_1a192d5b9d2abeb4](https://github.com/user-attachments/assets/5beb0e15-3f84-4283-a445-df769d1196c6)
post available  

![0-02-03-002ca6c48b9abd59e316f4b41a77785d77da4351e9f018d5aba0d2c06a00dd5b_6b113beced6b8794](https://github.com/user-attachments/assets/b7d77346-6386-4e10-a668-66b6379a8867)



