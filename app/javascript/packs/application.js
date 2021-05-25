// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

 // import the bootstrap javascript module
 import "bootstrap"
 // import the application.scss we created for the bootstrap CSS (if you are not using assets stylesheet)
 import "../../assets/stylesheets/application"
import { get } from "jquery"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$( document ).ready(function() {
    $(".like_button").click(function () {
        let url = $(this).attr("url");
        $.ajax({
            url: url,
            type: "get",
            success: function (response) {
                $("#like_count").text(response)
                location.reload()
            }
        });
      });
});
