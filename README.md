# **Random Waifu API**

Try to make an api using Ruby on Rails with Cloudinary

## Intro

Q : Why should i use Cloudinary?

A : coz LINE require _https_, but the link i get is _http_

## What I Use

* Ruby 2.6.4 (Updated from 2.5.3)
* Rails 5.2.3 (Updated from 5.2.2)
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

## Note:
### How to Update Ruby Version Using rvm
1. Check current ruby version that being used

   ```
   rvm list
   ```
2. Edit Gemfile or/and .ruby_version (if exists) and change the ver ruby  
3. Change current version, ex: change to ver 2.6.4
 
    ```
    rvm use 2.6.4
    ```
    
4. Update bundle and gem
 
   ```
   bundle update
   ```