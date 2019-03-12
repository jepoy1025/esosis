<div id="printTable" >
	
  		<img src="{{ url('img/schoolIcon.png') }}" alt="Paris" style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
	<p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training Center<br>
	Gredu, Panabo City, Davao del Norte <br>
	Website: www.lotus-foundation.com | telephone: ###-####-### <br>
	Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
	<p style="text-align: center;"><strong>&nbsp;</strong></p>
	<p style="text-align: center;">Integrated Schedules&nbsp;<br>
	<strong>School year 2019-2020</strong></p>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Nursery - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room1 as $room1)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room1->start_time))}} - {{date('h:i A', strtotime($room1->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room1->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room1->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Kinder - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room2 as $room2)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room2->start_time))}} - {{date('h:i A', strtotime($room2->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room2->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room2->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Kinder 2 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room3 as $room3)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room3->start_time))}} - {{date('h:i A', strtotime($room3->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room3->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room3->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 1 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room4 as $room4)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room4->start_time))}} - {{date('h:i A', strtotime($room4->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room4->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room4->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 2 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room5 as $room5)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room5->start_time))}} - {{date('h:i A', strtotime($room5->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room5->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room5s->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 3 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room6 as $room6)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room6->start_time))}} - {{date('h:i A', strtotime($room6->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room6->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room6->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 4 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room7 as $room7)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room7->start_time))}} - {{date('h:i A', strtotime($room7->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room7->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room7->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 5 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room8 as $room8)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room8->start_time))}} - {{date('h:i A', strtotime($room8->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room8->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room8->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 6 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room9 as $room9)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room9->start_time))}} - {{date('h:i A', strtotime($room9->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room9->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room9->name}}</td>
	</tr>
	@endforeach
	</tbody>
	</table>
	<br>
	<br>
	<table style="height: 18px; width: 100%;" border="1" cellspacing="0">
	<tbody>
	<tr style="text-align: center; height: 25px;">
	<td style="width: 188px; text-align: center; height: 25px;" colspan="4">
		<b>Grade 7 - 1</b>
	</td>
	</tr>
	<tr style="height: 18px;">
	<td style="width: 206px; text-align: center; height: 18px;"><strong>Time</strong></td>
	<td style="width: 100px; text-align: center; height: 18px;"><strong>Subject</strong></td>
	<td style="width: 300px; text-align: center; height: 18px;"><strong>Teacher</strong></td>
	</tr>
	@foreach($room10 as $room10)
	<tr style="height: 18px;">
	<td style="width: 206px; height: 18px;">&nbsp;
		{{date('h:i A', strtotime($room10->start_time))}} - {{date('h:i A', strtotime($room10->end_time))}}
	</td>
	<td style="width: 100px; height: 18px;">&nbsp;{{$room10->title}}</td>
	<td style="width: 300px; height: 18px;">&nbsp;{{$room10->name}}</td>
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
