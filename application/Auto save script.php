<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    e.preventDefault();
    var name = $("#first_name").val();
    var last_name = $("#last_name").val();
    var city_name = $("#city_name").val();
    var dataString = 'first_name='+name+'&last_name='+last_name+'&city_name='+city_name;
    $.ajax({
        data:dataString,
        url:'index.php',
        success:function(data) {
            alert(data);
        }
    });
});
</script>

<form method="post" id="reg-form">
    <table align="center">
        <tr>
            <td align="center"><a href="index.php">back to main page</a></td>
        </tr>
        <tr>
            <td><input type="text" name="first_name" id="first_name" placeholder="First Name" required /></td>
        </tr>
        <tr>
            <td><input type="text" name="last_name" id="last_name" placeholder="Last Name" required /></td>
        </tr>
        <tr>
            <td><input type="text" name="city_name" id="city_name" placeholder="City" required /></td>
        </tr>
        <tr>
            <td><input type="submit" name="Update" id="update1" value="SAVE" /></td>
        </tr>
    </table>
</form>

<script>
    $(document).ready(function() {
        $("#reg-form").submit(e) { //submit event occur when you submit your form
            e.preventDefault(); //this will prevent reloading and default form submission 
            var name = $("#first_name").val();
            var last_name = $("#last_name").val();
            var city_name = $("#city_name").val();
            var dataString = 'first_name=' + name + '&last_name=' + last_name + '&city_name=' + city_name;
            $.ajax({
                data: dataString,
                url: 'index.php',
                success: function(data) {
                    alert(data);
                }
            });
        }
    });
</script>
