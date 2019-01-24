<table border="1" cellpadding="3" id="printTable">	
	<tbody>
	<tr>
		<th>Last Name</th>
		<th>First Name</th>
	</tr>
	<tr>
		<td>{{$student->last_name}}</td>
		<td>{{$student->first_name}}</td>
	</tr>
	<tr>
		<th>ID</th>
		<th>Type</th>		
		<th>Amount</th>
	</tr>
	<tr>
		<td>{{$data->id}}</td>
		<td>{{$data->type}}</td>		
		<td>{{$data->amount}}</td>
	</tr>
	
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

