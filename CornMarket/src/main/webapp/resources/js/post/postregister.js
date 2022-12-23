$(document).ready(function(){
    $("#boardcheckbox").change(function(){         
            if($("#boardcheckbox").is(":checked")){ 
               $("#inputonchange").val("0"); 
            }
        });
    
    
    });