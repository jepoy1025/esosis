<table border="1" cellpadding="3" id="printTable">
	<tbody><tr>
		<th>Subject Name</th>
		<th>1st</th>		
		<th>2nd</th>
		<th>3rd</th>
		<th>4th</th>
	</tr>
	@foreach($data as $data)
	<tr>
		<td>{{$data->title}}</td>
		<td>{{$data->first}}</td>		
		<td>{{$data->second}}</td>
		<td>{{$data->third}}</td>
		<td>{{$data->fourth}}</td>
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
