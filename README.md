# ecommerce

A new Flutter project.

## Getting Started
Ecommerce Application
This project is a starting point for a Flutter application.

it contains just 4 screens
|- Home screen which list the Products and also displays the cart length
    |- Cart Screen which contains the functionality of adding product ot cart

|- Checkout screen which contains the user information and also the order summary of the user

## Cart functionality
**Here is how i handle state**
Flutter inbuilt Value notifier to manage state

|- Cart Class
    |- addToCart method which add a product to cart and calculate the product amount based on shipping fee

    |- incrementCartValue method which increment the cart count by one and also calculate the product amount based on the shipping fee also and count

    |- decrementCartValue method which decrement the cart count by one and also calculate the product amount based on the shipping fee too and count

    |- removeCartData method which removes the cart count by one and also calculate the product amount based on the shipping fee too and count


**Let's talk about the model classes**
|- Model Class
    |- ProductData model class which is a blueprint of the Product object using the new dart syntax within the fromJson
    |- CartData model class which is a blueprint of the Cart object using the new dart syntax within the fromJson

## Design Pattern
|- Singleton Pattern

## Screenshot
!["Home screen"](assets/screenshots/home_screen.png)
!["Cart screen"](assets/screenshots/cart_screen.png)
!["Checkout screen"](assets/screenshots/checkout_screen.png)
!["Order screen"](path/to/screenshot.png)

**Quick Note**
NB: This project does not make use of any plugins or dependencies only those provided by 


A few resources to get you started if this is your first Flutter project:
