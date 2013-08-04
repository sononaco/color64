<?php

	require_once('classes/mysql.class.php');

	Class members
	{
		public function memberList()
		{	
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			$q = $db->Query("SELECT `id`,`name` FROM `users` WHERE `id` > 1 ORDER BY `id` ASC;");
			
			$mlist = array();
			
			while(! $db->EndOfSeek())
			{
				$l = $db->Row();
				$mlist[$l->id] = strtoupper($l->name);
			}
			
			return $mlist;
		}
		
		public function dupeCheck($name)
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$q = $db->Query("SELECT `id` FROM `users`");
			
			$allrecords = $db->RowCount();
			
			$q = $db->Query("SELECT `id` FROM `users` WHERE `name` LIKE '".$name ."';");
			
			if($db->RowCount() > 0)
			{
				$dupes = $db->Row()->id;
			} else {
				$dupes = 0;
			}
			
			return array('total' => $allrecords, 'dupe' => $dupes);
		}
		
		public function addNew($data)
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$d = array(
				'name'	=> MySQL::SQLValue(strtoupper(trim($data['u']))),
				'password'	=> MySQL::SQLValue(MD5($data['p'])),
			);
			
			$result = $db->InsertRow('users', $d);
			
			return $result;
		}
		
		public function saveInfo($data)
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$d = array(
				'real_name'	=> MySQL::SQLValue(strtoupper(trim($data['name']))),
				'address'	=> MySQL::SQLValue(trim($data['address'])),
				'city'	=> MySQL::SQLValue(trim($data['city'])),
				'state'	=> MySQL::SQLValue(trim($data['state'])),
				'zip'	=> MySQL::SQLValue(trim($data['zip'])),
				'phone'	=> MySQL::SQLValue(trim($data['phone'])),
				'computer'	=> MySQL::SQLValue(trim($data['computer']))
			);
			
			$w = array(
				'id'	=> $data['id']
			);
			
			$result = $db->UpdateRows('users', $d, $w);
			
			return $result;
		}
		
		public function login($data)
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			
			$sql = 'SELECT * FROM `users` WHERE `id` = "'.$data['u'].'" AND `password` = "'.MD5($data['p']).'";';
			$result = $db->QueryArray($sql);
			
			return $result;
		}
		
		public function update($data, $id)
		{
			$db = new MySQL(true, 'color64', 'localhost', 'color64', 'nu5Jc4JdtZK4RCHH');
			$db->UpdateRows('users', $data, 'id = '.$id);
		}
		
	}

?>
