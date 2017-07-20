var bound = false;
var count = 0;
var endOfScript = false;
var AudioElement;

// Returns the json data transferred from server to client
function getSlideShowData() {
    return document.getElementById("slideShowData").value;
}

function checkIfPlayed() {
    var pjs = Processing.getInstanceById('ContentViewer'); 
    //console.log("time: "+AudioElement.currentTime, ", dur: "+AudioElement.duration);
    if(AudioElement.currentTime == AudioElement.duration && AudioElement.duration !== 0) {
        console.log("time: "+AudioElement.currentTime, ", dur: "+AudioElement.duration);
        if(pjs.numberOfSlides() - 1 > pjs.currentSlide()) {
            pjs.incrementDisplay();
            playAudio();
        }
        else {
            endOfScript = true;
        }
    }
    if(!endOfScript) {
        setTimeout("checkIfPlayed()", 500);
    }
}

function playAudio() {
    $("#playButton").attr('class', 'btn disabled');
    $("#playButton").attr('onclick', "");                   // Disable the play button now
    AudioElement = document.createElement('audio');
    var pjs = Processing.getInstanceById('ContentViewer');
    tutorScript = pjs.getTutorScript();
    var words = tutorScript.split(' ');
    var URL = "http://synthesize.algorythm.us/index.php?text=" + words.join('-');
    $.get(URL, function(data) {
        AudioElement.setAttribute('src', 'http://synthesize.algorythm.us/ttsOutput/NULL/tts.wav');
        AudioElement.play();
        checkIfPlayed();
    });
}

$(document).ready(function() {
function bindJavascript() {
    var pjs = Processing.getInstanceById('ContentViewer');
    if (pjs !== null) {
        if (count > 2) {
            pjs.bindJavascript(this);
            bound = true;
        }
        count++;
    }
    if (!bound) {
        setTimeout(bindJavascript, 250);
    }
}
bindJavascript();


function previousSlide() {
    var pjs = Processing.getInstanceById('ContentViewer');
    pjs.decrementDisplay();
}

function nextSlide() {
    var pjs = Processing.getInstanceById('ContentViewer');
    pjs.incrementDisplay();
}
});

