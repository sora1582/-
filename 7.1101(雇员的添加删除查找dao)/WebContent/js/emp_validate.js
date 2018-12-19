function validateEmpno(empno){
	if(!(/\d{4}/.test(empno))){
		document.getElementById("empno_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">雇员编号必须是四位的数字！</font>" ;
		return false ;
	} else {
		document.getElementById("empno_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">雇员编号输入正确！</font>" ;
		return true ;
	}
}
function validateEname(ename){
	if(ename == ""){
		document.getElementById("ename_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">雇员姓名不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("ename_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">雇员姓名输入正确！</font>" ;
		return true ;
	}
}
function validateJob(job){
	if(job == ""){
		document.getElementById("job_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">雇员工作不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("job_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">雇员工作输入正确！</font>" ;
		return true ;
	}
}
function validateHiredate(hiredate){
	if(!(/\d{4}-\d{2}-\d{2}/.test(hiredate))){
		document.getElementById("hiredate_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">雇佣日期输入错误！</font>" ;
		return false ;
	} else {
		document.getElementById("hiredate_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">雇佣日期输入正确！</font>" ;
		return true ;
	}
}
function validateSal(sal){
	if(!(/\d+.?\d*/.test(sal))){
		document.getElementById("sal_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">基本工资必须是数字！</font>" ;
		return false ;
	} else {
		document.getElementById("sal_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">基本工资输入正确！</font>" ;
		return true ;
	}
}
function validateComm(comm){
	if(!(/\d+.?\d*/.test(comm))){
		document.getElementById("comm_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">奖金必须是数字！</font>" ;
		return false ;
	} else {
		document.getElementById("comm_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">奖金输入正确！</font>" ;
		return true ;
	}
}

function validate(f){
	return	validateEmpno(f.empno.value) && 
			validateEname(f.ename.value) && 
			validateJob(f.job.value) && 
			validateHiredate(f.hiredate.value) && 
			validateSal(f.sal.value) && 
			validateComm(f.comm.value) ;
}