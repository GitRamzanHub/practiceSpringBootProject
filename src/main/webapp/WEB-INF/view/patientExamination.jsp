<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper">
		<div class="row">
			<div class="col-12 grid-margin">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="card-title">Patient Examination</div>
						<div class="px-3 mt-1">
							<!-- <button class="btn btn-danger close-btn">
								
							</button> -->
							<a href="/dashboard"><i class="fa-solid fa-xmark"></i></a>
						</div>
					</div>
					<div class="card-body">
					<div id="patientExaminationTableDiv">
					<div class="col-12 d-flex justify-content-end pb-2 px-0">
						<button type="button" class="btn btn-primary" onclick="showForm()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>New</button>
					</div>
					<div class="table-responsive">
								<table class="table table-striped" id="patientExaminationTable">
									<thead class="text-primary">
										<tr>
											<th class="text-center">Sr. No.</th>
											<th class="text-center">Patient Name</th>
											<th class="text-center">Gender</th>
											<th class="text-center">Examination Date</th>
											<th class="text-center">Action</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
					</div>
					<div id="patientExaminationFormDiv" hidden="true">
						<form class="form-sample" id="patientExamination">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Patient </label>
										<input type="hidden" class="form-control" id="examId" name="examId">
										<!-- <div class="col-sm-2">
											
										</div> -->
										<div class="col-sm-9 ">
										<input type="hidden" class="form-control" id="patientId" name="patientId" value=""/>
											<input type="text" class="form-control" id="patientName" name="patientName"/>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-6 col-form-label text-right">Examination Date</label>
										<div class="col-sm-6">
											 <input type="text" class="form-control datepicker text-center" placeholder="DD/MM/YYYY" id="examDate" name="examDate" autocomplete="off" readonly>
											 <!-- <input type="date" class="form-control  text-center" placeholder="DD/MM/YYYY" id="examDate" name="examDate" autocomplete="off" readonly> -->
											 <small style="color: red;"></small>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Temperature </label>
										<div class="col-sm-3">
											<select class="form-control" id="temp" name="temp">
												<option value="">select</option>
												<option value="Afebrile">Afebrile</option><!-- No fever -->
												<!-- <option value="Normothermic">Normothermic</option>Normal body temperature
												<option value="Febrile">Febrile</option>Has a fever
												<option value="Pyrexia">Pyrexia</option>Fever (medical term)
												<option value="Hyperthermic">Hyperthermic</option>High body temperature
												<option value="Hypothermic">Hypothermic</option> --><!-- Low body temperature -->
											</select>
											<small style="color: red;"></small>
										</div>
										<label class="col-sm-3 col-form-label pl-0">°F</label>
										
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-center"></label>
									<label class="col-sm-3 col-form-label text-success font-weight-bold pl-0">CVS</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Pulse Rate</label>
										<div class="col-sm-3">
											<input type="text" class="form-control text-right" id="pulse" name="pulse" maxlength="10"/>
											<small style="color: red;"></small>
										</div>
										<label class="col-sm-1 col-form-label pl-0">/mnt</label>
										<label class="col-sm-2 col-form-label pl-0">P. Pulse </label> 
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="p_pulse" name="p_pulse">
												<option value="">select</option>
												<option value="+VE">Positive</option>
												<option value="-VE">Negative</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-success text-center">HS</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="cvs_hs" name="cvs_hs">
												<option value="">select</option>
												<option value="UNPURE">UNPURE</option>
												<option value="PURE">PURE</option>
											</select>
											<small style="color: red;"></small>
										</div>
										<label class="col-sm-3 col-form-label">Abdomen</label>
										<div class="col-sm-3">
											 <select class="form-control" id="abdomen" name="abdomen">
												<option value="">select</option>
												<option value="Soft">Soft</option>
												<option value="Tight">Tight</option>
												<option value=".">.</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										
										<label class="col-sm-3 col-form-label ">BP</label>
										<div class="col-sm-3 ">
											 <input type="text" name="bp" id="bp" class="form-control text-right" placeholder="000/000">
											 <small style="color: red;"></small>
										</div>
										<label class="col-sm-1 col-form-label px-0">mmhg</label>
										<label class="col-sm-2 col-form-label pl-0">JVP</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="jvp" name="jvp">
												<option value="">select</option>
												<option value="NOT RAISED">NOT RAISED</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-success text-center">Gallop</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="cvs_gall" name="cvs_gall">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
										
										<label class="col-sm-3 col-form-label ">Liver</label>
										<div class="col-sm-3 ">
											 <select class="form-control" id="lever" name="lever">
												<option value="">select</option>
												<option value="Palpable">Palpable</option>
												<option value="Not Palpable">Not Palpable</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										
										<label class="col-sm-3 col-form-label">Neck Stiff</label>
										<div class="col-sm-3 ">
											 <select class="form-control" id="neckStif" name="neckStif">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
										<label class="col-sm-1 col-form-label "></label>
										<label class="col-sm-2 col-form-label pl-0">Pallor</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="pallor" name="pallor">
												<option value="">select</option>
												<option value="+VE">Positive</option>
												<option value="-VE">Negative</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-success text-center">Murmur </label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="cvs_murm" name="cvs_murm">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
									
										<label class="col-sm-3 col-form-label">Spleen</label>
										<div class="col-sm-3 ">
											<select class="form-control" id="splin" name="splin">
												<option value="">select</option>
												<option value="Palpable">Palpable</option>
												<option value="Not Palpable">Not Palpable</option>
											</select>
											<small style="color: red;"></small>
										</div>
										
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										
										<label class="col-sm-3 col-form-label">
										Nails</label>
										<div class="col-sm-3">
											<select class="form-control" name="nails" id="nails">
												<option value="">select</option>
												<option value="NORMAL">NORMAL</option>
												<option value="PALE">PALE</option>
											</select>
											<small style="color: red;"></small>
										</div>
										<label class="col-sm-1 col-form-label"></label>
										<label class="col-sm-2 col-form-label pl-0">Nodules</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" name="nodules" id="nodules">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-center"></label>
									<label class="col-sm-3 col-form-label text-danger font-weight-bold pl-0">Respiratory</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6"></div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-danger text-center">AE</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control" id="rsae" name="rsae">
												<option value="">select</option>
												<option value="UNEQUAL">UNEQUAL</option>
												<option value="EQUAL">EQUAL</option>
											</select>
											<small style="color: red;"></small>
										</div>
									
										<label class="col-sm-3 col-form-label">CNS</label>
										<div class="col-sm-3">
											<select class="form-control" id="cns" name="cns">
												<option value="">select</option>
												<option value="NO NEURO.DEFICIT">NO NEURO.DEFICIT</option>
												<option value="NO NEUROLOGICAL DEFICIT">NO NEUROLOGICAL DEFICIT</option>
												<option value="NEUROLOGICAL DEFICIT">NEUROLOGICAL DEFICIT</option>
											</select>
											<small style="color: red;"></small>
										</div>
										
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row"></div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-danger text-center">Ronchi</label>
										<div class="col-sm-3 pl-0">
											 <select class="form-control" name="ronchi" id="ronchi">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
										
										<label class="col-sm-3 col-form-label">Cyanosis</label>
										<div class="col-sm-3">
											<select class="form-control" name="cyanos" id="cyanos">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								
								 <div class="col-md-6"></div>
							
							 <div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label text-danger text-center">Crept</label>
										<div class="col-sm-3 pl-0">
											<select class="form-control"  name="crept" id="crept">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
									
										<label class="col-sm-3 col-form-label">Icterus</label>
										<div class="col-sm-3">
											 <select class="form-control"  name="cterus" id="cterus">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div>
									</div>
								</div> 
								</div>
								<div class="row">
								<div class="col-md-6 "></div>
								<div class="col-md-6 ">
								<div class="form-group row">
								<label class="col-sm-3 col-form-label "></label>
								<div class="col-sm-3"></div>
								<label class="col-sm-3 col-form-label ">Oed. feet</label>
										<div class="col-sm-3">
											<select class="form-control" name="oedFeet" id="oedFeet">
												<option value="">select</option>
												<option value="YES">YES</option>
												<option value="NO">NO</option>
											</select>
											<small style="color: red;"></small>
										</div></div>
										</div>
								</div>
							<div class="row">
							<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label">Treatment</label>
									<div class="col-sm-9">
										<textarea class=" form-control" rows="4" name="treat" id="treat"></textarea>
										<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-center">Advice</label>
										<div class="col-sm-9 pl-0">
											<textarea class="form-control" rows="4" name="invAdv" id="invAdv"></textarea>
											<small style="color: red;"></small>
										</div>
									</div>
								</div>
								
							</div>
							<div class="row pt-2">
							<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label">Diet</label>
									<div class="col-sm-9">
										<textarea class=" form-control" rows="4" id="diet" name="diet"></textarea>
										<small style="color: red;"></small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
								
									<div class="form-group row">
										<label class="col-sm-3 col-form-label text-center">Message</label>
										<div class="col-sm-9 pl-0">
											<textarea class="form-control" rows="4" id="message1" name="message1"></textarea>
										</div>
									</div>
								</div>
							</div> 
							<div class="col-12 d-flex justify-content-end pt-2">
								
								
								<button type="button" class="btn btn-success mr-2" id="submit"
									onclick="createPatientExamination()">Submit</button>
								<button type="button" class="btn btn-success mr-2" id="modify"
									onclick="updatePatientExamination()" hidden="true">Modify</button>

								<button type="button" class="btn btn-success mr-2" id="delete"
									onclick="deletePatientExamination()" hidden="true">Delete</button>
								<button type="button" class="btn btn-danger" onclick="clearData();">Cancel</button>
							</div>

						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="patientModal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary p-2">
					<h5 class="modal-title text-white">Patient List</h5>
					<button type="button" class="btn-close btn btn-danger btn-sm"
						data-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table" id="patientTable">
							<thead class="bg-primary text-white">
								<tr>
									<!-- <th class="fw-bold text-center"><input type='checkbox'
										name='checkboxAll' id='checkboxAll'
										onclick=""></th> -->
									<th class="fw-bold text-center">Sr. No.</th>
									<th class="fw-bold text-center">Patient Name</th>
									<th class="fw-bold text-center">Examination Date</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-sm"
						data-dismiss="modal" onclick="">OK</button>
					<button type="button" class="btn btn-danger btn-sm"
						data-dismiss="modal">Cancel</button>

				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function() {
 	displayPatientList();
 	validateForm();
 	console.log(typeof $.validator.addMethod);
//  	$('#bp').mask('000/000');

 	$.validator.addMethod("bpFormat", function(value, element) {
 		  return this.optional(element) || /^\d{1,3}\/\d{1,3}$/.test(value);
 		}, "Please enter blood pressure in the format systolic/diastolic (e.g., 120/80).");
});

