<?php

	class mysql_datetime
	{
		function mysql_to_full($date)
		{
			$d = explode('-', $date);
			return date("l, F j, Y", mktime(0, 0, 0, $d[1], $d[2], $d[0]));
		}
	}

?>