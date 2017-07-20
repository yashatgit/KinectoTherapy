var q = 1;
$(document).ready(function(){
	$('#red').click(function() {
		var pjs = Processing.getInstanceById('contentTool');
		pjs.setDoodleColor(255,0,0);
	});
	
	$('#blue').click(function() {
		var pjs = Processing.getInstanceById('contentTool');
		pjs.setDoodleColor(0,0,255);
	});
	
	$('#green').click(function() {
		var pjs = Processing.getInstanceById('contentTool');
		pjs.setDoodleColor(0,255,0);
	});
	
	$('#black').click(function() {
		var pjs = Processing.getInstanceById('contentTool');
		pjs.setDoodleColor(0,0,0);
	});
	
	
	$('#buttonForEdit').click(function() {
		$('#text_field').focus();
	});

	$('#text_field').keydown(function() {
		var t = setTimeout(onTextInput, 25);
	});
	
	$('#upload').click(function(){
		document.getElementById('uploadImage').style.display = 'inline';
		$('#uploadImage').click();
	});
});

function handleKeyDown(){
	//setTimeout(alert(document.getElementById('inputtext').value), 250);
	setTimeout(displayNow, 25);
}

function displayNow(){
	//alert("wait man!");
	var pjs = Processing.getInstanceById('contentTool');
	pjs.displayKeyTyped(document.getElementById('inputtext').value);
}

function handleInputBoxBlur() {
    document.getElementById('inputbox').style.display = 'none';
}

function handleForm() {
    var pjs = Processing.getInstanceById('contentTool');
    document.getElementById('textmode_div').style.display = 'none';
    if(document.getElementById('inputtext').value !== "") {
        document.getElementById('inputtext').value = "";
    }
}

function getUserNick() {
    return document.getElementById("interactionAuthor").value;
}

function displayTextBox(x, y){
	document.getElementById('textmode_div').style.display = 'inline';
	$('#inputtext').focus();
	
	var s = findPos(document.getElementById('contentTool'));
	document.getElementById('textmode_div').style.position = 'absolute';
	document.getElementById('textmode_div').style.left = x + s[0] + "px";
	document.getElementById('textmode_div').style.top = y+ s[1] + 10 + "px"; 
}

function startInteraction() {
	var pjs = Processing.getInstanceById('contentTool');
	newSlide();
	pjs.setInputStateControl(4);
	pjs.instantiateInteraction();
    pjs.setCursor();
}

var input_state_control = 0;
var showButtons = false;
function changeState(input_state){
	var pjs = Processing.getInstanceById('contentTool');
	pjs.setInputStateControl(input_state);
    pjs.setCursor();
}

function testResults (form) {
	var testVar = form.inputbox.value;
	var pjs = Processing.getInstanceById('contentTool');
	pjs.setWordId(testVar);
}

function findPos(obj) {
	var curleft = 0;
	var curtop = 0;
	if (obj.offsetParent) {
		do {
			curleft += obj.offsetLeft;
			curtop += obj.offsetTop;
		} while (obj = obj.offsetParent);
	}
	return [curleft,curtop];
}

function xy() {
	var x;
	var pjs = Processing.getInstanceById('contentTool');
	if(pjs.getInputStateControl() == 3){ // select mode	
         //alert("el: "+ pjs.get_num_of_selected_parts());
	    if(pjs.get_num_of_selected_parts() == 0) {
		x=document.getElementById('form_div');
		x.style.display='none';
		document.getElementById('type_div').innerHTML = '<p>' + $('#type_div').text() + '</p>';
	    } else {//if (pjs.get_num_of_selected_parts() != 0) {//deselection happens after this
		x=document.getElementById('form_div');
                wordId = pjs.getWordId();
		if(wordId != 0) { // not associated with anything
		    document.getElementById('inputbox').value = getWord(wordId);
		    divWords = $('#type_div').text();
		    document.getElementById('type_div').innerHTML = '<p>' + divWords + '</p>';
                    splitWords = divWords.split(" ");
		    splitWords[wordId-1] = '<span style="background-color:#FFFF66">' + splitWords[wordId-1] + '</span>';
                    document.getElementById('type_div').innerHTML = '<p>' + splitWords.join(" ") + '</p>';
		} else {
		    document.getElementById('inputbox').value = "";
                }
		x.style.position='absolute';
		x.style.display='inline';
		var s = findPos(document.getElementById('contentTool'));
		x.style.left = pjs.get_final_min_x() + s[0] + "px";
		x.style.top = pjs.get_final_max_y() + s[1] + 10 + "px";
	    }
    }
}