function showForm() {
// 	$("#Save").val("Save");
	$('#patientExaminationFormDiv').attr("hidden", false);
	$('#patientExaminationTableDiv').attr("hidden", true);
}

function showTable() {
// 	$("#Save").val("Save");
	$('#patientExaminationFormDiv').attr("hidden", true);
	$('#patientExaminationTableDiv').attr("hidden", false);
}


function displayPatientList() {
	$.ajax({
		url : "${pageContext.request.contextPath}/fetchPatient",
		type : "get",
		dataType : 'json',
		success : function(resp) {
			//console.log("displayTenderCount resp :" + resp.code);
			$("#patientExaminationTable tbody").empty();
			var txt = [];
			let patientList = resp.reponse;
			if (resp.reponse) {
				$.each(patientList,function(key, value) {
					if ($.fn.DataTable.isDataTable('#patientExaminationTable')) {
						$('#patientExaminationTable').DataTable().destroy();
					}
					keyVal = key;
// 					let patient = patientList[keyVal]['patient'];
						let patient = value && value.patient;
						let examId = (value && value.examId) ? patientList[keyVal]['examId'] : '';
// 					 console.log(examId);
					txt.push([
						keyVal + 1,
						patient ? patientList[keyVal]['patient'].patientName : '',
						patient ? patientList[keyVal]['patient'].patientGender : '',
						(value && value.examDate) ? convertToDisplayFormat(patientList[keyVal]['examDate']) : '',
				        "<center>"
				        + "<td><button class='btn btn-primary btn-xs no-radius-btn text-center' onclick='displayPatientExamListById("
				        + examId + ",\"M\")'>"
				        + "<i class='fa-regular fa-pen-to-square'></i></button>"
				        + "<button class='btn btn-danger btn-xs no-radius-btn text-center' style='margin-left: 5px;' onclick='displayPatientExamListById("
				        + examId + ",\"D\")'>"
				        + "<i class='fa-regular fa-trash-can'></i></button></td></center>" ]);
						$('#patientExaminationTable').DataTable({
							data : txt,
							"autoWidth" : false,
							deferRender : true,
							pageLength : 10,
							responsive : true,
							scrollCollapse : true,
							"lengthMenu" : [[5,10,25,50,-1 ],
											[5,10,25,50,"All" ] ],
							"columnDefs" : [{
								className : 'text-left',
								targets : [ 1, 2 ]
							},{
								className : 'text-center',
								targets : [0,3 ]
							}],
							});
						});
				} else {
					$("#patientExaminationTable tbody").empty();
					$('#patientExaminationTable').append("<td colspan='5' class='text-center'>Records not found</td>");
				}
			},error : function(error) {
// 				console.log("error :" + JSON.stringify(error));
				$("#patientExaminationTable tbody").empty();
				$('#patientExaminationTable').append("<td colspan='5' class='text-center'>Records not found</td>");
			}
		});
	}
	
