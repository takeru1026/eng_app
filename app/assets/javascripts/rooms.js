/*--message--*/
$(document).on('turbolinks:load',function(){
    const message = document.getElementById("message");
    if (message) {
    const bottom = message.scrollHeight - message.clientHeight;
      message.scroll(0, bottom);
    }
    
});


/*--image--*/

$(document).on('turbolinks:load',function(){
  const image= document.getElementById("pic");
  $(image).change(function(e){
    //ファイルオブジェクトを取得する
    const file = e.target.files[0];
    const reader = new FileReader();
 
    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
 
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
 
  });
});