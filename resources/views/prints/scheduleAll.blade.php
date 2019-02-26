<div id="printTable" >
	
  		<img src="{{ url('img/schoolIcon.png') }}" alt="Paris" style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
	<p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training Center<br>
	Gredu, Panabo City, Davao del Norte <br>
	Website: www.lotus-foundation.com | telephone: ###-####-### <br>
	Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
	<p style="text-align: center;"><strong>&nbsp;</strong></p>
	<p style="text-align: center;">Integrated Loading&nbsp;<br>
	<strong>School year 2019-2020</strong></p>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: left; height: 25px;" colspan="4">
		Test
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 188px; text-align: center; height: 18px;"><strong>Day</strong></td>
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($data as $data)
	<tr style="height: 18px;">
	<td style="width: 188px; height: 18px;">&nbsp;
		@if($data->day == 1)
			M/T/TH/F
		@else
			W
		@endif
	</td>
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($data->start_time))}} - {{date('h:i A', strtotime($data->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$data->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$data->name}}</td>
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