function createPatientExamination() {
	var examId = $("#examId").val();
	var examDate = convertDateToSqlFormat($("#examDate").val());
	var patientId = $("#patientId").val();
	var temp = $("#temp").val();
	var pulse = $("#pulse").val();
	var p_pulse = $("#p_pulse").val();
	var respi = $("#respi").val();
	var bp = $("#bp").val();
	var cyanos = $("#cyanos").val();
	var cvs_hs = $("#cvs_hs").val();
	var cvs_gall = $("#cvs_gall").val();
	var cvs_murm = $("#cvs_murm").val();
	var cns = $("#cns").val();
	var invAdv = $("#invAdv").val();
	var diet = $("#diet").val();
	var jvp = $("#jvp").val();
	var oedFeet = $("#oedFeet").val();
	var pallor = $("#pallor").val();
	var nails = $("#nails").val();
	var noduls = $("#nodules").val();
	var cterus = $("#cterus").val();
	var neckStif = $("#neckStif").val();
	var rsae = $("#rsae").val();
	var ronchi = $("#ronchi").val();
	var crept = $("#crept").val();
	var lever = $("#lever").val();
	var splin = $("#splin").val();
	var treat = $("#treat").val();
	var treat1 ="";
	var message1 = $("#message1").val();
	var message2 = "";
	var soft = $("#abdomen").val();
	
	var datajsp = {
			examId : examId,
			examDate : examDate,
			patientId : patientId,
			temp : temp,
			pulse : pulse,
			p_pulse : p_pulse,
			respi : respi,
			bp :bp,
			cyanos : cyanos,
			cvs_hs : cvs_hs,
			cvs_gall : cvs_gall,
			cvs_murm : cvs_murm,
			cns : cns,
			invAdv : invAdv,
			diet :diet,
			jvp : jvp,
			oedFeet : oedFeet,
			pallor : pallor,
			nails : nails,
			noduls : noduls,
			cterus : cterus,
			neckStif : neckStif,
			rsae : rsae,
			ronchi : ronchi,
			crept : crept,
			soft : soft,
			lever :lever,
			splin : splin,
			treat : treat,
			treat1 : treat1,
			message1 : message1,
			message2 : message2,
			status : "E",
			patient : {
				patientId : patientId
			}
		};
 	if($('#patientExamination').valid()){
	$.ajax({
		url : '${pageContext.request.contextPath}/savePatient',
		type : 'POST',
		contentType : "application/json", // correct
		dataType : 'json',
		data : JSON.stringify(datajsp),
		success : function(resp) {
			if(resp.reponse){
				Swal.fire({
					html : '<div class="lg fs-4 text-primary text-start"><i class="fa-regular fa-circle-check"></i> Success</div><div class="ps-2 py-2 text-start fs-6 fw-bold">Data Saved Successfully</div><div class="text-end"><button class="btn btn-primary btn-sm mt-1 no-radius-btn" onclick="Swal.close();displayPatientList()">OK</button></div>',
					showConfirmButton : false,
				});
// 				showTable();
				clearData();
			}else{
				Swal.fire({
					html : '<div class="lg fs-4 text-danger text-start"><i class="fa-regular fa-circle-xmark"></i> Error</div><div class="ps-2 py-2 text-start fs-6 fw-bold">'+resp.msg+'</div><div class="text-end"><button class="btn btn-primary btn-sm mt-1 no-radius-btn" onclick="Swal.close();">OK</button></div>',
					showConfirmButton : false,
				});
			}
		},
	});
 	}
}
	
