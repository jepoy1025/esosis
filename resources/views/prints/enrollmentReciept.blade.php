<button onclick="printData()" id="hidebutton" style="background-color: blue">Print me</button>
<style type="text/css" media="print">
  @page { size: portrait; }
</style>
<div id="printTable" >
	<div style="width: 100%;">
	<p>NAME: <strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}}</strong><strong style="float: right"> Grade: {{ucwords($student->title)}}-{{$student->section}}</strong><br>
		Student Code(for Online Student Information System):<b> {{$code->code}}</b></p>
	<p style="text-align: justify;"><strong>Enrollment Fee:</strong> <strong style="float: right">P {{ number_format($payment->enrollment_fee, 2, '.', ',') }}</strong><br />
		<strong>Miscellaneous Fee:</strong><strong style="float: right">P {{ number_format($payment->misc, 2, '.', ',') }}</strong><br />
		<strong>Tuition Fee (P500x10 months):</strong> <strong style="float: right">P {{ number_format($payment->whole_year, 2, '.', ',') }}</strong><br />
	<h2 style="text-align: justify;"><strong>Total:</strong><strong style="float: right">P {{ number_format($payment->enrollment_fee + $payment->misc + $payment->whole_year , 2, '.', ',') }}</strong></h2></p>
	<table style="height: 153px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr>
	<td style="width: 64px; text-align: center;"><strong>Date</strong></td>
	<td style="width: 165px; text-align: center;"><strong>Particular</strong></td>
	<td style="width: 129px; text-align: center;"><strong>Payment</strong></td>
	<td style="width: 134px; text-align: center;"><strong>Balance</strong></td>
	<td style="width: 85px; text-align: center;"><strong>Remarks</strong></td>
	</tr>
	<tr>
	<td style="width: 64px;">{{ date('F d', strtotime($data->created_at)) }}</td>
	<td style="width: 165px;">{{$data->type}}</td>
	<td style="width: 129px;">P{{ number_format($data->amount, 2, '.', ',') }}</td>
	<td style="width: 134px;">P {{ number_format($payment->enrollment_fee + $payment->misc + $payment->whole_year , 2, '.', ',') }}</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	</tbody>
	</table>
	<br>
	<p><p>NAME: <strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}}</strong><strong style="float: right"> Grade: {{ucwords($student->title)}}-{{$student->section}}</strong></p>
	<p style="text-align: justify;"><strong>Books Fee:</strong> <strong style="float: right">P {{$payment->books}}.00</strong><br />
		<strong>Uniform/P.E. Fee:</strong><strong style="float: right">P {{$payment->uniform}}.00</strong><br />
		<strong>PTA:</strong> <strong style="float: right">P {{$payment->pta}}.00</strong><br />
	<h2 style="text-align: justify;"><strong>Total:</strong><strong style="float: right">P {{$payment->books + $payment->uniform + $payment->pta}}.00</strong></h2></p>
	<table style="height: 153px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr>
	<td style="width: 64px; text-align: center;"><strong>Date</strong></td>
	<td style="width: 165px; text-align: center;"><strong>Particular</strong></td>
	<td style="width: 129px; text-align: center;"><strong>Payment</strong></td>
	<td style="width: 134px; text-align: center;"><strong>Balance</strong></td>
	<td style="width: 85px; text-align: center;"><strong>Remarks</strong></td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	<tr>
	<td style="width: 64px;">&nbsp;</td>
	<td style="width: 165px;">&nbsp;</td>
	<td style="width: 129px;">&nbsp;</td>
	<td style="width: 134px;">&nbsp;</td>
	<td style="width: 85px;">&nbsp;</td>
	</tr>
	</tbody>
	</table>
	</div>
	<br>
	<br>
	<div style="width: 49%;float: left;border: solid black 2px;">
		<p style="float: left"> &nbsp;Student/Parent Copy</p><br><br><br><br>
		<p style="text-align: center;">Payment Reciept</p>
		<p style="text-align: center;"></p>
		<p style="text-align: left;"> &nbsp;NAME:<strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}} </strong><br>&nbsp;Grade Level: <strong>{{ucwords($student->title)}}-{{$student->section}} &nbsp;</strong></p>
		<p style="text-align: center;">{{$amount}}(P {{ number_format($data->amount, 2, '.', ',') }}) this partial/full payment for <strong>{{$data->type}}</strong></p>
		<p style="text-align: left;"><strong>OR No.________________________</strong><br>
		<strong>Other Receipt.___________________</strong></p>
		<p style="text-align: center;">Statement Of Accounts<br /> As of {{ date('F d, Y', strtotime($data->created_at)) }}</p>
		<p style="text-align: left;"><strong>Accounts</strong></p>
		<p style="text-align: left;">&nbsp; &nbsp; Registration Fee:<strong style="float: right">P {{ number_format($payment->enrollment_fee, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Miscellaneous Fee:<strong style="float: right">P {{ number_format($payment->misc, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Total Tuition Fee:<strong style="float: right">P {{ number_format($payment->whole_year, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Books Fee:<strong style="float: right">P {{ number_format($payment->books, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Uniforms Fee:<strong style="float: right">P {{ number_format($payment->uniform, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; PTA Fee:<strong style="float: right">P {{ number_format($payment->pta, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Others Fee:<strong style="float: right">P {{ number_format($payment->past_balance, 2, '.', ',') }}&nbsp;</strong></p>
		<H2 style="text-align: left;">&nbsp; &nbsp; TOTAL:<strong style="float: right">P {{ number_format($payment->whole_year + $payment->enrollment_fee + $payment->misc + $payment->books + $payment->uniform + $payment->pta + $payment->past_balance, 2, '.', ',') }}&nbsp;</strong></h2>
		<p style="text-align: left;">&nbsp; <strong>NOTE:</strong><span style="text-decoration: underline;"> Please Settle ahead of time. For account discrepancy, kindly approach the admin</span></p>
		<p style="text-align: right;">&nbsp; <strong>Daghang Salamat!&nbsp;</strong></p>


	</div>
	<div style="width: 49%;float: right;border: solid black 2px;">
		<p style="float: left"> &nbsp;School Copy</p><br><br><br><br>
		<p style="text-align: center;">Payment Reciept</p>
		<p style="text-align: center;"></p>
		<p style="text-align: left;"> &nbsp;NAME:<strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}} <br></strong>&nbsp;Grade Level: <strong>{{ucwords($student->title)}}-{{$student->section}} &nbsp;</strong></p>
		<p style="text-align: center;">{{$amount}}(P {{ number_format($data->amount, 2, '.', ',') }}) this partial/full payment for <strong>{{$data->type}}</strong></p>
		<p style="text-align: left;"><strong>OR No.________________________</strong><br>
		<strong>Other Receipt.___________________</strong></p>
		<p style="text-align: center;">Statement Of Accounts<br /> As of {{ date('F d, Y', strtotime($data->created_at)) }}</p>
		<p style="text-align: left;"><strong>Accounts</strong></p>
		<p style="text-align: left;">&nbsp; &nbsp; Registration Fee:<strong style="float: right">P {{ number_format($payment->enrollment_fee, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Miscellaneous Fee:<strong style="float: right">P {{ number_format($payment->misc, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Total Tuition Fee:<strong style="float: right">P {{ number_format($payment->whole_year, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Books Fee:<strong style="float: right">P {{ number_format($payment->books, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Uniforms Fee:<strong style="float: right">P {{ number_format($payment->uniform, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; PTA Fee:<strong style="float: right">P {{ number_format($payment->pta, 2, '.', ',') }}&nbsp;</strong><br>
		&nbsp; &nbsp; Others Fee:<strong style="float: right">P {{ number_format($payment->past_balance, 2, '.', ',') }}&nbsp;</strong></p>
		<H2 style="text-align: left;">&nbsp; &nbsp; TOTAL:<strong style="float: right">P {{ number_format($payment->whole_year + $payment->enrollment_fee + $payment->misc + $payment->books + $payment->uniform + $payment->pta + $payment->past_balance, 2, '.', ',') }}&nbsp;</strong></h2>
	</div>
</div>

<br />
<br />




<script type="text/javascript">
	function printData()
	{
		document.getElementById("hidebutton").hidden = true;
	   print();
	   document.getElementById("hidebutton").hidden = false;
	}

	$('button').on('click',function(){
	printData();
	})
</script>

