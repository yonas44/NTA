<div align="center">
  <h3><b>Nutrition app Back-End</b></h3>
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

# 📖 Nutrition_app_back-end <a name="about-project"></a>

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

### Key Features <a name="key-features"></a>

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
         rake secret
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

👤 **Ben Salès**

- GitHub: [@SekoViper](https://github.com/SekoViper)
- LinkedIn: [Livingstone Dameh](https://www.linkedin.com/in/livingstone-dameh/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **Add payment methods**

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## ⭐️ Show your support <a name="support"></a>

If you like this project give it a star!

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Microverse ❤️
- [Murat Korkmaz on Behance](https://www.behance.net/muratk) the author of the [original design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.
