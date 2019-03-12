 <button onclick="printData()" id="hidebutton" style="background-color: blue">Print me</button>
<div id="printTable" >
	<div style="width: 49%;float: left;border: solid black 2px;">
		<p style="float: left"> &nbsp;Student/Parent Copy</p><br><br><br><br>
		<p style="text-align: center;">Payment Receipt</p>
		<p style="text-align: center;"></p>
		<p style="text-align: left;"> &nbsp;NAME:<strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}} </strong><br>&nbsp;Grade Level: <strong>{{ucwords($student->title)}}-{{$student->section}} &nbsp;</strong></p>
		<p style="text-align: center;">{{$amount}}(P {{ number_format($data->amount, 2, '.', ',') }}) this partial/full payment for <br>
			<strong>
				@foreach($paid as $paid)
					<p style="text-align: center;">{{$paid}}</p>
				@endforeach
			</strong></p>
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
		<p style="text-align: center;">Payment Receipt</p>
		<p style="text-align: center;"></p>
		<p style="text-align: left;"> &nbsp;NAME:<strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}} <br></strong>&nbsp;Grade Level: <strong>{{ucwords($student->title)}}-{{$student->section}} &nbsp;</strong></p>
		<p style="text-align: center;">{{$amount}}(P {{ number_format($data->amount, 2, '.', ',') }}) this partial/full payment for 
			<strong>
				@foreach($paid2 as $paid2)
						<p style="text-align: center;">{{$paid2}}</p>
				@endforeach
			</strong></p>
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



