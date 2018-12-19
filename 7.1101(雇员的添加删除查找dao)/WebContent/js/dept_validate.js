function validateDeptno(deptno){
	if(!(/\d{2}/.test(deptno))){
		document.getElementById("deptno_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">部门编号必须是两位的数字！</font>" ;
		return false ;
	} else {
		document.getElementById("deptno_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">部门编号输入正确！</font>" ;
		return true ;
	}
}
function validateDname(dname){
	if(dname == ""){
		document.getElementById("dname_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">部门名称不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("dname_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">部门名称输入正确！</font>" ;
		return true ;
	}
}
function validateLoc(job){
	if(job == ""){
		document.getElementById("loc_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">部门位置不能为空！</font>" ;
		return false ;
	} else {
		document.getElementById("loc_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">部门位置输入正确！</font>" ;
		return true ;
	}
}
function validate(f){
	return	validateDeptno(f.deptno.value) && 
			validateDname(f.dname.value) && 
			validateLoc(f.loc.value) ;
}