function displayPatientExamListById(examId, flag) {
	$.ajax({
		url : '${pageContext.request.contextPath}/patientExmanition/'+examId,
		type : 'get',
		dataType : 'json',
		success : function(resp) {
			let patientList = resp.reponse;
// 			console.log("patientList::"+patientList);
			$.each(patientList, function(key, value) {
				var nkey = key + 1;
// 				alert(patientList.patientName); 
				$("#patientId").val(patientList[key]["patient"].patientId);
				$("#patientName").val(patientList[key]["patient"].patientName);
				$("#examId").val(patientList[key]["examId"]);
				$("#examDate").val(convertToDisplayFormat(patientList[key]["examDate"]));
				$("#pulse").val(patientList[key]["pulse"]);
				$("#cvs_hs").val(patientList[key]["cvs_hs"]);
				$("#temp").val(patientList[key]["temp"]);
				$("#abdomen").val(patientList[key]["soft"]);
				$("#p_pulse").val(patientList[key]["p_pulse"]);
				$("#cvs_gall").val(patientList[key]["cvs_gall"]);
				$("#lever").val(patientList[key]["lever"]);
				$("#bp").val(patientList[key]["bp"]);
				$("#cvs_murm").val(patientList[key]["cvs_murm"]);
				$("#splin").val(patientList[key]["splin"]);
				$("#jvp").val(patientList[key]["jvp"]);
				$("#neckStif").val(patientList[key]["neckStif"]);
				$("#rsae").val(patientList[key]["rsae"]);
				$("#cns").val(patientList[key]["cns"]);
				$("#pallor").val(patientList[key]["pallor"]);
				$("#ronchi").val(patientList[key]["ronchi"]);
				$("#cyanos").val(patientList[key]["cyanos"]);
				$("#nails").val(patientList[key]["nails"]);
				$("#crept").val(patientList[key]["crept"]);
				$("#cterus").val(patientList[key]["cterus"]);
				$("#nodules").val(patientList[key]["noduls"]);
				$("#oedFeet").val(patientList[key]["oedFeet"]);
				$("#treat").text(patientList[key]["treat"]);
				$("#invAdv").text(patientList[key]["invAdv"]);
				$("#diet").text(patientList[key]["diet"]);
				$("#message1").text(patientList[key]["message1"]);
				
			});
			showForm();
			if(flag == "M"){
				$("#submit").prop("hidden", true);  
				$("#modify").prop("hidden", false);
				$("#delete").prop("hidden", true);
				$("#patientName").prop("disabled", true); 
			}else{
				$("#submit").prop("hidden", true);
				$("#delete").prop("hidden", false);
				$("#modify").prop("hidden", true);
			}
		}
	});
}

