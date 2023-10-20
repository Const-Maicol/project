<?php
namespace App\Models\Role;
use App\Config\Database;

class RoleModel
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
    $this->table = "role";
    $this->primary = "role_id";
    $this->attributes = array("role_id", "role_name", "updated_at", "create_at");
    $this->objDB = new Database();
    $this->typeConn = $type;
    if ($this->typeConn) {
      $this->conn = $this->objDB->getConnectPDO();
    } else {
      $this->conn = $this->objDB->getConnectMYSQLI();
    }
  }

  public function getRoleAll()
  {
    $sql = "CALL sp_select_role_all()";
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
