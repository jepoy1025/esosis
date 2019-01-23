<table border="1" cellpadding="3" id="printTable">
	<tbody><tr>
		<th>Transaction No.</th>
		<th>Type of Transaction</th>		
		<th>Amount</th>
	</tr>
	@foreach($data as $data)
	<tr>
		<td>{{$data->id}}</td>
		<td>{{$data->type}}</td>		
		<td>{{$data->amount}}</td>
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