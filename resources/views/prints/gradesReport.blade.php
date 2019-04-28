<?php
/**
 * @var \App\Level $level
 * @var \Illuminate\Database\Eloquent\Collection|\App\Student[] $students
 * @var \Illuminate\Database\Eloquent\Collection|\App\Subject[] $subjects
 */
?>
<style type="text/css" media="print">
  @page { size: landscape; }
</style>
<div id="printTable">

    <img src="{{ url('img/schoolIcon.png') }}" alt="Paris"
         style="width: 188px; height: 120px;display: flex; justify-content: center;float:left;">
    <p style="text-align: left; margin-left: 200px">Community Welfare Service Lotus Foundation School and Training
        Center<br>
        Gredu, Panabo City, Davao del Norte <br>
        Website: www.lotus-foundation.com | telephone: (084)-209-0747 <br>
        Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
    <p style="text-align: center;"><strong>&nbsp;</strong></p>
    @foreach($levels as $level)
    @if($level->id != 0)
    <p style="text-align: center;"><strong>{{$level->title}}<br>Grade Report</strong></p>
    <table style="height: 10px; width: 100%;" border="1" cellspacing="0">
        <thead>
        <tr>
            <th>List of Students</th>
            @foreach($subjects as $subject)
                @if($subject->level == $level->id)
                <th colspan="5">{{ $subject->title }}</th>
                @endif
            @endforeach
        </tr>
        <tr>
            <th></th>
            @foreach($subjects as $subject)
                @if($subject->level == $level->id)
                <th style="text-align: center;">1st</th>
                <th style="text-align: center;">2nd</th>
                <th style="text-align: center;">3rd</th>
                <th style="text-align: center;">4th</th>
                <th style="text-align: center;">Avg</th>
                @endif
            @endforeach
        </tr>
        </thead>
        <tbody>
        @foreach($students as $student)
            @if($student->level_id == $level->id)
            <tr>
                <td style="height: 10px;">{{ $student->last_name }}, {{$student->first_name}}</td>
                @foreach($grades as $grade)
                    @if($grade->student_id == $student->id)
                    <td style="text-align: center;">{{ $grade->first }}</td>
                    <td style="text-align: center;">{{ $grade->second }}</td>
                    <td style="text-align: center;">{{ $grade->third }}</td>
                    <td style="text-align: center;">{{ $grade->fourth }}</td>
                    <td style="text-align: center;">{{ ($grade->fourth+$grade->third+$grade->second+$grade->first)/4 }}</td>
                    @endif
                @endforeach
            </tr>
            @endif
        @endforeach
        </tbody>
    </table>
    @endif
    @endforeach
</div>

<br/>
<br/>

<button onclick="printData()" id="hidebutton">Print me</button>


<script type="text/javascript">
    function printData() {
        document.getElementById("hidebutton").hidden = true;
        print();
        document.getElementById("hidebutton").hidden = false;
    }

    $('button').on('click', function () {
        printData();
    })
</script>