function getWord( wordID){
	var words = $('#type_div').text().split(" ");
	return words[wordID-1];
}

var imgs = new Array();

oFReader = new FileReader(), rFilter = /^(image\/bmp|image\/cis-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x-cmu-raster|image\/x-cmx|image\/x-icon|image\/x-portable-anymap|image\/x-portable-bitmap|image\/x-portable-graymap|image\/x-portable-pixmap|image\/x-rgb|image\/x-xbitmap|image\/x-xpixmap|image\/x-xwindowdump)$/i;

var selsetX = new Array();
var selsetY = new Array();
var selState = new Array();
var slideNo = new Array();
oFReader.onload = function (oFREvent) {
	//alert("File should be loaded now. "+oFREvent.target.result);
	var img = new Image();
	var isSelected = false;
	img.src = oFREvent.target.result;
	selState.push(isSelected);
	imgs.push(img);
	selsetX.push(0);
	selsetY.push(0);
	alert(currSlide);
	slideNo.push(currSlide);
	//alert(imgs.length);
}

function loadImageFile() {
	if (document.getElementById("uploadImage").files.length == 0) { return; }
	var oFile = document.getElementById("uploadImage").files[0];
	if (!rFilter.test(oFile.type)) { alert("You must select a valid image file!"); return; }
	oFReader.readAsDataURL(oFile);
	document.getElementById("uploadImage").style.display = 'none';
}

var moveImage = -1;
function checkClick(){
	var pjs = Processing.getInstanceById('contentTool');
	for(i=0; i< imgs.length; i++){
		if(pjs.getMouseX()>selsetX[i] && pjs.getMouseX()<(selsetX[i] + imgs[i].width) && pjs.getMouseY()>selsetY[i] && pjs.getMouseY()<(selsetY[i] + imgs[i].height) && slideNo[i] == currSlide){
			moveImage = i;
			selState[i] = false;
		}
		else{
			selState[i] = false;
		}
	}	
	if(moveImage != -1){
		selState[moveImage] = true;
	}
}

function clickRelease(){
	moveImage = -1;
}

function changeMovedImage(){
	var pjs = Processing.getInstanceById('contentTool');
	if(pjs.movingImage()){
		if(moveImage != -1){
			//If more than one of them is selected then move the topmost image
			selsetX[moveImage] = selsetX[moveImage] + pjs.getDeltaChangeX();
			selsetY[moveImage] = selsetY[moveImage] + pjs.getDeltaChangeY();
		}	
	}
}

function jsStaticImageDraw() {
	var pjs = Processing.getInstanceById('contentTool');
	var ctx = document.getElementById('contentTool').getContext('2d');	
	for(i=0; i< imgs.length; i++){
		if(selState[i] && slideNo[i] == currSlide){
			ctx.fillStyle = "rgb(150,29,28)";
			ctx.fillRect (selsetX[i]-3,selsetY[i]-3,imgs[i].width + 6,imgs[i].height + 6);
		}
		if(slideNo[i] == currSlide){
			ctx.drawImage(imgs[i], selsetX[i], selsetY[i]);
		}
	}
}

function onSpeechInput(){
	if(document.getElementById('speech_field').value != null){
		document.getElementById('text_field').value = document.getElementById('text_field').value.concat(document.getElementById('speech_field').value, " ");
		document.getElementById('speech_field').value = null;
	}
	else
		setTimeout(onSpeechInput(), 250);
}


var isEnterEnabled = false;