$("#patientName").click(function() {
	patientList();
	$("#patientModal").modal('show');
});

function patientList() {
	$.ajax({
		url : "${pageContext.request.contextPath}/patients",
		type : "get",
		dataType : 'json',
		success : function(resp) {
			let patientList = resp.reponse;
			let data = [];
			if ($.fn.DataTable.isDataTable('#patientTable')) {
				$('#patientTable').DataTable().destroy();
			}
			$.each(patientList, function(key, value) {
				var nkey = key + 1;
				data.push([ patientList[key]['patientId'], 
					patientList[key]['patientName'],
					patientList[key]['registrationDate'] ]);
			});
			$('#patientTable').DataTable(
					{
						data : data,
						"autoWidth" : false,
						deferRender : true,
						pageLength : 10,
						responsive : true,
						scrollCollapse : true,
						"lengthMenu" : [ [ 5, 10, 25, 50, -1 ],
								[ 5, 10, 25, 50, "All" ] ],

								"columnDefs" : [ {
									className : 'text-center',
									targets : [ 0,  2]
								}, {
									className : 'text-left',
									targets : [ 1 ]
								},  ],
					});
		},
	});

$('#patientTable').on('click','tr',function() {
	$(this).addClass('selected').siblings().removeClass('selected');
	var value = $(this).find('td:first').html();
	patientListSelect(value);
				//alert(value);
	$("#patientModal").modal('hide');
});
}

