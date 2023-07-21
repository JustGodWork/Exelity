$('#showspeedo').hide();
﻿$('#containerStatus').hide();
﻿$('#containerStatuss').hide();

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.actionhud == "showhud"){
			if (event.data.showhud){
				$('#uiInfo').fadeIn(200);
			} else{
				$('#uiInfo').fadeOut(800);
			}
		}else if (event.data.actionhud == "setResolution"){
            ﻿$('#containerStatus').hide();
            $('#containerStatuss').fadeIn(800);
        }else if (event.data.actionhud == "resetResolution"){
            ﻿$('#containerStatuss').hide();
            $('#containerStatus').fadeIn(800);
		}else if (event.data.actionspeedo == "showspeedo"){
			if (event.data.showspeedo){
				$('#uiSpeed').fadeIn(200);
			} else{
				$('#uiSpeed').fadeOut(800);
			}
		}
		if (event.data.actionspeedo == "setValue"){
			if (event.data.key == "speed"){
                if (event.data.value > 999) {
                    event.data.value = 999
                } else if(event.data.value >= 100) {
                    var tmpSpeed = Math.floor(event.data.value) + ''
                    speedText = '<span class="int1">' + tmpSpeed.substr(0, 1) + '</span><span class="int2">' + tmpSpeed.substr(1, 1) + '</span><span class="int3">' + tmpSpeed.substr(2, 1) + '</span>'
                } else if(event.data.value > 9 && event.data.value <= 99) {
                    var tmpSpeed = Math.floor(event.data.value) + ''
                    speedText = '<span  >0</span><span class="int2">' + tmpSpeed.substr(0, 1) + '</span><span class="int3">' + tmpSpeed.substr(1, 1) + '</span>'
                } else if(event.data.value > 0 && event.data.value <= 9) {
                    speedText = '<span  >0</span><span >0</span><span class="int3">' + Math.floor(event.data.value) + '</span>'
                } else {
                    speedText = '<span  >0</span><span >0</span><span >0</span>'
                }
				$(".speed").html(speedText);
            }else if (event.data.key == "fuel"){
                $(".progressSpeed").css("height", (event.data.value) + "%");
				
			}
		}else if (event.data.actionhud == "setValue"){
			if (event.data.key == "money"){
				$(".cashInfo").html(event.data.value);
            }else if (event.data.key == "sale"){
				$(".saleInfo").html(event.data.value);
            }else if (event.data.key == "player"){
				$(".playerInfo").html(event.data.value);
            }else if (event.data.key == "id"){
				$(".idInfo").html(event.data.value);
            }else if (event.data.key == "clock"){
				$(".hourInfo").html(event.data.value);
            }else if (event.data.key == "eat"){
				$(".progresseat").css("width", (event.data.value) + "%");
			}else if (event.data.key == "drink"){
                $(".progressdrink").css("width", (event.data.value) + "%");
			}
		}
	})
})