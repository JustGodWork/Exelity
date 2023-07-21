function show1()
{
    $(".containers").fadeIn(500);
    $(".containers1").hide();
    $(".containers2").hide();
}

function show2()
{
    $(".containers").hide();
    $(".containers1").fadeIn(500);
    $(".containers2").hide();
}

function show3()
{
    $(".containers").hide();
    $(".containers1").hide();
    $(".containers2").fadeIn(500);
}

window.addEventListener('message', function(e)
{
    switch(e.data.eventName){
        case 'loadProgress':
            document.querySelector('.loadingbar-loaded').style.width = (e.data.loadFraction * 100) + '%'
            break;
        case 'onLogLine':
            document.querySelector('.loadingbar-loaded').style.width = '100%'
            break;
    }
});