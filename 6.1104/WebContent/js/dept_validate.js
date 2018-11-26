function validateDeptno(deptno){
	if(!(/\d{2}/.test(deptno))){
		document.getElementById("deptno_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">���ű�ű�������λ�����֣�</font>" ;
		return false ;
	} else {
		document.getElementById("deptno_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">���ű��������ȷ��</font>" ;
		return true ;
	}
}
function validateDname(dname){
	if(dname == ""){
		document.getElementById("dname_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">�������Ʋ���Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("dname_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">��������������ȷ��</font>" ;
		return true ;
	}
}
function validateLoc(job){
	if(job == ""){
		document.getElementById("loc_msg").innerHTML = "<img src=\"images/wrong.gif\">" + "<font color=\"red\">����λ�ò���Ϊ�գ�</font>" ;
		return false ;
	} else {
		document.getElementById("loc_msg").innerHTML = "<img src=\"images/right.gif\">" + "<font color=\"green\">����λ��������ȷ��</font>" ;
		return true ;
	}
}
function validate(f){
	return	validateDeptno(f.deptno.value) && 
			validateDname(f.dname.value) && 
			validateLoc(f.loc.value) ;
}