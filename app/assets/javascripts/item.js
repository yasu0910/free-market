$(document).on('turbolinks:load', function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][url]"
                    id="item_images_attributes_${index}_url"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  console.log('fileIndex;',fileIndex);

  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  console.log('lastIndex;',lastIndex);

  // 配列の一番先頭からlastIndexまで削除
  fileIndex.splice(0, lastIndex);
  console.log('fileIndex after splice;',fileIndex);
  

  $('.hidden-destroy').hide();
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    console.log('buildImg html;',html);
    return html;
  }

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    console.log('image-box change targetIndex;',targetIndex);

    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    console.log('image-box change file;',file);

    const blobUrl = window.URL.createObjectURL(file);
    console.log('image-box change blobUrl;',blobUrl);

    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      console.log('image-box if 変更 targetIndex;',targetIndex);
      console.log('image-box if 変更 img setAttribute before;',img);

      img.setAttribute('src', blobUrl);
      console.log('image-box if 変更 img setAttribute after;',img);

      // 新規画像追加の処理
    } else {  

      console.log('image-box else 新規');
      $('#previews').append(buildImg(targetIndex, blobUrl));
      console.log('image-box else 新規 append(buildImg(targetIndex, blobUrl))');
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    
  });
});