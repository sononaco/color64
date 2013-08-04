<?php

	require_once('classes/mysql.class.php');

	Class log
	{
		
		public function __construct()
		{

		}

		public function add($data)
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$result = $db->InsertRow('log', $data);
			
			return $result;
		}
		
		public function numberOfCallers()
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$calls = $db->QuerySingleRowArray('SELECT COUNT(*) AS `count` FROM `log`');
			
			return $calls['count'];
		}
		
		public function lastCaller()
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$caller = $db->QuerySingleRowArray('SELECT `user_name` FROM `log` ORDER BY `id` DESC LIMIT 0,1');
			
			return $caller['user_name'];
		}
	}