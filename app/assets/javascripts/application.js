// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function  validateCode(code_sent) {

    var code_entered = document.getElementById('code').value;
    if (code_sent.toString() == code_entered.toString())
    {
        //show sucess pop up
        $('#myModal').modal('show');
        return false;

    }
         else
    {
        //go to home page
        document.getElementById("form-code").submit();
    }

    end

}