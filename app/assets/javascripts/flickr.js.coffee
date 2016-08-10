$ ->
  $("#flickr_form").submit (event) ->
    $('.flickr-results').html("
                              <span>Подождите пожалуйста, идет загрузка</span>
                              <img src='/assets/loading.gif'/>
                             ")
    event.preventDefault()
    $.ajax
      type: "GET"
      url: "/flickrs",
      data: $(this).serializeArray()
      success: (result) ->
        $('.flickr-results').html(result)

  $('body').on 'click', '.flickr-link', (event) ->
    url = $(this).attr('data-original')
    $('.flickr-results').empty()
    $('#getFlickrList').modal('hide')
    $('#card_remote_image_url').val(url)
    img_url = $(this).children("img").attr('src')
    $('.flickr-preview').html("<img src='" + img_url + "'/>")
