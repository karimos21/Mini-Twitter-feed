# Mini Twitter - A Decentralized Social Media Platform

**Mini Twitter** is a simple decentralized social media application built on the Ethereum blockchain. The application allows users to post, like, and dislike content, all while ensuring data integrity and transparency through blockchain technology. By leveraging Web3.js and MetaMask, **Mini Twitter** offers a decentralized experience where users have control over their posts and interactions.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Technologies Used](#technologies-used)
- [App Functionality](#app-functionality)
  - [Connecting Wallet](#connecting-wallet)
  - [Creating a Post](#creating-a-post)
  - [Liking and Disliking Posts](#liking-and-disliking-posts)
  - [Viewing Posts](#viewing-posts)
- [Smart Contract Architecture](#smart-contract-architecture)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [License](#license)
- [Contributing](#contributing)

## Overview

**Mini Twitter** is a decentralized application (DApp) that mimics the core functionalities of a basic social media platform. Unlike traditional centralized social media platforms, **Mini Twitter** stores all posts on the Ethereum blockchain. By using Ethereum’s smart contracts, all actions (creating posts, liking/disliking, etc.) are transparent and tamper-proof.

The app interacts with the Ethereum blockchain using Web3.js for JavaScript integration and MetaMask as the wallet to sign transactions.

## Key Features

- **Decentralized Content Posting**: Users can create posts that are saved on the blockchain, making them immutable and publicly visible.
- **User Interaction with Posts**: Users can like or dislike posts, with all interactions recorded on the blockchain.
- **Transparent Data**: All user posts and interactions are fully transparent, allowing anyone to view them at any time.
- **MetaMask Integration**: Users can easily connect their MetaMask wallet to the app for blockchain interactions.
- **Post Modifications**: Users can edit their posts. The modification timestamp is updated, but the original content remains immutable.
- **Like/Dislike Tracking**: The system prevents conflicting interactions (e.g., liking and disliking a post simultaneously). It also handles undoing actions when switching between likes and dislikes.

## Technologies Used

- **Ethereum**: Blockchain platform for decentralized post storage and interaction.
- **Smart Contracts**: Solidity-based smart contracts to handle posts, likes, and dislikes.
- **Web3.js**: A JavaScript library that facilitates communication between the DApp and the Ethereum blockchain.
- **MetaMask**: A browser extension for managing Ethereum wallets and signing transactions.
- **HTML/CSS**: Used to build the user interface of the DApp.

## App Functionality

### Connecting Wallet

When users visit the app, they will be prompted to connect their MetaMask wallet. Once connected, the app will display the user's wallet address and allow them to interact with the smart contract. This ensures that only the user with a specific Ethereum wallet can post, like, or dislike posts.

Steps to connect the wallet:
1. Click the **Connect Wallet** button.
2. If MetaMask is installed, the browser will prompt you to connect your wallet.
3. Once connected, the wallet address will be displayed on the app, and you can start interacting with the platform.

### Creating a Post

Users can create new posts by typing content in a text input field and submitting it to the Ethereum blockchain. Each post will have a unique post ID and include the following:

- **Owner Address**: The Ethereum wallet address of the post creator.
- **Timestamp**: The time when the post was created.
- **Content**: The actual text content of the post.

The post is permanently stored on the blockchain, ensuring that it cannot be modified or deleted once submitted.

Steps to create a post:
1. Enter text in the "Create a Post" input field.
2. Click the **Post** button.
3. The post is sent to the Ethereum network, and the content is displayed in the "Posts" section.

### Liking and Disliking Posts

Users can interact with posts by liking or disliking them. Every time a user clicks **Like** or **Dislike**, the blockchain is updated with the new like/dislike count for that specific post. This ensures that all interactions are recorded and visible to anyone using the platform.

Steps to like or dislike a post:
1. Click on the **Like** or **Dislike** button on any post.
2. The like/dislike count is updated on the blockchain and immediately reflected on the page.

### Viewing Posts

Once a post is created, all users can see it in the "Posts" section, where each post includes:
- The owner’s Ethereum address.
- The timestamp of when the post was created.
- The content of the post.
- The number of likes and dislikes.

Posts are loaded dynamically from the blockchain using the `getAllPosts()` function from the smart contract.

## Smart Contract Architecture

The **Mini Twitter** DApp interacts with an Ethereum smart contract deployed on the Ethereum blockchain. The smart contract handles:

- **addPost(content)**: A function that adds a new post to the blockchain with the provided content.
- **likePost(postId)**: Increases the like count for a specified post.
- **dislikePost(postId)**: Increases the dislike count for a specified post.
- **getAllPosts()**: Retrieves all posts stored on the blockchain.

This smart contract ensures that every post and interaction (like/dislike) is securely recorded on the blockchain, providing transparency and immutability.

### Key Contract Functions

1. **addPost**: Allows users to add a new post. The post includes content, the owner's address, and timestamps.
2. **likePost**: Increases the like count for a specified post, preventing users from liking a post they've already liked.
3. **dislikePost**: Increases the dislike count for a specified post, preventing users from disliking a post they've already disliked.
4. **modifyPost**: Allows users to modify their own posts, with a new modification timestamp but without altering the original post content.
5. **getAllPosts**: Returns an array of all posts, providing transparency for all users.