function allowEnter(a) {
	isEnterEnabled = a;
}

// A mapping to detect 'delete' key in Chrome
var keys = {
	46  : 'del'
};

$("textarea").bind('keyup', function(e){
	$('#r').append( 'keyup (' + e.which + '): ' + (keys[e.which] || String.fromCharCode(e.which)) );
});
document.onkeydown=noEnter;

function noEnter(e) {
	var event = e || window.event;
	if (event.keyCode == 13 && !isEnterEnabled) {
		event.preventDefault();
		return false;
	}
	else if (event.keyCode == 46) {  // Delete key, works for Firefox, Chrome
		xy();
	}
}

var bound = false;
var count_f = 0;
$(document).ready(function() {
function bindJavascript() {
	var pjs = Processing.getInstanceById('contentTool');
	if (pjs != null) {
	    if (count_f >= 15) {
			pjs.bindJavascript(this);
			bound = true;
		}
		count_f++;
	}
	if (!bound) setTimeout(bindJavascript, 500);
}
bindJavascript();
});

var div_strng;
var txtfield_string;

function onTextInput(){
	document.getElementById('type_div').innerHTML = '<p>' + document.getElementById('text_field').value + '</p>'
}

function testResults (form) {
	var testVar = form.inputbox.value;
	var words = $('#type_div').text().split(" ");
	var word_id = 0; //global
	var text;
	var singleFound;
	var tempWord;
	var pjs = Processing.getInstanceById('contentTool');

	for(i=0; i< words.length; i++) {
		if(words[i] == testVar || words[i] == testVar + "," || words[i] == testVar + "." || words[i] == testVar + "!"){
			tempWord = words[i]
			words[i] = '<span' + ' id="' + word_id + 'span' + '"' + 'style="background-color:#FFFF66" onclick="fixWord()">' + words[i] + '</span>';
			word_id++;
			singleFound = i;
		}
	}
	
	if(word_id == 1){
		words[singleFound] = '<span style="background-color:#FFFF66">' + tempWord + '</span>';
		pjs.setWordId(singleFound+1);
	}

	if(word_id == 0){
		alert("No such word found");
	}

	text = words.join(" ");
	alert(text);
	document.getElementById('type_div').innerHTML = '<p>' + text + '</p>';
}
var clickedId;
function fixWord() {
	//clickedId = event.target.id;
	$("body").click(function(event) {
		alert(event.target.id);
		clickedId = event.target.id;
	});
	
	var repeated_word_id = clickedId.substr(0,1);
	var pjs = Processing.getInstanceById('contentTool');
	var repeated_word_reference = 0;
	var wordInside = document.getElementById(clickedId).innerHTML;
	var CheckPresent = $('#type_div').text().split(" ");
	alert(CheckPresent);
	for(i=0; i<CheckPresent.length; i++) {
		if(CheckPresent[i] == wordInside) {
			if(repeated_word_id == repeated_word_reference.toString()){
				alert("WordID is: " + (i+1));
				CheckPresent[i] = '<span style="background-color:#FFFF66">' + CheckPresent[i] + '</span>';
				document.getElementById('type_div').innerHTML = '<p>' + CheckPresent.join(" ") + '</p>';
				pjs.setWordId(i+1);
				return;
			}
		else
			repeated_word_reference++;
		}
	}
}

function getTextBox() {
	if(document.getElementById('buttonForEdit').value == 'Edit'){
		document.getElementById('text_field').style.display = 'inline';
		document.getElementById('buttonForEdit').value = 'Done';
		document.getElementById('type_div').style.height = '330px';
	}
	else if(document.getElementById('buttonForEdit').value == 'Done'){
		document.getElementById('text_field').style.display = 'none';
		document.getElementById('buttonForEdit').value = 'Edit';
		document.getElementById('type_div').style.height = '430px';
	}
}

function setFontSize(size) {
    pjs = Processing.getInstanceById('contentTool');
    pjs.setFontSize(size);
}

function interactionTitle() {
    return document.getElementById("interactionTitle").value;
}
