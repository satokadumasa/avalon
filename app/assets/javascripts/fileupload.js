function dragover(e) {
    e.preventDefault();
}

var files = new Array;
function drop(e) {
  e.preventDefault();
  files = e.dataTransfer.files;
  // $('#prevbox ul li').remove();
  for (var i=0; i<files.length; i++) {
    if (!files[i] || files[i].type.indexOf('image/') < 0) {
      continue;
    }
    var fileReader = new FileReader();
    fileReader.onload = function( event ) {
      var loadedImageUri = event.target.result;
      $("<li><img src='"+loadedImageUri+"'></li>").appendTo("#prevbox ul");
    };
    fileReader.readAsDataURL( files[i] );
  }
  $("#prevbox").after('<button type="button" class="btn btn-success" id="btn" onclick="Upload()">Upload</button>');
}
function Upload(){
  // $('#prevbox ul li').remove();
  for (var i=0; i<files.length; i++) {
    FileUpload(files[i],i);
  }
}
function FileUpload(fd,n) {
    var formData = new FormData();
    formData.append('image', fd);
    // $('#imagebox').append('<p class="pber" id="progre'+n+'"><span id="pspan'+n+'">&nbsp;</span></p>');
    
    $.ajax({
      async: true,
      xhr : function(){
        var XHR = $.ajaxSettings.xhr();
        if(XHR.upload){
            XHR.upload.addEventListener('progress',function(e){
                var progre = parseInt(e.loaded/e.total*10000)/100 ;
                    progre = Math.floor(progre) ;
                $("#pspan"+n).width(progre+"%");
            }, false); 
        }
        return XHR;
      },
      type: 'POST',
      contentType: false,
      processData: false,
      url: 'ImageUp_1.php',
      data: formData,
      dataType :'xml'
    }).done(function(xml){
      var mes  = $(xml).find("mes").text();
      var file = $(xml).find("file").text();
      var flag = $(xml).find("flag").text();
      var prog = $('#progre'+n);
      if(flag == 1){
        $(prog).after('<img src="upload/'+file+'"> <br />');
      }
    });
}