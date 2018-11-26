function validateEmpno(empno){
	if(!(/\d{4}/.test(empno))){
		document.getElementById("empno_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">��Ա��ű�������λ�����֣�</font>" ;
		return false ;
	} else {
		document.getElementById("empno_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">��Ա���������ȷ��</font>" ;
		return true ;
	}
}
function validateEname(ename){
	if(ename == ""){
		document.getElementById("ename_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">��Ա��������Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("ename_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">��Ա����������ȷ��</font>" ;
		return true ;
	}
}
function validateJob(job){
	if(job == ""){
		document.getElementById("job_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">��Ա��������Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("job_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">��Ա����������ȷ��</font>" ;
		return true ;
	}
}
function validateHiredate(hiredate){
	if(!(/\d{4}-\d{2}-\d{2}/.test(hiredate))){
		document.getElementById("hiredate_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">��Ӷ�����������</font>" ;
		return false ;
	} else {
		document.getElementById("hiredate_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">��Ӷ����������ȷ��</font>" ;
		return true ;
	}
}
function validateSal(sal){
	if(!(/\d+.?\d*/.test(sal))){
		document.getElementById("sal_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">�������ʱ��������֣�</font>" ;
		return false ;
	} else {
		document.getElementById("sal_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">��������������ȷ��</font>" ;
		return true ;
	}
}
function validateComm(comm){
	if(!(/\d+.?\d*/.test(comm))){
		document.getElementById("comm_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">������������֣�</font>" ;
		return false ;
	} else {
		document.getElementById("comm_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">����������ȷ��</font>" ;
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