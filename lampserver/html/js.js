
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    var d = today.getDate();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('hours').innerHTML =
    h;
    document.getElementById('minutes').innerHTML =
    m;
    document.getElementById('seconds').innerHTML =
    s;
    document.getElementById('days').innerHTML =
    d;

    var t = setTimeout(startTime, 500);
    console.log(h);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

var t = setTimeout(startTime, 500);
