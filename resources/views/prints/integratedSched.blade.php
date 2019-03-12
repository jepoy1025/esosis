<div id="printTable" >
	
  		<img src="{{ url('img/schoolIcon.png') }}" alt="Paris" style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
	<p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training Center<br>
	Gredu, Panabo City, Davao del Norte <br>
	Website: www.lotus-foundation.com | telephone: ###-####-### <br>
	Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
	<p style="text-align: center;"><strong>&nbsp;</strong></p>
	<p style="text-align: center;">Integrated Schedules&nbsp;<br>
	<strong>School year 2019-2020</strong></p>
	@foreach($rooms as $room)
		<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
		<tbody>
			<tr style="text-align: center; height: 25px;">
			<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
				<b>{{$room->title}} - {{$room->section}}</b>
			</td>
			</tr>
			<tr style="height: 18px;">
			<td style="width: 120px; text-align: center; height: 18px;"><strong>Time</strong></td>
			<td style="width: 100px; text-align: center; height: 18px;"><strong>Duration(Min)</strong></td>
			<td style="width: 180px; text-align: center; height: 18px;"><strong>Subject</strong></td>
			<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
			</tr>
			@foreach($schedules as $schedule)
				@if($room->id == $schedule->room_id)
				<tr style="height: 18px;">
				<td style="width: 206px; height: 18px;">&nbsp;
					{{date('h:i A', strtotime($schedule->start_time))}} - {{date('h:i A', strtotime($schedule->end_time))}}
				</td>
				<td>{{$schedule->duration}}</td>
				<td style="width: 100px; height: 18px;">&nbsp;{{$schedule->title}}</td>
				<td style="width: 300px; height: 18px;">&nbsp;{{$schedule->name}}</td>
				</tr>
				@endif
			@endforeach
		</tbody>
		</table>
		<br><br>
	@endforeach
</div>

<br />
<br />

<button onclick="printData()" id="hidebutton">Print</button>


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