function patientListSelect(patientId) {
	$.ajax({
		url : '${pageContext.request.contextPath}/patient/'+patientId,
		type : 'get',
		dataType : 'json',
		success : function(resp) {
			let patientList = resp.reponse;
// 			console.log("patientList::"+patientList);
			$.each(patientList, function(key, value) {
				var nkey = key + 1;
// 				alert(patientList.patientName); 
				$("#patientId").val(patientList.patientId);
				$("#patientName").val(patientList.patientName);
				$("#patientModal").modal('hide');
			});
		}
	});
}

function updatePatientExamination() {
	var examId = $("#examId").val();
	var examDate = convertDateToSqlFormat($("#examDate").val());
	var patientId = $("#patientId").val();
	var temp = $("#temp").val();
	var pulse = $("#pulse").val();
	var p_pulse = $("#p_pulse").val();
	var respi = $("#respi").val();
	var bp = $("#bp").val();
	var cyanos = $("#cyanos").val();
	var cvs_hs = $("#cvs_hs").val();
	var cvs_gall = $("#cvs_gall").val();
	var cvs_murm = $("#cvs_murm").val();
	var cns = $("#cns").val();
	var invAdv = $("#invAdv").val();
	var diet = $("#diet").val();
	var jvp = $("#jvp").val();
	var oedFeet = $("#oedFeet").val();
	var pallor = $("#pallor").val();
	var nails = $("#nails").val();
	var noduls = $("#nodules").val();
	var cterus = $("#cterus").val();
	var neckStif = $("#neckStif").val();
	var rsae = $("#rsae").val();
	var ronchi = $("#ronchi").val();
	var crept = $("#crept").val();
	var lever = $("#lever").val();
	var splin = $("#splin").val();
	var treat = $("#treat").val();
	var treat1 ="";
	var message1 = $("#message1").val();
	var message2 = "";
	var soft = $("#abdomen").val();
	
	var datajsp = {
			examId : examId,
			examDate : examDate,
			patientId : patientId,
			temp : temp,
			pulse : pulse,
			p_pulse : p_pulse,
			respi : respi,
			bp :bp,
			cyanos : cyanos,
			cvs_hs : cvs_hs,
			cvs_gall : cvs_gall,
			cvs_murm : cvs_murm,
			cns : cns,
			invAdv : invAdv,
			diet :diet,
			jvp : jvp,
			oedFeet : oedFeet,
			pallor : pallor,
			nails : nails,
			noduls : noduls,
			cterus : cterus,
			neckStif : neckStif,
			rsae : rsae,
			ronchi : ronchi,
			crept : crept,
			soft : soft,
			lever :lever,
			splin : splin,
			treat : treat,
			treat1 : treat1,
			message1 : message1,
			message2 : message2,
			status : "E",
			patient : {
				patientId : patientId
			}
		};
	if($('#patientExamination').valid()){
	$.ajax({
		url : '${pageContext.request.contextPath}/patientExmanition/'+examId,
		type : 'PUT',
		contentType : "application/json", // correct
		dataType : 'json',
		data : JSON.stringify(datajsp),
		success : function(resp) {
			if(resp.reponse){
				Swal.fire({
					html : '<div class="lg fs-4 text-primary text-start"><i class="fa-regular fa-circle-check"></i> Success</div><div class="ps-2 py-2 text-start fs-6 fw-bold">Data Update Successfully</div><div class="text-end"><button class="btn btn-primary btn-sm mt-1 no-radius-btn" onclick="Swal.close();displayPatientList()">OK</button></div>',
					showConfirmButton : false,
				});
// 				showTable();
				clearData();
			}else{
				Swal.fire({
					html : '<div class="lg fs-4 text-danger text-start"><i class="fa-regular fa-circle-xmark"></i> Error</div><div class="ps-2 py-2 text-start fs-6 fw-bold">'+resp.msg+'</div><div class="text-end"><button class="btn btn-primary btn-sm mt-1 no-radius-btn" onclick="Swal.close();">OK</button></div>',
					showConfirmButton : false,
				});
			}
		},
	});
	}
}

