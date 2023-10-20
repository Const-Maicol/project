<?php
namespace App\Models\UserStatus;
use App\Config\Database;

class UserStatusModel
{
  protected $table;
  protected $primary;
  protected $attributes;
  protected $conn;
  protected $result;
  protected $typeConn;
  protected $objDB;

  public function __construct($type)
  {
    $this->table = "userStatus";
    $this->primary = "user_status_id";
    $this->attributes = array("user_status_id", "user_status_name", "updated_at", "create_at");
    $this->objDB = new Database();
    $this->typeConn = $type;
    if ($this->typeConn) {
      $this->conn = $this->objDB->getConnectPDO();
    } else {
      $this->conn = $this->objDB->getConnectMYSQLI();
    }
  }

  public function getUser_StatusAll()
  {
    $sql = "CALL sp_select_user_status_all()";
    if ($this->typeConn) {
      $prepare_sql = $this->conn->prepare($sql);
      $prepare_sql->execute();
      $this->result = $prepare_sql->fetch(PDO::FETCH_DEFAULT);
    

      $this->objDB->connectPDOClose();
    } else {
 
      
      $prepare_sql = $this->conn->query($sql);
      $this->result = $prepare_sql->fetch_all(MYSQLI_NUM);
 
      $prepare_sql->free();
      $this->objDB->connectMysqliClose();
    }
    return $this->result;
  }

}
