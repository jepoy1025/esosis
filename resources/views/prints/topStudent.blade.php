<table border="1" cellpadding="3" id="printTable">
	<tbody><tr>
		<th>Student Name</th>
		<th>Rank</th>	
	</tr>
	@foreach($data as $key=>$data)
	<tr>
		<td>{{$data->last_name}}, {{$data->first_name}}</td>
		<td>{{$key+1}}</td>
	</tr>
	@endforeach
</tbody></table>

<br />
<br />

<button onclick="printData()">Print me</button>


<script type="text/javascript">
	function printData()
	{
	   var divToPrint=document.getElementById("printTable");
	   newWin= window.open("");
	   newWin.document.write(divToPrint.outerHTML);
	   newWin.print();
	   newWin.close();
	}

	$('button').on('click',function(){
	printData();
	})
</script>