function deletePatientExamination() {
	var examId = $("#examId").val();
	var examDate = convertDateToSqlFormat($("#examDate").val());
	var patientId = $("#patientId").val();
	var temp = $("#temp").val();
	var pulse = $("#pulse").val();
	var p_pulse = $("#p_pulse").val();
	var respi = $("#respi").val();
	var bp = $("#bp").val();
	var cyanos = $("#cyanos").val();
	var cvs_hs = $("#cvs_hs").val();
	var cvs_gall = $("#cvs_gall").val();
	var cvs_murm = $("#cvs_murm").val();
	var cns = $("#cns").val();
	var invAdv = $("#invAdv").val();
	var diet = $("#diet").val();
	var jvp = $("#jvp").val();
	var oedFeet = $("#oedFeet").val();
	var pallor = $("#pallor").val();
	var nails = $("#nails").val();
	var noduls = $("#nodules").val();
	var cterus = $("#cterus").val();
	var neckStif = $("#neckStif").val();
	var rsae = $("#rsae").val();
	var ronchi = $("#ronchi").val();
	var crept = $("#crept").val();
	var lever = $("#lever").val();
	var splin = $("#splin").val();
	var treat = $("#treat").val();
	var treat1 ="";
	var message1 = $("#message1").val();
	var message2 = "";
	var soft = $("#abdomen").val();
	
	var datajsp = {
			examId : examId,
			examDate : examDate,
			patientId : patientId,
			temp : temp,
			pulse : pulse,
			p_pulse : p_pulse,
			respi : respi,
			bp :bp,
			cyanos : cyanos,
			cvs_hs : cvs_hs,
			cvs_gall : cvs_gall,
			cvs_murm : cvs_murm,
			cns : cns,
			invAdv : invAdv,
			diet :diet,
			jvp : jvp,
			oedFeet : oedFeet,
			pallor : pallor,
			nails : nails,
			noduls : noduls,
			cterus : cterus,
			neckStif : neckStif,
			rsae : rsae,
			ronchi : ronchi,
			crept : crept,
			soft : soft,
			lever :lever,
			splin : splin,
			treat : treat,
			treat1 : treat1,
			message1 : message1,
			message2 : message2,
			status : "E",
			patient : {
				patientId : patientId
			}
		};
	if($('#patientExamination').valid()){
	$.ajax({
		url : '${pageContext.request.contextPath}/patientExmanition/'+examId,
		type : 'DELETE',
		contentType : "application/json", // correct
		dataType : 'json',
		data : JSON.stringify(datajsp),
		success : function(resp) {
			if(resp.reponse){
				Swal.fire({
					html : '<div class="lg fs-4 text-primary text-start"><i class="fa-regular fa-circle-check"></i> Success</div><div class="ps-2 py-2 text-start fs-6 fw-bold">Data Deleted Successfully</div><div class="text-end"><button class="btn btn-primary btn-sm mt-1 no-radius-btn" onclick="Swal.close();displayPatientList()">OK</button></div>',
					showConfirmButton : false,
				});
// 				showTable();
				clearData();
			}else{
				Swal.fire({
					html : '<div class="lg fs-4 text-danger text-start"><i class="fa-regular fa-circle-xmark"></i> Error</div><div class="ps-2 py-2 text-start fs-6 fw-bold">'+resp.msg+'</div><div class="text-end"><button class="btn btn-primary btn-sm mt-1 no-radius-btn" onclick="Swal.close();">OK</button></div>',
					showConfirmButton : false,
				});
			}
		},
	});
	}
}

function clearData() {
    $('#patientExamination')[0].reset();
    $('#examId, #patientId, #patientName, #examDate, #pulse, #cvs_hs, #temp, #abdomen, #p_pulse, #cvs_gall, #lever').val('');
	$("#bp").val('');
	$("#cvs_murm").val('');
	$("#splin").val('');
	$("#jvp").val('');
	$("#neckStif").val('');
	$("#rsae").val('');
	$("#cns").val('');
	$("#pallor").val('');
	$("#ronchi").val('');
	$("#cyanos").val('');
	$("#nails").val('');
	$("#crept").val('');
	$("#cterus").val('');
	$("#nodules").val('');
	$("#oedFeet").val('');
	$("#treat").text('');
	$("#invAdv").text('');
	$("#diet").text('');
	$("#message1").text('');
	$("#submit").prop("hidden", false);  
	$("#modify").prop("hidden", true);
	$("#delete").prop("hidden", true);
    showTable();
    $("#patientName").prop("disabled", false);
    
    const form = $("#patientExamination");
    const validator = form.validate();
    validator.resetForm();
    form.find("input.error").removeClass("error");
    form.find("label.error").remove();
    form.find("small").empty();

}



