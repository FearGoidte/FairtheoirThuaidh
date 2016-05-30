//<![CDATA[
(function () {
    "use strict";
    var TweetButton = document.createElement("a");
    var newContent = document.createTextNode("Tweet");
    TweetButton.setAttribute("class", "twitter-share-button");
    TweetButton.setAttribute("data-url", "http://example.com");
    TweetButton.setAttribute("data-text", "Title of example");
    TweetButton.setAttribute("data-via", "feargoidte");
    TweetButton.setAttribute("data-hashtags", "1tag,2tag,3tag");
    TweetButton.setAttribute("data-dnt", "true");
    TweetButton.setAttribute("href", "https://twitter.com/share");
    TweetButton.appendChild(newContent);
    var currentA = document.getElementById("tweet-button");
    document.body.insertBefore(TweetButton, currentA);
    var s = document.createElement('script');
    var s1 = document.getElementsByTagName('script')[0];
    s.type = 'text/javascript';
    s.async = true;
    s.src = 'https://platform.twitter.com/widgets.js';
    s1.parentNode.insertBefore(s, s1);
})();
//]]>