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
        Website: www.lotus-foundation.com | telephone: ###-####-### <br>
        Facebook Page: www.facebook.com/lotusFoudnationOfficial <br>
    <p style="text-align: center;"><strong>&nbsp;</strong></p>
    <p style="text-align: center;"><strong>{{$level->title}}<br>Grade Report</strong></p>
    <table style="height: 153px; width: 100%;" border="1" cellspacing="0">
        <thead>
        <tr>
            <th>List of Students</th>
            @foreach($subjects as $subject)
                <th colspan="5">{{ $subject->title }}</th>
                @endforeach
        </tr>
        <tr>
            <th></th>
            @foreach($subjects as $subject)
                <th style="text-align: center;">1st</th>
                <th style="text-align: center;">2nd</th>
                <th style="text-align: center;">3rd</th>
                <th style="text-align: center;">4th</th>
                <th style="text-align: center;">Avg</th>
                @endforeach
        </tr>
        </thead>
        <tbody>
        @foreach($students as $student)
            <tr>
                <td>{{ $student->name }}</td>
                @foreach($subjects as $subject)
                    <?php
                        /** @var \App\Grade $grade */
                        $grade = $level->grades()
                        ->where('student_id', $student->id)
                        ->where('subject_id', $subject->id)
                        ->first();
                    ?>
                    <td style="text-align: center;">{{ $grade->first }}</td>
                    <td style="text-align: center;">{{ $grade->second }}</td>
                    <td style="text-align: center;">{{ $grade->third }}</td>
                    <td style="text-align: center;">{{ $grade->fourth }}</td>
                    <td style="text-align: center;">{{ ($grade->fourth+$grade->third+$grade->second+$grade->first)/4 }}</td>
                    @endforeach
            </tr>
            @endforeach
        </tbody>
    </table>
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