function validateForm() {  
    $("#patientExamination").validate({
//	    formValidator = $("#compositionForm").validate({
        ignore: [],
        rules: {
            "patientName": { required: true },
            "examDate": { required: true },
            "pulse": { required: true, digits: true, range: [40, 180]  },
            "cvs_hs":{ required: true  },
            "temp":{ required: true  },
            "abdomen":{ required: true },
            "p_pulse":{ required: true  },
            "cvs_gall":{ required: true },
            "lever":{ required: true },
            "bp":{ required: true, maxlength: 6, bpFormat: true },
            "cvs_murm":{ required: true },
            "splin":{ required: true },
            "jvp":{ required: true },
            "neckStif":{ required: true },
            "rsae":{ required: true },
            "cns":{ required: true },
            "pallor":{ required: true },
            "ronchi":{ required: true },
            "cyanos":{ required: true },
            "nails":{ required: true },
            "crept":{ required: true },
            "cterus":{ required: true },
            "nodules":{ required: true },
            "oedFeet":{ required: true },
            "treat":{ required: true },
            "invAdv":{ required: true },
            "diet":{ required: true }
        },
        messages: {
        	"patientName": {  required: "Please enter patient name."  },
            "examDate": { required: "Please enter date." },
            "pulse": { required: "Please enter pulse rate." , digits: "Please enter only numeric digits.", range: "Pulse rate must be between 40 and 180 bpm."},
            "cvs_hs":{ required: "Please enter HS." },
           	"temp":{ required: "Please select temprature." },
           	"abdomen":{ required: "Please select abdomen." },
            "p_pulse":{ required: "Please select p_pulse." },
            "cvs_gall":{ required: "Please select gallop." },
            "lever":{ required: "Please select lever."  },
            "bp":{ required: "Please enter bp.",maxlength: "BP cannot exceed 6 characters.",
            	bpFormat: "Please enter blood pressure in the format systolic/diastolic (e.g., 120/80)."  },
            "cvs_murm":{ required: "Please select murmur."  },
            "splin":{ required: "Please select spleen."  },
            "jvp":{ required: "Please select jvp."  },
            "neckStif":{ required: "Please select neck stiff."  },
            "rsae":{ required: "Please select AE."  },
            "cns":{ required: "Please select CNS."  },
            "pallor":{ required: "Please select pallor."  },
            "ronchi":{ required: "Please select ronchi."  },
            "cyanos":{ required: "Please select cyanos."  },
            "nails":{ required: "Please select nails."  },
            "crept":{ required: "Please select crept."  },
            "cterus":{ required: "Please select cterus."  },
            "nodules":{ required: "Please select nodules."  },
            "oedFeet":{ required: "Please select oed. feet."  },
            "treat":{ required: "Please enter treatment."  },
            "invAdv":{ required: "Please enter advice."  },
            "diet":{ required: "Please enter diet."  }
        },
        highlight: function (element) {
            $(element).addClass("error");
        },
        unhighlight: function (element) {
            $(element).removeClass("error");
            $(element).siblings('small').empty();
        },
        errorPlacement: function (error, element) {
            $(element).siblings('small').empty().html(error);
        }
    });
}
    
function convertDateToSqlFormat(dateStr) {
	  const parts = dateStr.split('-');
	  if (parts.length !== 3) return null;

	  const [day, month, year] = parts;
// 	  return `${year}-${month}-${day}`;
	  return year+'-'+month+'-'+day;
	}
	
function convertToDisplayFormat(sqlDate) {
	  const parts = sqlDate.split("-");
	  if (parts.length !== 3) return sqlDate; // fallback
	  return parts[2]+'-'+parts[1]+'-'+parts[0];
	}
</script>
</body>
</html>