// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniTwitter {
    // Structure pour un post
    struct Post {
        uint id;
        address owner;
        string content;
        uint likeCount;
        uint dislikeCount;
        uint timestamp;
        uint modifiedAt;
    }

    // Liste des posts
    Post[] public posts;

    // Mapping pour garder une trace des likes/dislikes par utilisateur
    mapping(uint => mapping(address => bool)) public likedPosts;
    mapping(uint => mapping(address => bool)) public dislikedPosts;

    // Événements
    event NewPost(uint postId, address owner, string content, uint timestamp);
    event PostModified(uint postId, address owner, string newContent, uint modifiedAt);
    event PostLiked(uint postId, address user);
    event PostDisliked(uint postId, address user);

    modifier onlyOwner(uint256 postId) {
        require(posts[postId].owner == msg.sender, "You are not the owner of this post");
        _;
    }

    // Ajouter un nouveau post
    function addPost(string memory content) public {
        uint256 postId = posts.length;
        posts.push(Post(postId, msg.sender, content, 0, 0, block.timestamp, 0));
    }

    function modifyPost(uint256 postId, string memory newContent) public onlyOwner(postId) {
        Post storage post = posts[postId];
        post.content = newContent;
        post.modifiedAt = block.timestamp;
    }

    // Aimer un post
    function likePost(uint _postId) public {
        require(_postId < posts.length, "Post does not exist");
        require(!likedPosts[_postId][msg.sender], "You have already liked this post");

        // Annuler le dislike si le post était déjà disliké
        if (dislikedPosts[_postId][msg.sender]) {
            posts[_postId].dislikeCount--;
            dislikedPosts[_postId][msg.sender] = false;
        }

        posts[_postId].likeCount++;
        likedPosts[_postId][msg.sender] = true;

        emit PostLiked(_postId, msg.sender);
    }

    // Disliker un post
    function dislikePost(uint _postId) public {
        require(_postId < posts.length, "Post does not exist");
        require(!dislikedPosts[_postId][msg.sender], "You have already disliked this post");

        // Annuler le like si le post était déjà liké
        if (likedPosts[_postId][msg.sender]) {
            posts[_postId].likeCount--;
            likedPosts[_postId][msg.sender] = false;
        }

        posts[_postId].dislikeCount++;
        dislikedPosts[_postId][msg.sender] = true;

        emit PostDisliked(_postId, msg.sender);
    }

    // Retourner tous les posts
    function getAllPosts() public view returns (Post[] memory) {
        return posts;
    }
}
