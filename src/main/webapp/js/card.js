/**
 * 
 */
function toggleDetails(cardEle){
	const content = cardEle.querySelector('.card-content');
	const arrow = cardEle.querySelector('.arrow');
	
	if(content.style.display === "none" || content.style.display === ""){
		content.style.display = "block";
		arrow.innerText = "▲";
	} 
	else{
		content.style.display = "none";
		arrow.innerText = "▼";
	}
}