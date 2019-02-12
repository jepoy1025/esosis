<div id="printTable" >
  		<img src="{{ url('img/schoolIcon.png') }}" alt="Paris" style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
  		{{-- <p style="text-align: center;"><strong>&nbsp;</strong></p> --}}
	<p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training Center<br>
	Gredu, Panabo City, Davao del Norte <br>
	Website: www.lotus-foundation.com | telephone: ###-####-### <br>
	Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
	
	<p style="text-align: center;"><strong>Student Payment Transaction</strong></p>
	<table style="height: 153px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: left; height: 25px;" colspan="4">
	<p>&nbsp;Name: <strong>{{ucwords($student->last_name)}}, {{ucwords($student->first_name)}}</strong><br /> &nbsp;To:&nbsp;<strong>{{ucwords($student->title)}} - {{$student->section}}</strong></p>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 188px; text-align: center; height: 18px;"><strong>Transaction ID</strong></td>
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Date</strong></td>
	<td style="width: 194px; text-align: center; height: 18px;"><strong>Transaction Type</strong></td>
	<td style="width: 194px; text-align: center; height: 18px;"><strong>Amount</strong></td>
	</tr>
	@foreach($data as $data)
	<tr style="height: 18px;">
	<td style="width: 188px; text-align: center;height: 18px;">&nbsp;{{ucwords($data->id)}}</td>
	<td style="width: 206px; text-align: center;height: 18px;">&nbsp;{{ucwords($data->created_at)}}</td>
	<td style="width: 194px; text-align: center;height: 18px;">&nbsp;{{ucwords($data->type)}}</td>
	<td style="width: 194px; text-align: center;height: 18px;">&nbsp;P {{$data->amount}}.00</td>
	</tr>
	@endforeach
	</tbody>
	</table>
</div>

<br />
<br />

<button onclick="printData()" id="hidebutton">Print me</button>


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