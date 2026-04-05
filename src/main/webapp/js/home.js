function toggleSidebar(){
	let sidebar = document.getElementById("sidebar");
	sidebar.classList.toggle("active");
}

function showSignUp(){
	document.getElementById('signupModal').style.display="flex";
}
function hideSignUp(){
	document.getElementById('signupModal').style.display="none";
}

function toggleForms(){
	let register = document.getElementById("registerSec");
	let login = document.getElementById("loginSec");
	
	if(register.style.display === "none"){
		register.style.display = "block";
		login.style.display = "none";
	}
	else{
		register.style.display = "none";
		login.style.display = "block";
	}
}
function validateForm(){
    let name=document.forms["validForm"]["username"].value.trim();
    let email=document.forms["validForm"]["email"].value.trim();
    let pwd=document.forms["validForm"]["password"].value;

    document.getElementById("nameErr").innerHTML="";
    document.getElementById("emailErr").innerHTML="";
    document.getElementById("pwdErr").innerHTML="";

    let valid = true;

    if(name===""){
        document.getElementById("nameErr").innerHTML = "Name must be filled";
        valid = false;
    }

    const emailPat=/^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if(!email.match(emailPat)){
        document.getElementById("emailErr").innerHTML = "Enter a valid email address";
        valid = false;
    }

	const pwdPat = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/;
    if(pwd.length < 8){
		document.getElementById("pwdErr").innerHTML = "Too Short";
		valid = false;
	}
	else if(!pwdPat.test(pwd)){
		document.getElementById("pwdErr").innerHTML = "Password must have atleast one lower case, uppercase, digit, and special character"
		valid=false;
	}
	
    return valid;

}   

window.onload = function(){
	const param = new URLSearchParams(window.location.search);
	
	if(param.has('LoginError')){
		showSignUp();
		
		document.getElementById("registerSec").style.display = "none";
		document.getElementById("loginSec").style.display = "block";
		cleanURL();
	}
	
	if(param.has('SignupError')){
		showSignUp();
		document.getElementById("registerSec").style.display = "block";
		document.getElementById("loginSec").style.display = "none";
		cleanURL();
	}
}

function cleanURL(){
	const newUrl = window.location.pathname;
	window.history.replaceState({}, document.title, newUrl);
}
