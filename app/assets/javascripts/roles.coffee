$( document ).on 'turbolinks:load', ->
  $('form.per_page select#per_page').on 'change', ->
    this.form.submit()
