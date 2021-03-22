// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', function () {
  var ajaxLinks = document.querySelectorAll('a[data-ajax]')
  for (let link of ajaxLinks) {
    link.addEventListener('click', function (event) {
      event.preventDefault()

      var target = event.target
      var url = target.href

      var fetchStuff = fetch(url)
      fetchStuff.then(function (response) {
        return response.text()
      }).then(function (responseBody) {
        var parser = new DOMParser()
        var doc = parser.parseFromString(responseBody, 'text/html')

        var content = doc.querySelector('article')

        var target = document.getElementById('dog_details')
        target.innerHTML = content.innerHTML
      })
    })
  }
});
