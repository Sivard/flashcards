$ ->
  $("#flickr_form").submit (event) ->
    $('.flickr-loader').show()
    $('.flickr-results').empty()
    
    event.preventDefault()
    $.ajax
      type: "GET"
      url: "/flickr",
      data: $(this).serializeArray()
      success: (result) ->
        $('.flickr-loader').hide()
        if result.data.length > 0
          $('.flickr-results').html HandlebarsTemplates['flickrs/index'](result);
        else
          $('.flickr-results').html('Ничего не найдено, попробуйте повторить запрос')

    return false

  $('body').on 'click', '.flickr-link', (event) ->
    url = $(this).attr('data-original')
    $('.flickr-loader').hide()
    $('.flickr-results').empty()
    $('#getFlickrList').modal('hide')
    $('#card_remote_image_url').val(url)
    img_url = $(this).children("img").attr('src')
    $('.flickr-preview').html("<img src='" + img_url + "'/>")
