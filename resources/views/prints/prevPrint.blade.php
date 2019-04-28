<button onclick="printData()" id="hidebutton">Print</button>
<div id="printTable" >
	<img src="{{ url('img/schoolIcon.png') }}" alt="Paris" style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
	<p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training Center<br>
	Gredu, Panabo City, Davao del Norte <br>
	Website: www.lotus-foundation.com | telephone: ###-####-### <br>
	Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
	<p style="text-align: center;"><strong>&nbsp;</strong></p>
	<p style="text-align: center;"><strong><font size="6">Individual Student Performance Report&nbsp;</font></strong></p>
	<p>&nbsp;Student Name: <strong>{{$student->last_name}}, {{$student->first_name}}</strong><br /> &nbsp;Grade and Section:&nbsp;<strong>{{$sy->title}}</strong><br>
		School Year: <strong>{{$sy->school_year}}</strong></p>
	<div style="width: 100%;">

	<table style="width: 100%;" border="1" cellspacing="0">
	<tbody>
		<tr style="height: 18px;">
		<td style="width: 581px; height: 18px; text-align: center;" colspan="6"><strong>&nbsp;GRADE</strong></td>
		</tr>
	<tr>
	<td style="width: 156px; text-align: center;">Subject</td>
	<td style="width: 30px; text-align: center;">1st</td>
	<td style="width: 30px; text-align: center;">&nbsp;2nd</td>
	<td style="width: 30px; text-align: center;">&nbsp;3rd</td>
	<td style="width: 30px; text-align: center;">&nbsp;4th</td>
	<td style="width: 30px; text-align: center;">&nbsp;Avg</td>
	</tr>
	@php
	$ctr = 0;
	$average = 0;
	@endphp
	@foreach($data as $data)
		<tr>
		<td style="width: 156px; text-align: center;">{{$data->title}}</td>
		<td style="width: 30px;">{{$data->first}}</td>
		<td style="width: 30px;">{{$data->second}}</td>
		<td style="width: 30px;">{{$data->third}}</td>
		<td style="width: 30px;">{{$data->fourth}}</td>
		<td style="width: 30px;">{{($data->first+$data->second+$data->third+$data->fourth)/4}}</td>
		@php ($ctr++)
		@php ($average = $average + ($data->first+$data->second+$data->third+$data->fourth)/4)
		</tr>
	@endforeach
	<tr>
	<td style="width: 156px; text-align: right;">&nbsp;</td>
	<td style="width: 30px;" colspan="4"><strong>OVERALL AVERAGE:</strong></td>
	<td style="width: 30px;">{{$average/$ctr}}</td>
	</tr>
	</tbody>
	</table>
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




