<div align="center">

  <img src="./Healthier.png" alt="logo" width="140"  height="auto" />
  <br/>

</div>

<div align="center">
  <h2><b>Healthier Back-End</b></h2>
  <p style="font-style: Italic">"Your health is your wealth!"</p>
</div>

# 📗 Table of Contents

- [📖 About the Project](#[project])
  - [Kanban board](#kanban-board)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Available Scripts](#available-scripts)
- [👥 Authors](#author)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgments)
- [📝 License](#license)

# 📖 Healthier_back-end <a name="about-project"></a>

- This is an application that's in development and once completed it is going to help track users nutritions and consumptions, connect users with their nutritionist and helping them get personal recipe recommendations and provide progress tracking of their health and conditions and more awesome features.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>HTML, CSS</li>
    <li>JavaScript</li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li>Ruby on Rails</li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features v1.1 <a name="key-features"></a>

- [x] Allow users/ clients to book an appointment with a professional (nutritionist).
- [x] Allow nutritionist manage their client by allowing them to create recipes, meal_plans and help them track their clients progress.
- [x] Allow nutritionist and clients to manage their profile accordinglly.

## 🚀 Live Demo <a name="live-demo"></a>

- [Coming Soon]()

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

- <a href="https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/">Ruby</a>
- <a href="https://rubyonrails.org/">Ruby on Rails</a>
- <a href="https://www.postgresql.org/">PostgreSQL</a>
- any code editor

### Setup

To setup the project follow the steps:

1.  Clone this project using Git Bash:

    ```
    git clone https://github.com/yonas44/NTA.git
    ```

2.  Inside the project directory, install the project's dependencies

    ```
    bundle install
    ```

3.  Create the app's database

    ```
    rails db:create
    ```

4.  Setup the app's database
    ```
    rails db:setup
    ```
5.  Setup the credentials on your local project following:

- Run:
  ```
    rails secret
  ```
- Open the credentials file from the command line.

```
 EDITOR=nano rails credentials:edit
```

And paste in the following, with the key generated from running the rake secret above.

```
devise:
  jwt_secret_key: <rake secret key>
```

ctrl+x, then y, then enter to close and save if you’re using the nano editor.

### Usage

- To use the API documentation for the back-end end points, use this path to see the documentation after starting the back-end server:

```
http://localhost:3000/api-docs/index.html
```

### Available Scripts

In the project directory, you can run:

- ```
  rails server
  ```

  Runs the app local server

- ```
  bundle exec rspec
  ```
  Launches the test runner.

## 👥 Author <a name="authors"></a>

👤 **Yonas Tesfu**

- GitHub: [@yonas44](https://github.com/yonas44)
- LinkedIn: [Yonas Tesfu](https://linkedin.com/in/yonas-tesfu)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **Add payment methods**

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## ⭐️ Show your support <a name="support"></a>

If you like this project give it a star!

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.
