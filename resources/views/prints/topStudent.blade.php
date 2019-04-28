<div id="printTable" >
	
  		<img src="{{ url('img/schoolIcon.png') }}" alt="Paris" style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
	<p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training Center<br>
	Gredu, Panabo City, Davao del Norte <br>
	Website: www.lotus-foundation.com | telephone: ###-####-### <br>
	Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
	<p style="text-align: center;"><strong>&nbsp;</strong></p>
	<p style="text-align: center;"><strong>{{$level->title}}<br>Finals Top 10 Students&nbsp;</strong></p>
	<table style="height: 153px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: left; height: 25px;" colspan="3">
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 50px; text-align: center; height: 18px;"><strong>Rank</strong></td>
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Name</strong></td>
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Average</strong></td>
	</tr>
	@foreach($data as $key=>$data)
	<tr style="height: 18px;">
	<td style="text-align: center; width: 50px; height: 18px;">&nbsp;{{$key+1}}</td>
	<td style="width: 206px; height: 18px;">&nbsp;{{ucwords($data->last_name)}}, {{ucwords($data->first_name)}}</td>
	<td style="text-align: center; width: 50px; height: 18px;">&nbsp;{{$data->average}}%</td>
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
