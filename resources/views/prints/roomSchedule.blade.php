<?php
/**
 * @var \App\Room $room
 */
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" integrity="sha384-pjaaA8dDz/5BgdFUPX6M/9SUZv4d12SUPF0axWc+VRZkx5xU3daN+lYb49+Ax+Tl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div>
			<img src="logo.png" width="250px" class="img img-responsive">
		</div>
		<div>
			<h3>Name: <strong>{{ $room->advicer->name }}</strong></h3>
			<h3>Educational Attainment: <strong>{{ $room->advicer->educational_attainment }}</strong></h3>
		</div>
		<div class="center-block text-center">
			<h3>Class Program</h3>
			<h3>{{ $room->level->title }}</h3>
			<h3>(Monday, Tuesday, Thursday & Friday)</h3>
		</div>
		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th scope="col">TIME</th>
					<th scope="col">NO. OF MINUTES</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">TEACHER'S DESIGNATION</th>
				</tr>
			</thead>
			<tbody>
			@foreach($room->schedules as $schedule)
				<tr>
					<td>{{ $schedule->formatted_range }}</td>
					<td>{{ $schedule->duration_minutes }}</td>
					<td>{{ $schedule->subject->title }}</td>
					<td>{{ $schedule->subject->teacher->name }}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
		<div>
			<h3>Note: Flag lowering every Friday is 3:30 pm.</h3>
		</div>
	</div>
</body>
</html>