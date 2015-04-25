function toggleRightImage(obj)
{
    var img =  document.getElementById('img2');
    console.log(img + " " + img.style);
    var style = img.style;
    if(style.length == 0 || style.display == 'inline')
	img.style.display = 'none';
    else
	img.style.display = 'inline';        
}


function changeImage(obj) 
{
    var img =  document.getElementById('img1');
//    alert('changing image ' + obj.value + " " + img.src);
    img.src = obj.value;

    if(data) {
	showAnimalText(obj.value);
     }
}

function showAnimalText(img)
{
    var p = document.getElementById('announce')
    for(var key in data) {
	var obj = data[key];
	if(obj[0] == img) {
	alert('key ' +  key + " " + obj[1]);
	    p.innerHTML = obj[1];
	    break;
	}
    }
}
