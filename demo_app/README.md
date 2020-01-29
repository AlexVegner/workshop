# demo_video_app

Demo video app

## Getting Started

####  1. Create flutter app
    ```
    flutter create demo_app
    ```

#### 2. Create public Github repository

####  3. Send link to your repository via email: <dpolish@aux.dkatalis.com> and <ovegn@aux.dkatalis.com>

[Send email](mailto:dpolish@aux.dkatalis.com;ovegn@aux.dkatalis.com)

## Demo app tasks

#### 1. Get api key from [omdbapi](http://www.omdbapi.com/apikey.aspx)

#### 2. Check api samples:
[search sample](http://www.omdbapi.com/)


#### 3. Import api and and env to Postman

* [demo-video-ws.postman_collection.json](/demo-video-ws.postman_collection.json)


* [demo-video-ws_Env.postman_environment.json](/demo-video-ws_Env.postman_environment.json)

#### 4. Review demo-video-ws api in Postman

#### 5. Implement api search movie by title and year 

    `?s=Robin&y=2019&apikey=<api key>`

#### 6. Implement demo-video-ws api

* `GET /recommended`

  headers:
  ```
  "Authorization": "2" - or any other string
  "Content-Type": "application/json"
  ```
  response:
  ```json
  {
  "title": "Robin Hood",
  "year": "2010",
  "id": "tt0955308",
  "poster": "https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg"
  }
  ```

* `GET /videos`

    headers:
    ```
    "Authorization": "2" - or any other string
    "Content-Type": "application/json"
    ```
    response:
    ```json
    [
    {
    "label": "my film",
    "priority": 1,
    "viewed": false,
    "rating": 10, 
    "timestamp": 1575473859,
    "title": "Robin Hood",
    "year": "2010",
    "id": "tt0955308",
    "poster": "https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg"
    }
    ]
    ```

* `POST /videos`
    headers:
    ```
    "Authorization": "2" - or any other string
    "Content-Type": "application/json"
    ```
    request:
    ```json
    {
    "label": "my film",
    "priority": 1,
    "viewed": false,
    "rating": 10, 
    "timestamp": 1575473859,
    "title": "Robin Hood",
    "year": "2010",
    "id": "tt0955308",
    "poster": "https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg"
    }
    ```

* `PUT /videos/<video id>`

    headers:
    ```
    "Authorization": "2" - or any other string
    "Content-Type": "application/json"
    ```
    request:
    ```json
    {
    "label": "my film",
    "priority": 1,
    "viewed": false,
    "rating": 10, 
    "timestamp": 1575473859,
    "title": "Robin Hood",
    "year": "2010",
    "id": "tt0955308",
    "poster": "https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg"
    }
    ```

* `DELETE /videos/<video id>`

    headers:
    ```
    "Authorization": "2" - or any other string
    "Content-Type": "application/json"
    ```

* `GET /videos/<video id>`

headers:
    ```
    "Authorization": "2" - or any other string
    "Content-Type": "application/json"
    ```
    response:
    ```json
    {
    "label": "my film",
    "priority": 1,
    "viewed": false,
    "rating": 10, 
    "timestamp": 1575473859,
    "title": "Robin Hood",
    "year": "2010",
    "id": "tt0955308",
    "poster": "https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg"
    }
    ```

#### 7. Splash page
- Show some info about your app, and move to next page.
- Next page depends from session token if it exist then move to home screen, in other case move to login screen
- Store session token is SharedPreference

#### 8. Login page
- Enter token, save sesion token in shared preference, and move to home screen

#### 9. Dashboard page
- Show 3 films from favorite list with highest priority with viewed=false

- And one recomendation from server
GET /recommended

#### 9. Search Page
- Filter result with search query and year see #3 task
- Shows list of films. - Move to create / edit page when user tap on a film card
- Show only 1 page of result for the task

#### 10. Favorite Movies
- Show all favorites movies sordes by timestamp
- User can remove item 
- Item onTap should redirect to Create/Edit Favorite Movie page

#### 11. Create / Edit page

    User can edit: 
    ```
    label: //user label
    priority: 0/1/2 // whete 2 - "low", 1 - "medium", 0 - "high"
    viewed: false/true
    rating: 0 - not set, 1 - 10 - your rating
    timestamp // unixtime change each time when user edit info
    ```

    other data comes from omdbapi
    ```
    "title": "Robin Hood",
    "year": "2010",
    "id": "tt0955308",
    "poster": "https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg"
    ```

#### 12. Setting page
- Show recommendation on dashboard page checkbox
Save the setting in shared preference
 
- Check by default = true. If checked then user shoud see recomendation movie on dashboard.
 
- Button "Logout" it will remove token from shared preference and redirect to login page
