$(document).on('turbolinks:load', function() {
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='create-category__form__select__added' id= 'children_wrapper'>
                         <div class='create-category__form__select__box'>
                           <select class="create-category__form__select__box__btn" id="child_category" name="item[category_id]">
                             <option value="選択してください" data-category="---">選択してください</option>
                             ${insertHTML}
                           <select>
                         </div>
                       </div>`;
    $('.create-category__form__select').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='create-category__form__select__added' id= 'grandchildren_wrapper'>
                              <div class='create-category__form__select__box'>
                                <select class="create-category__form__select__box__btn" id="grandchild_category" name="item[category_id]">
                                  <option value="選択してください" data-category="---">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.create-category__form__select').append(grandchildSelectHtml);
  }

  var submitBtnValue = $('.submit-btn').val();
  if (submitBtnValue == "出品する"){
    var urlChild = '/items/get_category_children';
    var urlGrandChild = "/items/get_category_grandchildren";
  }else if(submitBtnValue == "編集を保存する"){
    var urlChild = 'edit_category_children';
    var urlGrandChild = "edit_category_grandchildren";
  }
  
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "選択してください"){
      $.ajax({
        url: urlChild,
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
    }
  });
  
  $('.create-category__form').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){ 
      $.ajax({
        url: urlGrandChild,
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
});