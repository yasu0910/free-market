$(document).on('turbolinks:load', function() {
  // fields_forのfile_field 一つを作る（押せないボタン）
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="select-image">
                    <input class="input-image" type="file"
                    name="item[images_attributes][${index}][url]"
                    id="item_images_attributes_${index}_url">
                  </div>`;
    return html;
  }
  // プレビュー表示用の画像とその編集、削除を作る
  const buildFileImage = (index, url)=> {
    const html = `<div class="image-preview" data-index="${index}">
                    <div class="image-preview__image-box">
                      <img data-index="${index}" width="118" height="118" class="image" src="${url}">
                    </div>
                    <div class="image-preview__btn">
                      <label for="item_images_attributes_${index}_url">編集</label>
                      <span class="image-remove">削除</span>
                    </div>
                  </div>`;
    return html;
  }
  // fields_forのfile_fieldをクリックできるボタンを作る
  const buildLabel = (count, index)=> {
    const html = `<label class="add-btn" data-count="${count}" for="item_images_attributes_${index}_url">
                    <div class="label-box">
                      <img class="icon-camera" src="/assets/icon_camera-24c5a3dec3f777b383180b053077a49d0416a4137a1c541d7dd3f5ce93194dee.png">
                      <p class="upload-info">クリックして画像をアップロード</p>
                    </div>
                  </label>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.select-image:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  $('.hidden-destroy').hide();
  
  $('.uplord-image-files-field').on('change', '.input-image', function(e) {
    // 目標の要素のdata-inadex
    const targetIndex = $(this).parent().data('index');
    // URLの取得
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 画像変更
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    // 新規画像追加
    } else { 
      // 写真たちの追加（見える部分の追加）
      $('.image-previews').append(buildFileImage(targetIndex, blobUrl));
      // ボタンを常に一つにするために消す
      $('.add-btn:last').remove();
      // file_fieldの追加（見えない部分の追加）
      $('.uplord-image-files-field').append(buildFileField(fileIndex[0]));
      // ボタンの追加
      var count = $(".image-preview").length;
      $('.image-previews').append(buildLabel(count, fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  // 画像削除
  $('.uplord-image-files-field').on('click', '.image-remove', function() {
    const targetIndex = $(this).parent().parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(`.select-image[data-index="${targetIndex}"]`).remove();
    $(`.image-preview[data-index="${targetIndex}"]`).remove();
    var count = $(".image-preview").length;
    $('.add-btn:last').attr('data-count', `${count}`); 
    // 画像入力欄が0個にならないように
    if ($('.input-image').length == 0) $('.uplord-image-files-field').append(buildFileField(fileIndex[0]));
  });
});