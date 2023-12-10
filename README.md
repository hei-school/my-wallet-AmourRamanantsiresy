[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/hy8NMZUz)

# Wallet Cli

<img src="assets/wallet-logo.png">

### Description

Welcome to Wallet CLI, this is a command line interface that reproduce some features as your real wallet.
I've coded that on four (4) languages that are :

- Javascript
- Python
- Dart
- Bash
  h

### Feature

#### Branch feature/js

1.  Wallet itself :

    You can get some information about your wallet like :

    - get The color of your current wallet
    - get The mark of your wallet
    - throw : This will reset your wallet and close the cli.
    - open :

      Before all transactions you need to open your wallet or else you'll not be able to use all features about it's content.

    - close :

      This will close your wallet but not the cli, so you can re open it will all of your last data.

          NB: This action is available only when your wallet is open

2.  national ID :

    In this wallet, you can put one or more NID, and you can preform some actions with themes, like :

    - get NID by the name of owner
    - put NID by the name of owner

3.  Money :

    This wallet will not be a real wallet without money handling. so these are the features concerning that :

    - get current balance
    - deposit money by amount that must always be a number > 0 and multiple of 100
    - withdrawal money by amount that must always be a number > 0 and multiple of 100

#### Others branches (feature/dart | feature/bash | feature/python)

1. Wallet itself

In the beginning, you must login, else you'll not be able to perform all action in the apps
On run the app, you'll have 10_000 Ar as your current balance.

After login you can :

- view your current balance
- deposit amount
- withdrawal amount
- watch the list of your last transactions
