<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/10/2023
 *Description:...
 */

namespace App\Controllers\User;

use App\Config\Controller;
use App\Models\User\UserModel;
use App\Models\Role\RoleModel;
use App\Models\UserStatus\UserStatusModel;

class UserController extends Controller
{
  protected $model;
  protected $result;
  protected $modelRole;
  protected $modelStatus;
  protected $typeConn;

  public function __construct()
  {
    $this->typeConn = false;
    $this->model = new UserModel($this->typeConn);
    $this->result = array();
    $this->modelRole = new RoleModel($this->typeConn);
    $this->modelStatus = new UserStatusModel($this->typeConn);
    }

  public function show()
  {
    $data['users'] = $this->model->getUserAll();
    $data['roles'] = $this->modelRole->getRoleAll();
    $data['status'] = $this->modelStatus->getUser_StatusAll();
    return $this->view("user/user", $data);

  }

  public function create()
  {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      $user_user = $_POST['user_user'];
      $user_password = password_hash($_POST['user_password'], PASSWORD_DEFAULT);
      $user_password_repeat = $_POST['user_password_repeat'];
      $role_id = $_POST['role_id'];
      $user_status_id = $_POST['user_status_id'];
      if($this->model->createUser($user_user,$user_password,$role_id,$user_status_id)){
        header("Location: http://127.0.0.1/structure_project_mvc/public/user/show");
      }
    }
  }
  public function edit()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo ("EDIT");
  }
  public function update()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo ("UPDATE");
  }
  public function delete()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo (" DELETE");
  }

}
?>