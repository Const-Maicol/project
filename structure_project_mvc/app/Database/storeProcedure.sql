/*USER*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_user_all $$
CREATE PROCEDURE sp_select_user_all()
BEGIN
SELECT us.user_id,US.user_user,US.user_password, R.role_name, UST.user_status_name FROM user US INNER JOIN user_status UST ON US.user_status_id = UST.user_status_id INNER JOIN role R ON US.role_id = R.role_id;
END $$
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_user_id $$
CREATE PROCEDURE sp_select_user_id( IN userId INT)
BEGIN
SELECT * FROM user WHERE user_id=userId;
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_user_user $$
CREATE PROCEDURE sp_select_user_user( IN userUser VARCHAR(50))
BEGIN
SELECT * FROM user WHERE user_user=userUser;
END $$
DELIMITER ;

/*USER STATUS*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_user_status_all $$
CREATE PROCEDURE sp_select_user_status_all()
BEGIN
SELECT * FROM user_status;
END $$
DELIMITER ;

/*ROLE*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_role_all $$
CREATE PROCEDURE sp_select_role_all()
BEGIN
SELECT * FROM role;
END $$
DELIMITER ;
/*MODULE*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_module_all $$
CREATE PROCEDURE sp_select_module_all()
BEGIN
SELECT * FROM module;
END $$
DELIMITER ;
