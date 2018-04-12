function newPatientValidation(){
   var txtFname = document.getElementById('txtFname').value;
   var txtNic = document.getElementById('txtNic').value;
   var dob = document.getElementById('dob').value;
   var txtJob = document.getElementById('txtJob').value;
   var homeAdd = document.getElementById('homeAdd').value;
   var number = document.getElementById('number').value;
   
   if(!txtFname){
       alert('Parient Name Must be fild out.');
       return false;
   }
   else if(!txtNic){
       alert('Parient NIC must be fild out.');
       return false;
   }
   else if(!dob){
       alert('Parient Date Of Birth must be fild out.');
       return false;
   }
   else if(!txtJob){
       alert('Parient Job must be fild out.');
       return false;
   }
   else if(!homeAdd){
       alert('Parient Address must be fild out.');
       return false;
   }
   else if(!number){
       alert('Parient Phone Number must be fild out.');
       return false;
   }
  
  
}
