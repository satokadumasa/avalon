function replaceToHtml(str) {
  str = replaceLfToBr(str);
  var keys = ["h1","h2","h3","h4","h5"]
  for(var i = 0; i < keys.length; i++) {
    str = replaceToHx(str, keys[i]);
  }
  str = replaceToImgTag(str);
  str = replaceToBr(str);
  str = replaceToBold(str);
  return str;
}

function replaceLfToBr(str) {
  var arr = str.split("\n");
  str = arr.join("<br>\n");
  return str;
}

function replaceToHx(str, key) {
  var pattern = "#" + key + ":(.*)\n";
  var regexp = new RegExp(pattern, 'g');
  var results = str.match(regexp);

  if(results) {
    for(var i = 0; i < results.length; i++) {
      var result = "";
      result = results[i].replace(/#/,'');
      var arr = result.split(":");
      result = "<" + arr[0] + ">" + arr[1] + "</" + arr[0] + "><br>\n";
      str = str.replace(results[i], result);
    }
  }
  return str;
}

function replaceToImgTag(str) {
  // #img:/assets/images/20180814003134434556.jpg
  var pattern = "#img:\/assets\/images\/(.*):(.*):";
  var regexp = new RegExp(pattern, 'g');
  var results = str.match(regexp);

  if(results) {
    for(var i = 0; i < results.length; i++) {
      var result = "";
      result = results[i].replace(/#/,'');
      var arr = result.split(":");
      result = "<" + arr[0] + " src='" + image_base_url + arr[1] + "' alt='" + arr[2] + "'><br>\n";
      str = str.replace(results[i], result);
    }
  }
  return str;
}

function replaceToBr(str) {
  var pattern = "#br:(.*)\n";
  var regexp = new RegExp(pattern, 'g');
  var results = str.match(regexp);

  if(results) {
    for(var i = 0; i < results.length; i++) {
      var result = "";
      result = results[i].replace(/#/,'');
      var arr = result.split(":");
      result = arr[1] + "<" + arr[0] + ">\n";
      str = str.replace(results[i], result);
    }
  }
  return str;
}

function replaceToBold(str) {
  var pattern = "##(.*?)##";
  var regexp = new RegExp(pattern, 'g');
  var results = str.match(regexp);

  if(results) {
    for(var i = 0; i < results.length; i++) {
      var result = "";
      result = results[i].replace(/##/g,'');
      // var arr = result.split(":");
      result = "<b>" + result + "</b>";
      str = str.replace(results[i], result);
    }
  }
  return str;
}
