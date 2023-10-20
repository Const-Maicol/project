<?php
namespace App\Config;
/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS FUNCTIONS ROUTING
 */

/* Database connection values */
define("DB_HOST", "localhost");
define("DB", "my_project");
define("DB_USER", "root");
define("DB_PASS", "");

/* Default options */
define("DEFAULT_CONTROLLER", "home");
define("DEFAULT_ACTION", "list");

/* Default App options */

define("APP_URL","http://127.0.0.1/structure_project_mvc/app/");
define("APP_URL_PUBLIC","http://127.0.0.1/structure_project_mvc/public/");
define("APP_NAME","MY PROJECT");
// http://127.0.0.1/structure_project_mvc/public/user/show


/* Default time zone options */
date_default_timezone_set("America/Bogota");

?>