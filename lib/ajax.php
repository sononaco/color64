<?php

	require_once('color64/members.php');
	require_once('color64/log.php');

	if($_POST)
	{
		$p = $_POST;
		
		switch($p['action'])
		{
			case "memberlist":
				$m = new members();
				$l = $m->memberList();
				
				header('Content-type: text/json');
				header('Content-type: application/json');
			
				echo json_encode(array('result' => true, 'list' => $l));
				
			break;
		
			case "dupecheck":
				$m = new members();
				
				$l = $m->dupeCheck($p['name']);
				
				header('Content-type: text/json');
				header('Content-type: application/json');
			
				echo json_encode(array('result' => true, 'count' => $l['total'], 'dupe' => $l['dupe']));
			break;
		
			case "newUser":
				$m = new members();

				$l = $m->addNew($p);
				
				header('Content-type: text/json');
				header('Content-type: application/json');
			
				echo json_encode(array('result' => true, 'memno' => $l));
				
			break;
		
			case "savereg":
				
				$m = new members();
				$m->saveInfo($p);
				
				header('Content-type: text/json');
				header('Content-type: application/json');
			
				echo json_encode(array('result' => true));
				
			break;
		
			case "login":
			
				$m = new members();

				$l = $m->login($p);
				
				if(is_array($l))
				{	
					$l = $l[0];
					$response = true;
					
					$m->update(array(
						'no_calls' => MySQL::SQLValue(intval($l['no_calls']++)),
						'last_call' => MySQL::SQLValue(date('Y-m-d')))
					, $l['id']);
					
					$lc = split('-',$l['last_call']);
					
					$log = new Log();
					$log->add(
						array(
							'user_id' => MySQL::SQLValue($l['id']),
							'user_name' => MySQL::SQLValue($l['name']),
							'date'	=> time()
						)
					);
					
					$data = array(
						'name'	=> $l['name'],
						'lvl'	=> $l['lvl'],
						'no_calls'	=> $l['no_calls'],
						'caller_no'	=> $log->numberOfCallers(),
						'last_caller'	=> $log->lastCaller(),
						'last_call'	=> date('n/j/y', mktime(0, 0, 0, $lc[1], $lc[2], $lc[0])),
						'dnlds'	=> intval($l['dnlds']),
						'uplds'	=> intval($l['uplds']),
						'msgs'	=> 0	// this will change
					);
					
				} else {
					$data = 'something went wrong';
					$response = false;
				}
				
				header('Content-type: text/json');
				header('Content-type: application/json');
			
				echo json_encode(array('result' => true, 'response' => $response, 'data' => $data));
				
			break;
		
		}
	}

?>
