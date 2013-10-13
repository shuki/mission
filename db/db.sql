-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.16 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4156
-- Date/time:                    2013-10-13 06:26:20
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table mission.demo
DROP TABLE IF EXISTS `demo`;
CREATE TABLE IF NOT EXISTS `demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `integer` int(10) unsigned DEFAULT NULL,
  `boolean` tinyint(3) unsigned DEFAULT NULL,
  `text` text,
  `decimal` decimal(10,2) DEFAULT NULL,
  `picture` varchar(250) DEFAULT NULL,
  `select` smallint(5) unsigned DEFAULT NULL,
  `video` varchar(250) DEFAULT NULL,
  `multiselect` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.demo: ~4 rows (approximately)
/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
REPLACE INTO `demo` (`id`, `name`, `integer`, `boolean`, `text`, `decimal`, `picture`, `select`, `video`, `multiselect`, `date`) VALUES
	(1, 'jim morrison', 23, 1, '<div>testing</div>', 13.27, 'img/94.jpg', 2, 'video/98.flv', '2,3,4,5', '2011-09-20'),
	(2, 'john lennon', 678, 1, 'John Lennon is one of the most important musicians of the 20th century', 2345.85, 'img/95.jpg', 1, NULL, '2,5', '2010-09-21'),
	(3, 'jim morrison', 23, 1, 'to be or not to be this is the question', 13.27, 'img/97.jpg', 1, NULL, '3,4,6', '2012-09-12'),
	(4, NULL, NULL, 1, 'test me', 44.00, NULL, 1, NULL, NULL, '2012-10-31');
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;


-- Dumping structure for table mission.emptyone
DROP TABLE IF EXISTS `emptyone`;
CREATE TABLE IF NOT EXISTS `emptyone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table mission.emptyone: ~2 rows (approximately)
/*!40000 ALTER TABLE `emptyone` DISABLE KEYS */;
REPLACE INTO `emptyone` (`id`, `name`) VALUES
	(5, 'shuki shukrun'),
	(6, 'sssa');
/*!40000 ALTER TABLE `emptyone` ENABLE KEYS */;


-- Dumping structure for function mission.f_compare_test
DROP FUNCTION IF EXISTS `f_compare_test`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `f_compare_test`(vsource int, vtarget int) RETURNS varchar(2000) CHARSET utf8
BEGIN

DECLARE dfloat_field_s, dfloat_field_t float unsigned;
DECLARE dselect_field_s, dselect_field_t tinyint(3) unsigned;
DECLARE dmultiselect_field_s, dmultiselect_field_t varchar(200);
DECLARE dinteger_field_s, dinteger_field_t int(11);
DECLARE dcurrency_field_s, dcurrency_field_t decimal(11,2);
DECLARE dvarchar_field_s, dvarchar_field_t varchar(50);
DECLARE ddecimal_field_s, ddecimal_field_t decimal(11,1);
DECLARE ddate_field_s, ddate_field_t date;
DECLARE dboolean_field_s, dboolean_field_t tinyint(1) unsigned;
DECLARE dtext_field_s, dtext_field_t text;
DECLARE dtext_editor_s, dtext_editor_t text;
DECLARE dimage_field_s, dimage_field_t varchar(255);
DECLARE denum_field_s, denum_field_t enum('a','b','c');
DECLARE ddouble_field_s, ddouble_field_t double unsigned;
DECLARE ddatetime_field_s, ddatetime_field_t datetime;

DECLARE dfields varchar(8000) default '';


  SELECT `float_field`, `select_field`, `multiselect_field`, `integer_field`, `currency_field`, `varchar_field`, `decimal_field`, `date_field`, `boolean_field`, `text_field`, `text_editor`, `image_field`, `enum_field`, `double_field`, `datetime_field` into dfloat_field_s, dselect_field_s, dmultiselect_field_s, dinteger_field_s, dcurrency_field_s, dvarchar_field_s, ddecimal_field_s, ddate_field_s, dboolean_field_s, dtext_field_s, dtext_editor_s, dimage_field_s, denum_field_s, ddouble_field_s, ddatetime_field_s from test where id = vsource;
  SELECT `float_field`, `select_field`, `multiselect_field`, `integer_field`, `currency_field`, `varchar_field`, `decimal_field`, `date_field`, `boolean_field`, `text_field`, `text_editor`, `image_field`, `enum_field`, `double_field`, `datetime_field` into dfloat_field_t, dselect_field_t, dmultiselect_field_t, dinteger_field_t, dcurrency_field_t, dvarchar_field_t, ddecimal_field_t, ddate_field_t, dboolean_field_t, dtext_field_t, dtext_editor_t, dimage_field_t, denum_field_t, ddouble_field_t, ddatetime_field_t from test where id = vtarget;

  if dvarchar_field_s != dvarchar_field_t then
    set dfields = concat(dfields, '`varchar_field` = ', quote(dvarchar_field_t));
  end if;

  return concat('UPDATE test set ', dfields, ' WHERE id = ', vsource, ';');

END//
DELIMITER ;


-- Dumping structure for function mission.f_date_unformat
DROP FUNCTION IF EXISTS `f_date_unformat`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `f_date_unformat`(vvalue varchar(20)) RETURNS date
BEGIN
  declare dpos, dpos_next tinyint;
  declare dyeari smallint;
  declare dday, dmonth, dyear char(4);

  if vvalue is null then
    return null;
  end if;

  set dpos = (SELECT LOCATE('/', vvalue));
  set dday = substr(vvalue, 1, dpos -1);
  set dpos_next = dpos + 1;
  set dpos = (SELECT LOCATE('/', vvalue, dpos_next));
  set dmonth = substr(vvalue, dpos_next, dpos - dpos_next);
  set dpos_next = dpos + 1;
  set dyear = substr(vvalue, dpos_next);
  if length(dyear) = 2 then
    set dyeari = cast(dyear as unsigned) + 2000;
    if dyeari > 2030 then
      set dyeari = dyeari - 100;
    end if;
    set dyear = cast(dyeari as char(4));
  end if;

  return cast(concat(dyear, '-', dmonth, '-', dday) as date);

END//
DELIMITER ;


-- Dumping structure for function mission.f_insert_jset_atom
DROP FUNCTION IF EXISTS `f_insert_jset_atom`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `f_insert_jset_atom`(vkind tinyint, vweb_user varchar(45), vip varchar(45)) RETURNS bigint(20)
BEGIN
  DECLARE did BIGINT DEFAULT UUID_SHORT();

  INSERT INTO jset_atom (id, stamp, user, kind, web_user, ip)
    VALUES (did, NOW(), USER(), vkind, vweb_user, vip);

  RETURN did;
END//
DELIMITER ;


-- Dumping structure for function mission.f_insert_jset_atom_no_uuid
DROP FUNCTION IF EXISTS `f_insert_jset_atom_no_uuid`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `f_insert_jset_atom_no_uuid`(vkind tinyint, vweb_user varchar(45), vip varchar(45)) RETURNS bigint(20)
BEGIN
  INSERT INTO jset_atom (id, stamp, user, kind, web_user, ip)
    VALUES (null, NOW(), USER(), vkind, vweb_user, vip);

  RETURN (SELECT LAST_INSERT_ID());
