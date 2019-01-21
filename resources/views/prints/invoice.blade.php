<table border="1" cellpadding="3" id="printTable">
	<tbody><tr>
		<th>First Name</th>
		<th>Middle Name</th>		
		<th>Last Name</th>
	</tr>
	@foreach($data as $data)
	<tr>
		<td>{{$data->first_name}}</td>
		<td>{{$data->middle_name}}</td>		
		<td>{{$data->last_name}}</td>
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
