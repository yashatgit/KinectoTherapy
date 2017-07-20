/**
 * A little insight into the working of this class:
 *
 */

var totalSlides = 0;    // 1'based
var currSlide = 0;      // 0'based
var blankSlideSrc;      // blank slide image thumbnail
var slideIndices = new Array();     // Array keeping a track of the id's of the slide elements
var uniqueId = 0;                   // Increments by 1 on every slide addition

// Call this when DOM is ready
function firstSlide() {
    var pjs = Processing.getInstanceById('contentTool');
    var canvas = document.getElementById("contentTool");
    blankSlideSrc = canvas.toDataURL("image/png");
    uniqueId = addSlide(uniqueId, blankSlideSrc);
    totalSlides++;              // now becomes 1
}

// Should be called on every newSlide() creation, and when flipping from a current slide
function saveSlide() {
    var canvas = document.getElementById("contentTool");
    var imgSrc = canvas.toDataURL("image/png");
    var pjs = Processing.getInstanceById('contentTool');
    var text = $('#type_div').text();
    pjs.saveSlide(currSlide, totalSlides, text);
    updateImage(slideIndices[currSlide], imgSrc);
}

function newSlide() {
    saveSlide();
    var pjs = Processing.getInstanceById('contentTool');
    uniqueId = addSlide(uniqueId, blankSlideSrc);
    totalSlides++;
    currSlide++; // as currSlide is 0'based
    document.getElementById('type_div').innerHTML = '<p>write here!</p>';
    $("textArea#text_field").val("");
    pjs.reset();
    pjs.setInputStateControl(0);    // Make it zero by default (override it later in case needed)
    pjs.setCursor();
}

/**
 * Change the thumbnail of the slide the user was previously doodling
 * @param a - The uniqueID which identifies the slide
 * @param imageSrc - The thumbnail to be associated with the slide
 */
function updateImage(a, imageSrc) {
    var x = '#'+a+'x';
    $(x).attr('src', imageSrc);
}

/**
 * Add a new slide after the currently used slide
 * @param slideIndex -- the unique elementID to be associated with the slide element
 * @param imageSrc -- thumbnail of the image to be used for the new slide (blank image thumbnail)
 */
function addSlide(slideIndex, imageSrc) {
    var ni = document.getElementById('thumbnails');
    var newli = document.createElement('li');

    newli.setAttribute('id', slideIndex+'li');
    newli.innerHTML = '<a href="#javascript:;" onclick="renderSlide('+slideIndex+')" title="'+slideIndex+'" class="t3"><img id="'+slideIndex+'x" src="" width="60" height="50" alt='+slideIndex+'  class="slideborder" /><span>'+(slideIndex+1)+'</span></a>';

        if (currSlide >= totalSlides-1) {
            ni.appendChild(newli);
            if (totalSlides == 0)
                slideIndices[0] = slideIndex;
            else {
                slideIndices[currSlide+1] = slideIndex;
            }
        }
        else {
            var existingli = document.getElementById(slideIndices[currSlide+1]+'li');
            ni.insertBefore(newli, existingli);
            slideIndices.splice(currSlide+1, 0, slideIndex);
        }
    if (totalSlides !== 0) {
        var previousSlide = document.getElementById(slideIndices[currSlide]+'x');
        previousSlide.setAttribute("class", "slidebordertrans");
    }
    var x = '#'+slideIndex+'x';
    $(x).attr('src', imageSrc);
    slideIndex++;
    return slideIndex;
}

function removeSlide() {
    liID = slideIndices[currSlide]+'li';
    if (totalSlides === 0) {
        alert('Sorry! Cannot remove');
        return;
    }
    var remSlide = currSlide;
    var pjs = Processing.getInstanceById('contentTool');
    var d = document.getElementById('thumbnails');
    var oldli = document.getElementById(liID);
    pjs.removeSlide(currSlide);
    d.removeChild(oldli);
    slideIndices.splice(remSlide, 1);
    totalSlides--;
    if (currSlide > remSlide)
        currSlide--;
    if (totalSlides === 0) {
        uniqueId = addSlide(uniqueId, blankSlideSrc);
        totalSlides = 1;
        currSlide = 0;
    }
}

function renderSlideFromProcessing(slide) {
    renderSlide(slideIndices[slide]);
}

/**
 * Render the slide which is clicked by the user.
 * This function is called when a slide image is clicked.
 * @param id - The unique identifier of the slide to be rendered
 */
function renderSlide(id) {
    var pjs = Processing.getInstanceById('contentTool');
    saveSlide();    // Save the previous slide
    var previousSlide = document.getElementById(slideIndices[currSlide]+'x');
    previousSlide.setAttribute("class", "slidebordertrans");
    document.getElementById(id+'x').setAttribute("class", "slideborder");
    currSlide = slideIndices.indexOf(id);
    var textArea = pjs.useSlide(currSlide);
    document.getElementById('type_div').innerHTML = '<p>'+ textArea +'</p>';
    $("textArea#text_field").val(textArea);
}


function publishSlide() {
    var pjs = Processing.getInstanceById('contentTool');
    // Save the current slide.
    saveSlide();
    var obj = pjs.getSlideContent();
    $.post('/publish/', obj, function(data) {});
    alert("Snap! It's published. go to gallery now");
}