END//
DELIMITER ;


-- Dumping structure for function mission.f_numeric_only
DROP FUNCTION IF EXISTS `f_numeric_only`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `f_numeric_only`(`str` VARCHAR(1000)) RETURNS varchar(1000) CHARSET utf8
    DETERMINISTIC
BEGIN
  DECLARE counter INT DEFAULT 0;
  DECLARE strLength INT DEFAULT 0;
  DECLARE strChar VARCHAR(1000) DEFAULT '' ;
  DECLARE retVal VARCHAR(1000) DEFAULT '';

  SET strLength = LENGTH(str);

  WHILE strLength > 0 DO
    SET counter = counter+1;
    SET strChar = SUBSTRING(str,counter,1);
    IF strChar REGEXP('[0-9]+') = 1
      THEN SET retVal = CONCAT(retVal,strChar);
    END IF;
    SET strLength = strLength -1;
    SET strChar = NULL;
  END WHILE;
RETURN if(retVal = '', null, retVal) ;
END//
DELIMITER ;


-- Dumping structure for function mission.f_sql
DROP FUNCTION IF EXISTS `f_sql`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `f_sql`() RETURNS varchar(8000) CHARSET utf8
BEGIN
return 'select * from test';

END//
DELIMITER ;


-- Dumping structure for table mission.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
REPLACE INTO `gender` (`id`, `name`) VALUES
	(1, 'זכר'),
	(2, 'נקבה');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;


-- Dumping structure for table mission.host
DROP TABLE IF EXISTS `host`;
CREATE TABLE IF NOT EXISTS `host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `db` varchar(45) DEFAULT NULL,
  `user` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.host: ~0 rows (approximately)
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;


-- Dumping structure for table mission.import_pad
DROP TABLE IF EXISTS `import_pad`;
CREATE TABLE IF NOT EXISTS `import_pad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a` text CHARACTER SET utf8,
  `b` text,
  `c` text,
  `d` text,
  `e` text,
  `f` text,
  `g` text,
  `h` text,
  `i` text,
  `j` text,
  `k` text,
  `l` text,
  `m` text,
  `n` text,
  `o` text,
  `p` text,
  `q` text,
  `r` text,
  `s` text,
  `t` text,
  `u` text,
  `v` text,
  `w` text,
  `x` text,
  `y` text,
  `z` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- Dumping data for table mission.import_pad: ~0 rows (approximately)
/*!40000 ALTER TABLE `import_pad` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_pad` ENABLE KEYS */;


-- Dumping structure for table mission.jset_atom
DROP TABLE IF EXISTS `jset_atom`;
CREATE TABLE IF NOT EXISTS `jset_atom` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stamp` datetime NOT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `kind` tinyint(3) unsigned DEFAULT NULL,
  `web_user` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=FIXED;

-- Dumping data for table mission.jset_atom: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_atom` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_atom` ENABLE KEYS */;


-- Dumping structure for table mission.jset_column
DROP TABLE IF EXISTS `jset_column`;
CREATE TABLE IF NOT EXISTS `jset_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `index` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `control` varchar(45) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `readonly` tinyint(1) DEFAULT NULL,
  `edithidden` tinyint(1) unsigned DEFAULT NULL,
  `noedit` tinyint(1) unsigned DEFAULT NULL,
  `unsortable` tinyint(1) unsigned DEFAULT NULL,
  `export` tinyint(1) unsigned DEFAULT NULL,
  `position` smallint(5) DEFAULT NULL,
  `rowpos` tinyint(4) DEFAULT NULL,
  `rowlabel` varchar(200) DEFAULT NULL,
  `default_value` varchar(2000) DEFAULT NULL,
  `search_default` varchar(100) DEFAULT NULL,
  `width` varchar(20) DEFAULT NULL,
  `usize` varchar(20) DEFAULT NULL,
  `height` varchar(20) DEFAULT NULL,
  `list` varchar(100) DEFAULT NULL,
  `src` varchar(200) DEFAULT NULL,
  `override` varchar(200) DEFAULT NULL,
  `help` varchar(2000) DEFAULT NULL,
  `validation` varchar(4000) DEFAULT NULL,
  `aggregate` varchar(200) DEFAULT NULL,
  `object` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent` (`parent`,`name`),
  CONSTRAINT `FK_jset_table_parent` FOREIGN KEY (`parent`) REFERENCES `jset_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_column: ~166 rows (approximately)
