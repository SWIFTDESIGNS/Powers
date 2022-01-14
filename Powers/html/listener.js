

$(function () {
    function display(bool) {
        if (bool) {
            $("#powers").show();
        } else {
            $("#powers").hide();
        }
    }

    display(false)


    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    
    $("#Super-Melee").click(function () {
        $.post('http://Powers/SuperMelee', JSON.stringify({}));
        return;
        })

    $("#Super-Jump").click(function () {
        $.post('http://Powers/SuperJump', JSON.stringify({}));
        return;
        })

    $("#Super-FastRun").click(function () {
        $.post('http://Powers/SuperFastRun', JSON.stringify({}));
        return;
        })

        $("#Super-FastSwim").click(function () {
            $.post('http://Powers/SuperFastSwim', JSON.stringify({}));
            return;
            })


      
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://Powers/exit', JSON.stringify({}));
            return
        }
    };      

 //   $("#Super-Melee").click(function () {
      //  let inputValue = $("#Melee-Cust").val()
      //  if (inputValue.length >= 10) {
         //   $.post("http://Powers/error", JSON.stringify({
            //    error: "Input was greater than 10"
          //  }))
         //   return;
      //  } else if (!inputValue) {
          //  $.post("http://Powers/error", JSON.stringify({
            //    error: "There was no given strength number"
         //   }))
          //  return;
       // }
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there

      //  $.post('http://Powers/SuperMelee', JSON.stringify({
         //   text: inputValue,
         //   succeed: "Strength Updated"
      //  }));
      //  return;
   // })
})



