//<![CDATA[
(function () {
    "use strict";
    var fbRoot = document.createElement("div");
    fbRoot.setAttribute("id", "fb-root");
    var ShareButton = document.createElement("div");
    ShareButton.setAttribute("class", "fb-share-button");
    ShareButton.setAttribute("data-href", "https://example.com/");
    ShareButton.setAttribute("data-layout", "icon_link");
    var currentB = document.getElementById("facebook-share");
    document.body.insertBefore(fbRoot, currentB);
    document.body.insertBefore(ShareButton, fbRoot);
    var s = document.createElement('script');
    var s1 = document.getElementsByTagName('script')[0];
    s.type = 'text/javascript';
    s.async = true;
    s.src = 'https://connect.facebook.net/en_GB/all.js#xfbml=1';
    s1.parentNode.insertBefore(s, s1);
})();
//]]>