/*!40000 ALTER TABLE `jset_column` DISABLE KEYS */;
REPLACE INTO `jset_column` (`id`, `parent`, `name`, `index`, `title`, `control`, `hidden`, `readonly`, `edithidden`, `noedit`, `unsortable`, `export`, `position`, `rowpos`, `rowlabel`, `default_value`, `search_default`, `width`, `usize`, `height`, `list`, `src`, `override`, `help`, `validation`, `aggregate`, `object`) VALUES
	(1, 1, 'select_field', NULL, 'חבר', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, 'v_list', NULL, NULL, 'רשימת סוגי היחסים', NULL, NULL, NULL),
	(2, 1, 'integer_field', NULL, 'Integer', NULL, 0, 0, 0, 0, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, '90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 1, 'currency_field', NULL, 'Cost', 'currency', NULL, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 1, 'boolean_field', NULL, 'Active', 'checkbox', NULL, NULL, NULL, NULL, NULL, 1, NULL, 3, 'Main Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'how do you do', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(5, 1, 'text_editor', NULL, 'Article Text', 'editor', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, '300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'align:\'right\''),
	(6, 1, 'date_field', NULL, 'Birthdate', NULL, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, 'fx: db_utils::current_date()', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'The birthdate of the person we wish to inquire details about. this is the best part of the job man', NULL, NULL, NULL),
	(7, 1, 'id', NULL, NULL, 'intexact', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(8, 1, 'decimal_field', NULL, 'Amount', NULL, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, '888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'required:true, min:200', NULL, NULL),
	(9, 1, 'text_field', NULL, 'Article Body', 'editor', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 1, 'varchar_field', NULL, 'Note', 'upload_video', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 1, 'image_field', NULL, 'Picture', 'upload_image', 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 2, 'id', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 2, 'done', NULL, NULL, 'checkbox', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(14, 2, 'created', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 2, 'updated', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 2, 'description', NULL, '', 'editor', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 3, 'source', NULL, 'Source', 'textarea', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '100', '8', 'v_source', NULL, NULL, 'The data source of this record.', NULL, NULL, NULL),
	(18, 3, 'target', NULL, 'Target', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'v_target', NULL, NULL, 'The data target of this record.', NULL, NULL, NULL),
	(21, 1, 'multiselect_field', NULL, 'multi', 'multicheckbox', 0, 0, 0, 0, 0, 1, 0, 3, NULL, NULL, NULL, NULL, '120', '120', 'v_list', NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 1, 'iframe', NULL, NULL, 'grid_frame', 1, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'siblings.html', NULL, NULL, NULL, NULL, NULL),
	(23, 7, 'parent', NULL, 'Parent', 'intexact', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(24, 1, 'tab_frame', NULL, 'Tab Frame', '', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '440', '400', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(26, 4, 'parent', NULL, 'Parent', 'intexact', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(27, 8, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 8, 'gender', NULL, 'מין', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gender', NULL, NULL, NULL, NULL, NULL, NULL),
	(29, 8, 'first_name', NULL, 'שם פרטי', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, 8, 'last_name', NULL, 'שם משפחה', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 8, 'birth_date', NULL, 'תאריך לידה', 'date', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 8, 'picture', NULL, 'תמונה', 'upload', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 8, 'identity_id', NULL, 'תעודת זהות', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 1, 'double_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 3, 'help', 'help_table', 'Help', 'editor', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Help about the jset_table grid as a whole. It is available by pressing the lamp button on the grid.', NULL, NULL, NULL),
	(36, 3, 'title', 'title_table', 'Title', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, 'The title of the grid using this record as it\'s source.', NULL, NULL, NULL),
	(37, 3, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 3, 'name', NULL, 'Name', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, 'The name of this jset_table record.', NULL, NULL, NULL),
	(44, 1, 'float_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 1, 'parent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 1, 'enum_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 2, 'title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 2, 'due', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 3, 'description', NULL, 'Description', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, 'Description of this record, free text.', NULL, NULL, NULL),
	(128, 13, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(129, 13, 'parent', NULL, NULL, 'intexact', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(131, 13, 'help', NULL, 'Tip', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(138, 13, 'field', NULL, 'Field', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(142, 14, 'field', NULL, 'Field', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(143, 14, 'help', NULL, 'Tip', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(144, 14, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(145, 14, 'parent', NULL, NULL, 'intexact', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(146, 15, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(147, 15, 'name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(148, 15, 'password', NULL, NULL, 'password', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(149, 15, 'created', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(150, 15, 'ip', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(151, 1, 'datetime_field', NULL, NULL, 'datetime', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(152, 16, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(153, 16, 'name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(161, 18, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(162, 18, 'name', NULL, 'שם', NULL, NULL, NULL, NULL, NULL, NULL, 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(163, 18, 'url', NULL, 'כתובת', 'link', NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(164, 18, 'description', NULL, 'תאור', NULL, NULL, NULL, NULL, NULL, NULL, 1, 30, NULL, NULL, NULL, NULL, NULL, '147', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(165, 19, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(166, 19, 'parent', NULL, NULL, 'intexact', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(167, 19, 'before_insert', NULL, 'Before Insert', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Php method(s) to execute before inserting a record. Methods are separated by the tilda (~) character.', NULL, NULL, NULL),
	(168, 19, 'after_insert', NULL, 'After Insert', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Php method(s) to execute after inserting a record. Methods are separated by the tilda (~) character.', NULL, NULL, NULL),
	(169, 19, 'before_select', NULL, 'Before Select', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Not in use.', NULL, NULL, NULL),
	(170, 19, 'after_select', NULL, 'After Select', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Not in use yet.', NULL, NULL, NULL),
	(171, 19, 'before_update', NULL, 'Before Update', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Php method(s) to execute before updating a record. Methods are separated by the tilda (~) character.', NULL, NULL, NULL),
	(172, 19, 'after_update', NULL, 'After Update', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Php method(s) to execute after updating a record. Methods are separated by the tilda (~) character.', NULL, NULL, NULL),
	(173, 19, 'before_delete', NULL, 'Before Delete', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Php method(s) to execute before deleting record(s). Methods are separated by the tilda (~) character.', NULL, NULL, NULL),
	(174, 19, 'after_delete', NULL, 'After Delete', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Php method(s) to execute after deleting record(s). Methods are separated by the tilda (~) character.', NULL, NULL, NULL),
	(180, 4, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(181, 4, 'name', NULL, 'Name', NULL, 0, 0, 0, 0, NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, 'The name of this field. That should match the name of the field in the table or view.', NULL, NULL, NULL),
	(182, 4, 'index', NULL, 'Index', NULL, 0, 0, 0, 0, NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, 'When we have more than one grid on a page and a field have the same name on different grids, use this attribute to set a different id for a field.', NULL, NULL, NULL),
	(183, 4, 'title', NULL, 'Title', NULL, 0, 0, 0, 0, NULL, 1, NULL, 10, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, 'The title of the field.', NULL, NULL, NULL),
	(184, 4, 'control', NULL, 'Control', NULL, 0, 0, 0, 0, NULL, 1, NULL, 20, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, 'The gui control for this field. The full list of available controls can be found in the file jset/jquery/js/jquery.jset.components.js.', NULL, NULL, NULL),
	(185, 4, 'hidden', NULL, 'Hidden', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Set to hide the field.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(186, 4, 'edithidden', NULL, 'Edit Hidden', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'In conjunction with the hidden attribute, let an hidden filed be editable in the form.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(187, 4, 'noedit', NULL, 'No Edit', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Set to hide the field in the form, but show the field in the grid.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(188, 4, 'list', NULL, 'List', NULL, 0, 0, 0, 0, NULL, 1, NULL, 20, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, 'For the selectbox control, specify the name of the table or view of the control items.', NULL, NULL, NULL),
	(189, 4, 'rowpos', NULL, 'Row Position', NULL, 0, 0, 0, 0, NULL, 1, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Specifying fields with the same rowpos will cause them to be displayed on the same row in the edit form.', NULL, NULL, NULL),
	(190, 4, 'rowlabel', NULL, 'Row Label', NULL, 0, 0, 0, 0, NULL, 1, NULL, 40, NULL, NULL, NULL, NULL, '60', NULL, NULL, NULL, NULL, 'When using the rowpos attribute, this attribute sets the row lable.', NULL, NULL, NULL),
	(191, 4, 'position', NULL, 'Position', NULL, 0, 0, 0, 0, NULL, 1, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Control the order of the fields in the grid and in the form. By default fields are shown in the order of their appearance in the table/view of the source. The list is furthur ordered by the numbers in this attribute.', NULL, NULL, NULL),
	(192, 4, 'readonly', NULL, 'Read Only', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sets a field to be readonly.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(193, 4, 'default_value', NULL, 'Default Value', NULL, 0, 0, 0, 0, NULL, 1, NULL, 70, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, 'The default value for this field when creating a new record.', NULL, NULL, NULL),
	(194, 4, 'search_default', NULL, 'Default Filter', NULL, 0, 0, 0, 0, NULL, 1, NULL, 72, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, 'The default filter for this field.', NULL, NULL, NULL),
	(195, 4, 'override', NULL, 'Override', NULL, 1, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(196, 4, 'width', NULL, 'Column Width', NULL, 0, 0, 0, 0, NULL, 1, NULL, 60, NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, 'The width of the field in grid view. Note that the width is relative to the other fields in the grid. The default width is 80. Specifying a number greater than 80 will increase the width and vise versa.', NULL, NULL, NULL),
	(197, 4, 'usize', NULL, 'Field Width', NULL, 0, 0, 0, 0, NULL, 1, NULL, 60, NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, 'The width of the field in the edit form.', NULL, NULL, NULL),
	(198, 4, 'height', NULL, 'Field Height', NULL, 0, 0, 0, 0, NULL, 1, NULL, 60, NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, 'The height of this field\'s control in the form.', NULL, NULL, NULL),
	(199, 4, 'src', NULL, 'Source Url', NULL, 0, 0, 0, 0, NULL, 1, NULL, 20, NULL, NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, 'For the grid_frame control the url of the page to be shown.', NULL, NULL, NULL),
	(200, 4, 'help', NULL, 'Help', 'textarea', 0, 0, 0, 0, NULL, 1, NULL, 90, NULL, NULL, NULL, NULL, '120', '4', NULL, NULL, NULL, 'The help text for this field. The text is shown in the edit and view forms when we mouse over the field\'s title.', NULL, NULL, NULL),
	(201, 4, 'validation', NULL, 'Validation', 'textarea', 0, 0, 0, 0, NULL, 1, NULL, 80, NULL, NULL, NULL, NULL, '120', '4', NULL, NULL, NULL, 'Validation rules using the jquery validator plugin syntax.', NULL, NULL, NULL),
	(204, 20, 'active', NULL, 'Active', 'checkbox', 1, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(206, 20, 'host', NULL, 'Host', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, 'IP address or domain of the host.', NULL, NULL, NULL),
	(207, 20, 'id', NULL, NULL, NULL, 1, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(208, 20, 'name', NULL, 'Name', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, 'Name of the host, free text.', NULL, NULL, NULL),
	(209, 20, 'password', NULL, 'Password', 'password', 1, 0, 1, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, 'Database user password.', NULL, NULL, NULL),
	(210, 20, 'user', NULL, 'User', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, 'Database user name.', NULL, NULL, NULL),
	(211, 21, 'id', NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(212, 21, 'name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(213, 21, 'active', NULL, NULL, 'checkbox_edit', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(214, 21, 'approved', NULL, NULL, 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(215, 21, 'checked', NULL, NULL, 'checkbox_edit', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(217, 20, 'db_name', NULL, 'Database', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, 'jxset', NULL, '50', NULL, NULL, NULL, NULL, 'Database name.', NULL, NULL, NULL),
	(218, 3, 'system', NULL, 'System', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, '0', '30', NULL, NULL, NULL, NULL, NULL, 'If this is a system table, check it.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(225, 23, 'id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(226, 23, 'name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(227, 24, 'id', NULL, NULL, NULL, 0, 1, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(228, 24, 'name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(229, 24, 'integer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(230, 24, 'boolean', NULL, 'Boolean', 'checkbox', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(231, 24, 'text', NULL, NULL, 'editor', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(232, 24, 'decimal', NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'required:true', NULL, NULL),
	(233, 24, 'picture', NULL, NULL, 'upload_image', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(234, 24, 'select', NULL, NULL, 'selectbox', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bar', NULL, NULL, NULL, NULL, NULL, NULL),
	(235, 24, 'video', NULL, NULL, 'upload_video', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(236, 24, 'multiselect', NULL, NULL, 'multiselect', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'list', NULL, NULL, NULL, NULL, NULL, NULL),
	(237, 24, 'date', NULL, NULL, 'date', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(238, 25, 'id', NULL, NULL, NULL, 1, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(239, 25, 'editor', NULL, NULL, 'text', 1, 0, 0, 0, NULL, 1, 30, 10, 'Text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(240, 25, 'textarea', NULL, NULL, 'textarea', 1, 0, 0, 0, NULL, 1, 20, 10, NULL, NULL, NULL, NULL, '150', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(245, 25, 'mytext', NULL, NULL, 'editor_textarea', 0, 0, 0, 0, NULL, 1, NULL, 50, 'My Text', NULL, NULL, NULL, '150', '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(247, 25, 'yourtext', NULL, NULL, 'editor_textarea', 0, 0, 0, 0, NULL, 1, NULL, 60, 'Your Text', NULL, NULL, NULL, '160', '34', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(254, 26, 'id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(255, 26, 'float_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(256, 26, 'select_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(257, 26, 'multiselect_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(258, 26, 'integer_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(259, 26, 'currency_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(260, 26, 'varchar_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(261, 26, 'decimal_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(262, 26, 'date_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(263, 26, 'boolean_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(264, 26, 'text_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(265, 26, 'text_editor', NULL, NULL, 'editor', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(266, 26, 'image_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(267, 26, 'enum_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(268, 26, 'double_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(269, 26, 'datetime_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(270, 27, 'id', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(271, 27, 'qid', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(272, 27, 'qtext', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(273, 27, 'value', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(274, 27, 'qid_', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(275, 4, 'unsortable', NULL, 'Unsortable', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Check this field if you wish this column to not be sortable.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(277, 27, 'offer_id', NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(278, 4, 'object', NULL, 'Object', 'textarea', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, NULL, '120', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(279, 3, 'validation', NULL, 'Validation', 'textarea', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '100', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(280, 28, 'id', NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(281, 28, 'category', NULL, 'קטגוריה', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, '40', NULL, NULL, 'mission_category', NULL, NULL, 'קטגורית המשימה', NULL, NULL, NULL),
	(282, 28, 'name', NULL, 'סעיף', NULL, 0, 0, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, '25', '3', NULL, NULL, NULL, NULL, 'סעיף, מספור המשימה. \nמאפשר לנו לקרוא למשימה בשם פשוט ויחודי', NULL, NULL, NULL),
	(283, 28, 'description', NULL, 'תאור', 'editor', 0, 0, 0, 0, 0, 1, NULL, 122, NULL, NULL, NULL, '200', '800', '200', NULL, NULL, NULL, 'תאור ואיפיון המשימה.\nאפשר להכניס לשדה זה תאור עם תמונות מסך וטקסט מעוצב.', NULL, NULL, NULL),
	(284, 28, 'estimated_hours', NULL, 'תמחור', NULL, 0, 0, 0, 0, 0, 1, NULL, 110, NULL, NULL, NULL, '25', '3', NULL, NULL, NULL, NULL, 'הצעת מחיר בשעות, ימולא על ידי המפתח לאחר שהמשימה אופיינה.', NULL, 'sum(estimated_hours)', NULL),
	(285, 28, 'approved', NULL, 'מאושר?', 'checkbox', 0, 0, 0, 0, 0, 1, NULL, 110, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 'הצעת המחיר מאושרת.\nהשדה יסומן לציין שהצעת המחיר מאושרת ואפשר להתחיל את תהליך הפיתוח', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(286, 28, 'approved_date', NULL, 'תאריך אישור', NULL, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(287, 28, 'due_date', NULL, 'תאריך משוער', NULL, 0, 0, 0, 0, 0, 1, NULL, 120, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, NULL, 'תאריך משוער לביצוע המשימה.\nימולא על ידי המפתח לאחר שהמשימה אושרה', NULL, NULL, NULL),
	(288, 28, 'delivery_date', NULL, 'תאריך ביצוע', 'custom_date', 0, 0, 0, 0, 0, 1, NULL, 120, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, NULL, 'התאריך בו בוצעה המשימה והועלתה אל שרת הפיתוח', NULL, NULL, NULL),
	(289, 28, 'invoice_number', NULL, 'חשבונית', NULL, 0, 0, 0, 0, 0, 1, NULL, 120, NULL, NULL, NULL, '30', '3', NULL, NULL, NULL, NULL, 'ימולא על ידי המפתח לציין באיזו חשבונית חוייבה העבודה על המשימה', NULL, NULL, NULL),
	(290, 28, 'status', NULL, 'סטטוס', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, '1', NULL, '40', NULL, NULL, 'mission_status', NULL, NULL, 'סטטוסי המשימה:\nאופיין - המשימה אופיינה וממתינה להצעת מחיר\nהצעת מחיר - המפתח נתן  הצעת מחיר וממתין לאישור\nטופל - המשימה שאושרה פותחה וממתינה לבדיקה בשרת הפיתוח\nנבדק - המשימה נבדקה בהצלחה וממתינה להתקנה בשרת העבודה\nטיפול חוזר - המשימה נבדקה ואינה עובדת כהלכה\nבוצע - המשימה הועלתה אל שרת העבודה', NULL, NULL, NULL),
	(292, 28, 'comments', NULL, 'הערות', 'textarea', 0, 0, 0, 0, 0, 1, NULL, 124, NULL, NULL, NULL, '180', '160', '8', NULL, NULL, NULL, 'הערות על המשימה.\nבכל שלב אפשר להוסיף כאן הערות', NULL, NULL, NULL),
	(296, 28, 'picture', NULL, 'תמונה', 'upload_file', 1, 0, 1, 0, 0, 1, NULL, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'צרף תמונה', NULL, NULL, NULL),
	(299, 28, 'created_on', NULL, 'זמן יצירה', 'timestamp', 0, 1, 0, 0, 0, 1, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'הזמן בו נוצרה המשימה', NULL, NULL, NULL),
	(302, 28, 'priority', NULL, 'עדיפות', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, '1', NULL, '40', NULL, NULL, 'v_priority', NULL, NULL, NULL, NULL, NULL, NULL),
	(303, 28, 'actual_hours', NULL, 'חיוב', NULL, 1, 0, 1, 0, 0, 0, NULL, 110, NULL, NULL, NULL, '20', '3', NULL, NULL, NULL, NULL, 'חיוב בפועל עבור המשימה', NULL, NULL, NULL),
	(304, 28, 'charged_hours', NULL, 'חיוב', NULL, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sum(charged_hours)', NULL);
/*!40000 ALTER TABLE `jset_column` ENABLE KEYS */;


-- Dumping structure for table mission.jset_default_column
DROP TABLE IF EXISTS `jset_default_column`;
CREATE TABLE IF NOT EXISTS `jset_default_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  `Collation` varchar(100) DEFAULT NULL,
  `Null` varchar(100) DEFAULT NULL,
  `Key` varchar(100) DEFAULT NULL,
  `Default` varchar(100) DEFAULT NULL,
  `Extra` varchar(100) DEFAULT NULL,
  `Privileges` varchar(100) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_default_column: ~1 rows (approximately)
/*!40000 ALTER TABLE `jset_default_column` DISABLE KEYS */;
REPLACE INTO `jset_default_column` (`id`, `Type`, `Collation`, `Null`, `Key`, `Default`, `Extra`, `Privileges`, `Comment`) VALUES
	(1, 'varchar', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `jset_default_column` ENABLE KEYS */;


-- Dumping structure for table mission.jset_error
DROP TABLE IF EXISTS `jset_error`;
CREATE TABLE IF NOT EXISTS `jset_error` (
  `id` bigint(20) NOT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mission.jset_error: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_error` ENABLE KEYS */;


-- Dumping structure for table mission.jset_event
DROP TABLE IF EXISTS `jset_event`;
CREATE TABLE IF NOT EXISTS `jset_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL,
  `before_insert` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `after_insert` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `before_select` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `after_select` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `before_update` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `after_update` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `before_delete` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `after_delete` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent` (`parent`) USING BTREE,
  CONSTRAINT `FK_jset_event_parent` FOREIGN KEY (`parent`) REFERENCES `jset_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table mission.jset_event: ~1 rows (approximately)
/*!40000 ALTER TABLE `jset_event` DISABLE KEYS */;
REPLACE INTO `jset_event` (`id`, `parent`, `before_insert`, `after_insert`, `before_select`, `after_select`, `before_update`, `after_update`, `before_delete`, `after_delete`) VALUES
	(2, 3, NULL, 'jset_columns_mysql::create_columns(id,source)~jset_event::create_event(id)', NULL, NULL, NULL, 'jset_columns_mysql::create_columns(id,source)~jset_event::create_event(id)', NULL, NULL);
/*!40000 ALTER TABLE `jset_event` ENABLE KEYS */;


-- Dumping structure for table mission.jset_host
DROP TABLE IF EXISTS `jset_host`;
CREATE TABLE IF NOT EXISTS `jset_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` varchar(50) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `db_name` varchar(45) DEFAULT NULL,
  `user` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_host: ~1 rows (approximately)
/*!40000 ALTER TABLE `jset_host` DISABLE KEYS */;
REPLACE INTO `jset_host` (`id`, `active`, `name`, `host`, `port`, `server`, `db_name`, `user`, `password`) VALUES
	(1, 1, 'localhost', 'localhost', '3306', 'mysql', 'mission', 'root', NULL);
/*!40000 ALTER TABLE `jset_host` ENABLE KEYS */;


-- Dumping structure for table mission.jset_layout
DROP TABLE IF EXISTS `jset_layout`;
CREATE TABLE IF NOT EXISTS `jset_layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `pos` tinyint(3) unsigned DEFAULT NULL,
  `prefix` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table mission.jset_layout: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_layout` ENABLE KEYS */;


-- Dumping structure for table mission.jset_list
DROP TABLE IF EXISTS `jset_list`;
CREATE TABLE IF NOT EXISTS `jset_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_list: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_list` ENABLE KEYS */;


-- Dumping structure for table mission.jset_log_mission_
DROP TABLE IF EXISTS `jset_log_mission_`;
CREATE TABLE IF NOT EXISTS `jset_log_mission_` (
  `uuid` bigint(20) NOT NULL,
  `id` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(100) DEFAULT NULL,
  `category` smallint(7) DEFAULT NULL,
  `description` text,
  `estimated_hours` decimal(10,2) DEFAULT NULL,
  `actual_hours` decimal(10,2) DEFAULT NULL,
  `approved` tinyint(4) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` text,
  `invoice_number` mediumint(9) DEFAULT NULL,
  `picture` varchar(250) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_log_mission_: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_log_mission_` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_log_mission_` ENABLE KEYS */;


-- Dumping structure for table mission.jset_semaphore
DROP TABLE IF EXISTS `jset_semaphore`;
CREATE TABLE IF NOT EXISTS `jset_semaphore` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stamp_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stamp_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mission.jset_semaphore: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_semaphore` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_semaphore` ENABLE KEYS */;


-- Dumping structure for table mission.jset_sql
DROP TABLE IF EXISTS `jset_sql`;
CREATE TABLE IF NOT EXISTS `jset_sql` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sql` varchar(8000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_sql: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_sql` ENABLE KEYS */;


-- Dumping structure for table mission.jset_table
DROP TABLE IF EXISTS `jset_table`;
CREATE TABLE IF NOT EXISTS `jset_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `source` varchar(8000) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `help` text,
  `validation` varchar(8000) DEFAULT NULL,
  `system` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_table: ~20 rows (approximately)
/*!40000 ALTER TABLE `jset_table` DISABLE KEYS */;
REPLACE INTO `jset_table` (`id`, `name`, `description`, `title`, `source`, `target`, `help`, `validation`, `system`) VALUES
	(1, 'test', NULL, 'Go Jo', 'v_test', 'test', NULL, NULL, 0),
	(2, 'task', NULL, NULL, 'task', 'task', NULL, NULL, 0),
	(3, 'jset_table', 'Manage grid definition', 'Tables', 'jset_table', 'jset_table', '<div>This grid let you define data objects to be used by grids in an application.</div>', NULL, 1),
	(4, 'jset_column', NULL, 'Columns', 'jset_column', 'jset_column', 'This grid let you define attributes for each field in a grid. Help on each attribute\'s meaning is available in edit and view modes by moving the mouse over an attribute name.', NULL, 1),
	(7, 'siblings', NULL, NULL, 'siblings', 'siblings', NULL, NULL, 0),
	(8, 'person', NULL, 'People', 'person', 'person', NULL, NULL, 0),
	(13, 'jset_help', NULL, 'Help Tips', 'v_jset_help', 'jset_column', NULL, NULL, 1),
	(14, 'jset_help2', NULL, 'HELP ME 2', 'v_jset_help', 'jset_column', NULL, NULL, 1),
	(15, 'login', NULL, NULL, 'v_login', 'login', NULL, NULL, 0),
	(16, 'list', NULL, NULL, 'list', 'list', NULL, NULL, 0),
	(18, 'youtube', NULL, NULL, 'youtube', 'youtube', NULL, NULL, 0),
	(19, 'jset_event', NULL, 'Events', 'jset_event', 'jset_event', 'This grid let you define events for a grid.<br />An event is a php method that can be set to run on the following situations:<br /><br />before insert<br />after insert<br />before select<br />after select<br />before update<br />after update<br />before delete<br />after delete<br /><br />', NULL, 1),
	(20, 'jset_host', NULL, 'Hosts', 'jset_host', 'jset_host', 'This grid let you define credentials for accessing projects.', NULL, 1),
	(21, 'inline', NULL, 'Inline', 'inline', 'inline', NULL, NULL, 0),
	(23, 'test2', NULL, NULL, 'bar', 'bar', NULL, NULL, 0),
	(24, 'demo', NULL, NULL, 'demo', 'demo', NULL, NULL, 0),
	(25, 'editor_textarea', NULL, NULL, 'editor_textarea', 'editor_textarea', NULL, NULL, 0),
	(26, 'sql_test', NULL, NULL, 'select * from test', 'test', NULL, NULL, 0),
	(27, 'hierarchical', NULL, 'Hierarchical', 'select id, offer_id, if(q_id = @qid, null, q_id) as qid,\nif(q_id = @qid, null, `text`) as `qtext`, `value`,\n@qid:=q_id as qid_ from (select @qid:=0) z,\n(select a.id, q.offer_id, q.id as q_id, q.`text`,\nq.priority as qpriority, a.`value`, a.priority as apriotiry\nFROM `distribution_questions` q\nleft join `distribution_question_values` a\non q.id = a.question_id\nwhere a.id is not null\norder by q.offer_id, q.priority, a.priority) qa', 'distribution_question_values', NULL, NULL, 0),
	(28, 'mission', NULL, 'משימות לביצוע', 'v_mission', 'mission', '<div style="text-align: right;" dir="rtl">\n<h1>משימות לביצוע במערכת סופרסטאר</h1>\n</div>\n<div style="text-align: right;" dir="rtl">\n<h2>תהליך הגדרת וביצוע משימה</h2>\n</div>\n<div style="text-align: right;" dir="rtl">משימה נוצרת כשזוהה צורך בתיקון, שינוי או הרחבה של המערכת.</div>\n<div style="text-align: right;" dir="rtl">\n<h3>שלב ראשון</h3>\n</div>\n<div style="text-align: right;" dir="rtl">המשימה תאופיין ותתווסף לרשימת המשימות בסטטוס <em><strong>אופיין</strong></em>.</div>\n<div style="text-align: right;" dir="rtl">\n<div style="text-align: right;" dir="rtl">\n<h3>שלב שני</h3>\n</div>\n</div>\n<div style="text-align: right;" dir="rtl">המפתח יקבל את האיפיון ויתבקש לתת הצעת מחיר.</div>\n<div style="text-align: right;" dir="rtl">המפתח ירשום את הערכת זמן העבודה לביצוע המשימה, בשעות, בשדה <strong>תמחור</strong> וישנה את הסטטוס ל<em><strong>הצעת מחיר</strong></em>.</div>\n<div style="text-align: right;" dir="rtl">\n<h3>שלב שלישי</h3>\n</div>\n<div style="text-align: right;" dir="rtl">פול תתבקש לאשר הצעות מחיר. האישור יעשה על ידי סימון השדה <strong>אושר?</strong>.</div>\n<div style="text-align: right;" dir="rtl">\n<h3>שלב רביעי</h3>\n</div>\n<div style="text-align: right;" dir="rtl">המפתח יפתח את המשימות שאושרו, יעלה את העידכונים אל שרת הפיתוח וישנה את הסטטוס ל<em><strong>טופל</strong></em>.</div>\n<div style="text-align: right;" dir="rtl">\n<h3>שלב חמישי</h3>\n</div>\n<div style="text-align: right;" dir="rtl">ענת תבדוק את המשימות שטופלו ותסמן משימות שעובדות כהלכה בסטטוס <em><strong>נבדק.</strong></em></div>\n<div style="text-align: right;" dir="rtl">משימות שלא עובדות כהלכה יסומנו בסטטוס <em><strong>טיפול חוזר</strong></em>. בשדה <strong>הערות </strong>יכתב מדוע המשימה נשלחה לטיפול חוזר.</div>\n<div style="text-align: right;" dir="rtl">\n<h3>שלב שישי</h3>\n</div>\n<div style="text-align: right;" dir="rtl">המפתח יעלה הפיתוחים שנבדקו אל שרת העבודה וישנה את הסטטוס ל<em><strong>בוצע</strong></em>.</div>\n<div style="text-align: right;" dir="rtl">&nbsp;</div>', NULL, 0);
/*!40000 ALTER TABLE `jset_table` ENABLE KEYS */;


-- Dumping structure for table mission.jset_upload
DROP TABLE IF EXISTS `jset_upload`;
CREATE TABLE IF NOT EXISTS `jset_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_upload: ~0 rows (approximately)
/*!40000 ALTER TABLE `jset_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `jset_upload` ENABLE KEYS */;


-- Dumping structure for table mission.lists
DROP TABLE IF EXISTS `lists`;
CREATE TABLE IF NOT EXISTS `lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table mission.lists: ~5 rows (approximately)
/*!40000 ALTER TABLE `lists` DISABLE KEYS */;
REPLACE INTO `lists` (`id`, `value`, `name`, `type`) VALUES
	(3, 2, '2', 'priority'),
	(4, 3, '3', 'priority'),
	(5, 4, '4', 'priority'),
	(6, 5, '5', 'priority'),
	(7, 1, '1', 'priority');
/*!40000 ALTER TABLE `lists` ENABLE KEYS */;


-- Dumping structure for table mission.login
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.login: ~0 rows (approximately)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


-- Dumping structure for table mission.machine
DROP TABLE IF EXISTS `machine`;
CREATE TABLE IF NOT EXISTS `machine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(3) unsigned DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.machine: ~0 rows (approximately)
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;


-- Dumping structure for table mission.machine_log
DROP TABLE IF EXISTS `machine_log`;
CREATE TABLE IF NOT EXISTS `machine_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `machine` varchar(100) DEFAULT NULL,
  `sql` varchar(2000) DEFAULT NULL,
  `result` tinyint(4) DEFAULT NULL,
  `affected_rows` int(11) DEFAULT NULL,
  `error` varchar(2200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mission.machine_log: 0 rows
/*!40000 ALTER TABLE `machine_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_log` ENABLE KEYS */;


-- Dumping structure for table mission.machine_sql
DROP TABLE IF EXISTS `machine_sql`;
CREATE TABLE IF NOT EXISTS `machine_sql` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT NULL,
  `active` tinyint(3) unsigned DEFAULT NULL,
  `order` tinyint(3) unsigned DEFAULT NULL,
  `sql` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.machine_sql: ~0 rows (approximately)
/*!40000 ALTER TABLE `machine_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_sql` ENABLE KEYS */;


-- Dumping structure for table mission.mission
DROP TABLE IF EXISTS `mission`;
CREATE TABLE IF NOT EXISTS `mission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(100) DEFAULT NULL,
  `category` smallint(7) DEFAULT NULL,
  `description` text,
  `estimated_hours` decimal(10,2) DEFAULT NULL,
  `actual_hours` decimal(10,2) DEFAULT NULL,
  `approved` tinyint(4) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` text,
  `invoice_number` mediumint(9) DEFAULT NULL,
  `picture` varchar(250) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table mission.mission: ~0 rows (approximately)
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;


-- Dumping structure for table mission.mission_category
DROP TABLE IF EXISTS `mission_category`;
CREATE TABLE IF NOT EXISTS `mission_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.mission_category: ~5 rows (approximately)
/*!40000 ALTER TABLE `mission_category` DISABLE KEYS */;
REPLACE INTO `mission_category` (`id`, `name`) VALUES
	(1, 'פיתוח'),
	(2, 'באג'),
	(3, 'תחזוקה'),
	(4, 'ייעוץ'),
	(5, 'אחר');
/*!40000 ALTER TABLE `mission_category` ENABLE KEYS */;


-- Dumping structure for table mission.mission_status
DROP TABLE IF EXISTS `mission_status`;
CREATE TABLE IF NOT EXISTS `mission_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.mission_status: ~7 rows (approximately)
/*!40000 ALTER TABLE `mission_status` DISABLE KEYS */;
REPLACE INTO `mission_status` (`id`, `name`) VALUES
	(1, 'אופיין'),
	(2, 'הצעת מחיר'),
	(3, 'טופל'),
	(4, 'נבדק'),
	(5, 'טיפול חוזר'),
	(6, 'בוצע'),
	(7, 'לא הושלם');
/*!40000 ALTER TABLE `mission_status` ENABLE KEYS */;


-- Dumping structure for procedure mission.p_copy_jset_columns
DROP PROCEDURE IF EXISTS `p_copy_jset_columns`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_copy_jset_columns`(vsource varchar(45), vtarget varchar(45))
BEGIN
  declare did int;

  insert into jset_table (name, source, target) values(vtarget, vtarget, vtarget);
  set did = (select LAST_INSERT_ID());

  insert into jset_column (`parent`, `name`, `index`, `title`, `control`, `hidden`, `edithidden`, `noedit`, `list`, `rowpos`, `rowlabel`, `position`, `readonly`, `default_value`, `search_default`, `override`, `width`, `usize`, `height`, `src`)
  select did, `name`, `index`, `title`, `control`, `hidden`, `edithidden`, `noedit`, `list`, `rowpos`, `rowlabel`, `position`, `readonly`, `default_value`, `search_default`, `override`, `width`, `usize`, `height`, `src`
  from jset_column where parent = (select id from jset_table where name = vsource);

  select did as id;
END//
DELIMITER ;


-- Dumping structure for procedure mission.p_execute
DROP PROCEDURE IF EXISTS `p_execute`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_execute`(vsql varchar(8000))
BEGIN
SET @s = vsql;
PREPARE s from @s;
EXECUTE s;
DEALLOCATE PREPARE s;

END//
DELIMITER ;


-- Dumping structure for procedure mission.p_set_jset_semaphore
DROP PROCEDURE IF EXISTS `p_set_jset_semaphore`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_set_jset_semaphore`(vname varchar(45), vvalue tinyint)
BEGIN
declare dfalg tinyint;
declare did int;
declare dend timestamp;

select id, `stamp_end` into did, dend from jset_semaphore where `name` = vname order by id desc limit 1;

IF vvalue = 1 THEN
  if dend is not null or did is null then
    insert into jset_semaphore (`name`) values (vname);
    select 1 as result;
  else
    select 0 as result;
  end if;
ELSE
  if did is not null and dend is null then
    update jset_semaphore set `stamp_end` = now() where id = did;
    select 1 as result;
  else
    select 0 as result;
  end if;
end if;

END//
DELIMITER ;


-- Dumping structure for view mission.v_databases
DROP VIEW IF EXISTS `v_databases`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_databases` (
	`databases` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_jset_help
DROP VIEW IF EXISTS `v_jset_help`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_jset_help` (
	`id` INT(10) UNSIGNED NOT NULL,
	`parent` INT(10) UNSIGNED NOT NULL,
	`field` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`help` VARCHAR(2000) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_jset_host
DROP VIEW IF EXISTS `v_jset_host`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_jset_host` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`db_name` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`user` VARCHAR(40) NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(40) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_jset_table
DROP VIEW IF EXISTS `v_jset_table`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_jset_table` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`title` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`source` VARCHAR(8000) NULL COLLATE 'utf8_general_ci',
	`target` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`help` TEXT NULL COLLATE 'utf8_general_ci',
	`columns` INT(10) UNSIGNED NOT NULL,
	`events` INT(10) UNSIGNED NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_jset_table_name
DROP VIEW IF EXISTS `v_jset_table_name`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_jset_table_name` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_login
DROP VIEW IF EXISTS `v_login`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_login` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`password` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`created` TIMESTAMP NOT NULL,
	`ip` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_mission
DROP VIEW IF EXISTS `v_mission`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_mission` (
	`id` INT(10) NOT NULL,
	`created_on` TIMESTAMP NOT NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`category` SMALLINT(7) NULL,
	`description` TEXT NULL COLLATE 'utf8_general_ci',
	`estimated_hours` DECIMAL(10,2) NULL,
	`actual_hours` DECIMAL(10,2) NULL,
	`charged_hours` DECIMAL(10,2) NULL,
	`approved` TINYINT(4) NULL,
	`approved_date` DATE NULL,
	`due_date` DATE NULL,
	`delivery_date` DATE NULL,
	`status` SMALLINT(6) NULL,
	`comments` TEXT NULL COLLATE 'utf8_general_ci',
	`invoice_number` MEDIUMINT(9) NULL,
	`picture` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`priority` SMALLINT(6) NULL
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_priority
DROP VIEW IF EXISTS `v_priority`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_priority` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(250) NULL COLLATE 'utf8_bin'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_quickbi
DROP VIEW IF EXISTS `v_quickbi`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_quickbi` (
	`id` INT(10) UNSIGNED NOT NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`title` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`source` VARCHAR(8000) NULL COLLATE 'utf8_general_ci',
	`target` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`help` TEXT NULL COLLATE 'utf8_general_ci',
	`system` TINYINT(3) UNSIGNED NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_source
DROP VIEW IF EXISTS `v_source`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_source` (
	`id` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_tables
DROP VIEW IF EXISTS `v_tables`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_tables` (
	`TABLE_NAME` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_target
DROP VIEW IF EXISTS `v_target`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_target` (
	`id` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci',
	`name` VARCHAR(64) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_databases
DROP VIEW IF EXISTS `v_databases`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_databases`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_databases` AS select `schemata`.`SCHEMA_NAME` AS `databases` from `information_schema`.`schemata` order by `schemata`.`SCHEMA_NAME` ;


-- Dumping structure for view mission.v_jset_help
DROP VIEW IF EXISTS `v_jset_help`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_jset_help`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_jset_help` AS select `jset_column`.`id` AS `id`,`jset_column`.`parent` AS `parent`,if((`jset_column`.`title` is not null),`jset_column`.`title`,`jset_column`.`name`) AS `field`,`jset_column`.`help` AS `help` from `jset_column` where ((isnull(`jset_column`.`hidden`) and isnull(`jset_column`.`noedit`)) or `jset_column`.`edithidden`) ;


-- Dumping structure for view mission.v_jset_host
DROP VIEW IF EXISTS `v_jset_host`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_jset_host`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_jset_host` AS select `host`.`id` AS `id`,`host`.`name` AS `name`,`host`.`host` AS `host`,`host`.`db` AS `db_name`,`host`.`user` AS `user`,`host`.`password` AS `password` from `host` ;


-- Dumping structure for view mission.v_jset_table
DROP VIEW IF EXISTS `v_jset_table`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_jset_table`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_jset_table` AS select `jset_table`.`id` AS `id`,`jset_table`.`name` AS `name`,`jset_table`.`description` AS `description`,`jset_table`.`title` AS `title`,`jset_table`.`source` AS `source`,`jset_table`.`target` AS `target`,`jset_table`.`help` AS `help`,`jset_table`.`id` AS `columns`,`jset_table`.`id` AS `events` from `jset_table` ;


-- Dumping structure for view mission.v_jset_table_name
DROP VIEW IF EXISTS `v_jset_table_name`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_jset_table_name`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_jset_table_name` AS select `jset_table`.`id` AS `id`,`jset_table`.`name` AS `name` from `jset_table` ;


-- Dumping structure for view mission.v_login
DROP VIEW IF EXISTS `v_login`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_login`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_login` AS select `login`.`id` AS `id`,`login`.`name` AS `name`,`login`.`password` AS `password`,`login`.`created` AS `created`,`login`.`ip` AS `ip` from `login` ;


-- Dumping structure for view mission.v_mission
DROP VIEW IF EXISTS `v_mission`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_mission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_mission` AS select 
	`id`,
	`created_on`,
	`name`,
	`category`,
	`description`,
	`estimated_hours`,
	`actual_hours`,
	if(`status` > 2 , if(actual_hours is not null, actual_hours, estimated_hours), null) as charged_hours,
	`approved`,
	`approved_date`,
	`due_date`,
	`delivery_date`,
	`status`,
	`comments`,
	`invoice_number`,
	`picture`,
	`priority`
	from mission ;


-- Dumping structure for view mission.v_priority
DROP VIEW IF EXISTS `v_priority`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_priority`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_priority` AS SELECT value as id, name from lists where `type` = 'priority' order by value ;


-- Dumping structure for view mission.v_quickbi
DROP VIEW IF EXISTS `v_quickbi`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_quickbi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_quickbi` AS select `jset_table`.`id` AS `id`,`jset_table`.`name` AS `name`,`jset_table`.`description` AS `description`,`jset_table`.`title` AS `title`,`jset_table`.`source` AS `source`,`jset_table`.`target` AS `target`,`jset_table`.`help` AS `help`,`jset_table`.`system` AS `system` from `jset_table` ;


-- Dumping structure for view mission.v_source
DROP VIEW IF EXISTS `v_source`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_source`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_source` AS select `tables`.`TABLE_NAME` AS `id`,`tables`.`TABLE_NAME` AS `name` from `information_schema`.`tables` where (`tables`.`TABLE_SCHEMA` = database()) ;


-- Dumping structure for view mission.v_tables
DROP VIEW IF EXISTS `v_tables`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_tables`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_tables` AS select `tables`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`tables` where (`tables`.`TABLE_SCHEMA` = database()) ;


-- Dumping structure for view mission.v_target
DROP VIEW IF EXISTS `v_target`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_target`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_target` AS select `tables`.`TABLE_NAME` AS `id`,`tables`.`TABLE_NAME` AS `name` from `information_schema`.`tables` where ((`tables`.`TABLE_SCHEMA` = database()) and (`tables`.`TABLE_TYPE` = 'BASE TABLE')) ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
