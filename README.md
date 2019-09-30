# **Random Waifu API**

Try to make an api using Ruby on Rails with Cloudinary

## Intro

Q : Why should i use Cloudinary?

A : coz LINE require _https_, but the link i get is _http_

## What I Use

* Ruby 2.5.3
* Rails 5.2.2
* PostgreSQL
* Cloudinary
* [Active Model Serializer](https://github.com/rails-api/active_model_serializers)

## How to Use

1. Clone this repo

    ```
    git clone https://github.com/lulu8879/Random-Waifu-API.git
    ```

2. Download `cloudinary.yml` from [Cloudinary](https://cloudinary.com) on dashboard and move it to folder `config/`

3. Push to heroku

    ```
    git push heroku master
    ```

4. Migrate DB

    ```
    heroku run rails db:create && heroku run rails db:migrate
    ```

5. GET 

    ```
    http https://your-app-name.herokuapp.com/random-waifu
    ```