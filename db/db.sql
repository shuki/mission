-- --------------------------------------------------------
-- מארח:                         127.0.0.1
-- Server version:               5.5.16 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL גירסא:               8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table mission.action
DROP TABLE IF EXISTS `action`;
CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.action: ~4 rows (approximately)
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
REPLACE INTO `action` (`id`, `parent`, `creation_date`, `modify_date`, `creator`, `date`, `description`, `status`) VALUES
	(2, 2, '2014-11-03 13:29:42', '2014-11-03 13:29:42', 1, '2014-11-03', 'התחלתי להבין מה קורה?\n', 3),
	(4, 2, '2014-11-03 14:36:36', '2014-11-03 14:36:36', 1, '2014-11-03', NULL, 5),
	(5, 2, '2014-11-07 16:48:33', '2014-11-07 16:48:33', 1, '2014-11-07', 'המשימה טופלה כראוי', 4),
	(6, 2, '2014-11-07 16:49:12', '2014-11-07 16:49:12', 1, '2014-11-07', NULL, 8);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;


-- Dumping structure for table mission.document
DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) NOT NULL,
  `table` varchar(50) NOT NULL,
  `type` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.document: ~0 rows (approximately)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=23739657292349483 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=FIXED;

-- Dumping data for table mission.jset_atom: ~45 rows (approximately)
/*!40000 ALTER TABLE `jset_atom` DISABLE KEYS */;
REPLACE INTO `jset_atom` (`id`, `stamp`, `user`, `kind`, `web_user`, `ip`) VALUES
	(23644302273937448, '2014-09-08 16:02:50', 'root@localhost', 0, NULL, '::1'),
	(23644302273937449, '2014-09-08 16:02:51', 'root@localhost', 0, NULL, '::1'),
	(23739657292349440, '2014-11-03 10:08:00', 'root@localhost', 0, NULL, '::1'),
	(23739657292349441, '2014-11-03 10:08:00', 'root@localhost', 0, NULL, '::1'),
	(23739657292349442, '2014-11-03 10:10:11', 'root@localhost', 0, NULL, '::1'),
	(23739657292349443, '2014-11-03 10:10:11', 'root@localhost', 0, NULL, '::1'),
	(23739657292349444, '2014-11-03 10:10:12', 'root@localhost', 0, NULL, '::1'),
	(23739657292349445, '2014-11-03 10:10:12', 'root@localhost', 0, NULL, '::1'),
	(23739657292349446, '2014-11-03 10:10:32', 'root@localhost', 0, NULL, '::1'),
	(23739657292349447, '2014-11-03 10:10:32', 'root@localhost', 0, NULL, '::1'),
	(23739657292349448, '2014-11-03 10:10:34', 'root@localhost', 0, NULL, '::1'),
	(23739657292349449, '2014-11-03 10:10:34', 'root@localhost', 0, NULL, '::1'),
	(23739657292349450, '2014-11-03 10:21:05', 'root@localhost', 0, NULL, '::1'),
	(23739657292349451, '2014-11-03 11:37:00', 'root@localhost', 0, NULL, '::1'),
	(23739657292349452, '2014-11-03 11:37:00', 'root@localhost', 0, NULL, '::1'),
	(23739657292349453, '2014-11-03 12:26:38', 'root@localhost', 0, NULL, '::1'),
	(23739657292349454, '2014-11-03 12:41:31', 'root@localhost', 0, NULL, '::1'),
	(23739657292349455, '2014-11-03 12:41:31', 'root@localhost', 0, NULL, '::1'),
	(23739657292349456, '2014-11-03 12:41:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349457, '2014-11-03 12:41:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349458, '2014-11-03 12:41:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349459, '2014-11-03 12:41:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349460, '2014-11-03 12:46:36', 'root@localhost', 0, NULL, '::1'),
	(23739657292349461, '2014-11-03 12:46:36', 'root@localhost', 0, NULL, '::1'),
	(23739657292349462, '2014-11-03 12:49:04', 'root@localhost', 0, NULL, '::1'),
	(23739657292349463, '2014-11-03 12:49:04', 'root@localhost', 0, NULL, '::1'),
	(23739657292349464, '2014-11-03 12:49:04', 'root@localhost', 0, NULL, '::1'),
	(23739657292349465, '2014-11-03 12:49:04', 'root@localhost', 0, NULL, '::1'),
	(23739657292349466, '2014-11-04 08:13:06', 'root@localhost', 0, NULL, '::1'),
	(23739657292349467, '2014-11-04 08:13:06', 'root@localhost', 0, NULL, '::1'),
	(23739657292349468, '2014-11-04 08:34:31', 'root@localhost', 0, NULL, '::1'),
	(23739657292349469, '2014-11-04 08:34:31', 'root@localhost', 0, NULL, '::1'),
	(23739657292349470, '2014-11-04 08:35:03', 'root@localhost', 0, NULL, '::1'),
	(23739657292349471, '2014-11-04 08:35:03', 'root@localhost', 0, NULL, '::1'),
	(23739657292349472, '2014-11-04 08:55:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349473, '2014-11-04 08:55:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349474, '2014-11-04 08:55:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349475, '2014-11-04 08:55:50', 'root@localhost', 0, NULL, '::1'),
	(23739657292349476, '2014-11-07 16:29:47', 'root@localhost', 0, NULL, '::1'),
	(23739657292349477, '2014-11-07 16:29:47', 'root@localhost', 0, NULL, '::1'),
	(23739657292349478, '2014-11-07 16:49:27', 'root@localhost', 0, NULL, '::1'),
	(23739657292349479, '2014-11-07 16:49:27', 'root@localhost', 0, NULL, '::1'),
	(23739657292349480, '2014-11-09 06:27:05', 'root@localhost', 0, NULL, '::1'),
	(23739657292349481, '2014-11-09 06:27:05', 'root@localhost', 0, NULL, '::1'),
	(23739657292349482, '2014-11-09 06:35:13', 'root@localhost', 0, NULL, '::1');
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
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_column: ~92 rows (approximately)
/*!40000 ALTER TABLE `jset_column` DISABLE KEYS */;
REPLACE INTO `jset_column` (`id`, `parent`, `name`, `index`, `title`, `control`, `hidden`, `readonly`, `edithidden`, `noedit`, `unsortable`, `export`, `position`, `rowpos`, `rowlabel`, `default_value`, `search_default`, `width`, `usize`, `height`, `list`, `src`, `override`, `help`, `validation`, `aggregate`, `object`) VALUES
	(17, 3, 'source', NULL, 'Source', 'textarea', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '100', '8', 'v_source', NULL, NULL, 'The data source of this record.', NULL, NULL, NULL),
	(18, 3, 'target', NULL, 'Target', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'v_target', NULL, NULL, 'The data target of this record.', NULL, NULL, NULL),
	(26, 4, 'parent', NULL, 'Parent', 'intexact', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(35, 3, 'help', 'help_table', 'Help', 'editor', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Help about the jset_table grid as a whole. It is available by pressing the lamp button on the grid.', NULL, NULL, NULL),
	(36, 3, 'title', 'title_table', 'Title', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, 'The title of the grid using this record as it\'s source.', NULL, NULL, NULL),
	(37, 3, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 3, 'name', NULL, 'Name', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, 'The name of this jset_table record.', NULL, NULL, NULL),
	(70, 3, 'description', NULL, 'Description', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, 'Description of this record, free text.', NULL, NULL, NULL),
	(128, 13, 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(129, 13, 'parent', NULL, NULL, 'intexact', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(131, 13, 'help', NULL, 'Tip', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(138, 13, 'field', NULL, 'Field', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
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
	(217, 20, 'db_name', NULL, 'Database', NULL, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, 'jxset', NULL, '50', NULL, NULL, NULL, NULL, 'Database name.', NULL, NULL, NULL),
	(218, 3, 'system', NULL, 'System', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, '0', '30', NULL, NULL, NULL, NULL, NULL, 'If this is a system table, check it.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(275, 4, 'unsortable', NULL, 'Unsortable', 'checkbox', 0, 0, 0, 0, NULL, 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Check this field if you wish this column to not be sortable.', NULL, NULL, 'searchoptions:{\r\n	sopt: [\'eq\']\r\n}'),
	(278, 4, 'object', NULL, 'Object', 'textarea', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, NULL, '120', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(279, 3, 'validation', NULL, 'Validation', 'textarea', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '100', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(280, 28, 'id', NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(281, 28, 'category', NULL, 'קטגוריה', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, '1', NULL, '40', NULL, NULL, 'select tid as id, name from jset_list where `type` = \'category\' order by id', NULL, NULL, 'קטגורית המשימה', 'required:true', NULL, NULL),
	(282, 28, 'name', NULL, 'סעיף', NULL, 0, 0, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, '25', '3', NULL, NULL, NULL, NULL, 'סעיף, מספור המשימה. \nמאפשר לנו לקרוא למשימה בשם פשוט ויחודי', 'required:true', NULL, NULL),
	(283, 28, 'description', NULL, 'תאור', 'editor', 0, 0, 0, 0, 0, 1, NULL, 105, 'תאור', NULL, NULL, '200', '80', '8', NULL, NULL, NULL, 'תאור ואיפיון המשימה.', NULL, NULL, 'formoptions:{\n	label_hide: true\n}\n'),
	(284, 28, 'estimated_hours', NULL, 'תמחור', NULL, 0, 0, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, '25', '3', NULL, NULL, NULL, NULL, 'הצעת מחיר בשעות, ימולא על ידי המפתח לאחר שהמשימה אופיינה.', NULL, 'sum(estimated_hours)', NULL),
	(285, 28, 'approved', NULL, 'מאושר?', 'checkbox', 1, 0, 0, 0, 0, 1, NULL, 127, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 'הצעת המחיר מאושרת.\nהשדה יסומן לציין שהצעת המחיר מאושרת ואפשר להתחיל את תהליך הפיתוח', NULL, NULL, 'searchoptions:{\n	sopt: [\'eq\']\n}'),
	(286, 28, 'approved_date', NULL, 'תאריך אישור', NULL, 1, 0, 0, 0, 0, 1, NULL, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(287, 28, 'due_date', NULL, 'תאריך משוער', 'custom_date', 0, 0, 0, 0, 0, 1, NULL, 126, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, NULL, 'תאריך משוער לביצוע המשימה.\nימולא על ידי המפתח לאחר שהמשימה אושרה', NULL, NULL, NULL),
	(288, 28, 'delivery_date', NULL, 'תאריך ביצוע', 'custom_date', 0, 0, 0, 0, 0, 1, NULL, 126, NULL, NULL, NULL, '40', NULL, NULL, NULL, NULL, NULL, 'התאריך בו בוצעה המשימה והועלתה אל שרת הפיתוח', NULL, NULL, NULL),
	(289, 28, 'invoice_number', NULL, 'חשבונית', NULL, 0, 0, 0, 0, 0, 1, NULL, 126, NULL, NULL, NULL, '30', '3', NULL, NULL, NULL, NULL, 'ימולא על ידי המפתח לציין באיזו חשבונית חוייבה העבודה על המשימה', NULL, NULL, NULL),
	(290, 28, 'status_last', NULL, 'סטטוס', 'selectbox', 0, 1, 0, 0, 0, 1, NULL, 100, NULL, '1', NULL, '40', NULL, NULL, 'select tid as id, name from jset_list where `type` = \'status\' order by id', NULL, NULL, 'סטטוסי המשימה:\nאופיין - המשימה אופיינה וממתינה להצעת מחיר\nהצעת מחיר - המפתח נתן  הצעת מחיר וממתין לאישור\nטופל - המשימה שאושרה פותחה וממתינה לבדיקה בשרת הפיתוח\nנבדק - המשימה נבדקה בהצלחה וממתינה להתקנה בשרת העבודה\nטיפול חוזר - המשימה נבדקה ואינה עובדת כהלכה\nבוצע - המשימה הועלתה אל שרת העבודה', 'required:true', NULL, NULL),
	(292, 28, 'comments', NULL, 'הערות', 'editor', 0, 0, 0, 0, 0, 1, NULL, 122, 'הערות', NULL, NULL, '180', '80', '8', NULL, NULL, NULL, 'הערות על המשימה.\nבכל שלב אפשר להוסיף כאן הערות', NULL, NULL, 'formoptions:{\n	label_hide: true\n}\n'),
	(296, 28, 'picture', NULL, 'מסמך', 'upload_file', 1, 0, 0, 0, 0, 1, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'צרף תמונה', NULL, NULL, NULL),
	(299, 28, 'created_on', NULL, 'זמן יצירה', 'timestamp', 0, 1, 0, 0, 0, 1, NULL, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'הזמן בו נוצרה המשימה', NULL, NULL, NULL),
	(302, 28, 'priority', NULL, 'עדיפות', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, '1', NULL, '40', NULL, NULL, 'select tid as id, name from jset_list where `type` = \'priority\' order by id', NULL, NULL, NULL, NULL, NULL, NULL),
	(303, 28, 'actual_hours', NULL, 'חיוב', NULL, 1, 0, 1, 0, 0, 0, NULL, 126, NULL, NULL, NULL, '20', '3', NULL, NULL, NULL, NULL, 'חיוב בפועל עבור המשימה', NULL, NULL, NULL),
	(304, 28, 'charged_hours', NULL, 'חיוב', NULL, 0, 0, 0, 1, 0, 1, NULL, 125, NULL, NULL, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sum(charged_hours)', NULL),
	(305, 28, 'project', NULL, 'פרוייקט', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 100, NULL, '1', NULL, NULL, NULL, NULL, 'select tid as id, name from jset_list where `type` = \'project\' order by name', NULL, NULL, NULL, 'required:true', NULL, NULL),
	(306, 28, 'documents', NULL, 'מסמכים', 'jsetgrid', 1, 0, 1, 0, 0, 0, NULL, 110, 'מסמכים', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'settings:{\n	source: \'document\',\n	item_name:\'מסמך\',\n	load_edit_record: false,\n	search_default:[],\n	filter:[{\n		source: \'id\',\n		target: \'parent\'\n	}],\n	persist:false,\n	template: {\n		use: true,\n		columns: 1\n	},\n        grid: {\n        	width:380,\n                height:70,\n	        sortname: \'date\',\n	        sortorder: \'desc\'\n          },\n         navigation:{\n		options : {\n			del: user_attributes.group == 1,\n			search: false,\n			view: false\n		},\n		edit:{\n			checkOnUpdate:true\n		},\n		add:{\n			checkOnUpdate:true\n		}\n         }\n}\n'),
	(307, 28, 'actions', NULL, 'פעולות', 'jsetgrid', 1, 0, 1, 0, 0, 0, NULL, 124, 'פעולות', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'settings:{\n	source: \'action\',\n	item_name:\'פעולה\',\n	load_edit_record: false,\n	search_default:[],\n	filter:[{\n		source: \'id\',\n		target: \'parent\'\n	}],\n	persist:false,\n	template: {\n		use: true,\n		columns: 1\n	},\n        grid: {\n        	width:380,\n                height:70,\n	        sortname: \'creation_date\',\n	        sortorder: \'desc\'\n          },\n	onInitializeForm: function(formid){\n		$(formid).closest(\'.ui-jqdialog\').offset({ top: -140, left: 200});\n		$.jset.fn.append_fields(formid, \'creation_date\', 2);\n		$.jset.fn.append_fields(formid, \'date\', 1);\n	},\n         navigation:{\n		options : {\n			del: user_attributes.group == 1,\n			search: false,\n			view: false\n		},\n		edit:{\n			checkOnUpdate:true\n		},\n		add:{\n			checkOnUpdate:true\n		}\n         }\n}\n'),
	(309, 35, 'date', 'document_date', 'תאריך', 'custom_date', 0, 0, 0, 0, 0, 1, NULL, 10, NULL, 'fx: db_utils::current_date()', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(310, 35, 'description', NULL, 'תאור', 'textarea', 0, 0, 0, 0, 0, 1, NULL, 10, 'מסמך', NULL, NULL, NULL, '30', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(311, 35, 'expiry_date', 'document_expiry_date', 'תפוגה', 'custom_date', 1, 0, 0, 0, 0, 1, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(312, 35, 'file', NULL, 'מסמך', 'upload_file', 0, 0, 0, 0, 0, 1, NULL, 10, NULL, NULL, NULL, NULL, '7', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(313, 35, 'id', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(314, 35, 'parent', NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\n	sopt:[\'eq\']\n}'),
	(315, 35, 'table', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 10, NULL, 'patient', 'patient', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\n	sopt:[\'eq\']\n}'),
	(316, 35, 'type', NULL, 'סוג', 'text', 1, 0, 0, 0, 0, 1, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'select * from (select tid as id, name from jset_list where `type` = \'document_type\' order by name) b', NULL, NULL, NULL, NULL, NULL, NULL),
	(324, 36, 'creation_date', NULL, 'נוצר', 'datetime', 0, 1, 0, 0, 0, 1, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(325, 36, 'creator', NULL, 'יוצר', 'selectbox', 0, 1, 0, 0, 0, 1, NULL, 10, NULL, 'fx: jset_permission::get_user_id()', NULL, '60', NULL, NULL, 'select id, login as name from worker order by name', NULL, NULL, NULL, NULL, NULL, NULL),
	(327, 36, 'id', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(329, 36, 'modify_date', NULL, 'עודכן', 'datetime', 1, 1, 0, 0, 0, 1, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'db_utils::current_datetime()', NULL, NULL, NULL, NULL),
	(330, 36, 'parent', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'searchoptions:{\n	sopt:[\'eq\']\n}'),
	(332, 36, 'description', 'description_action', 'תאור', 'textarea', 0, 0, 0, 0, 0, 1, NULL, 25, 'תאור', NULL, NULL, NULL, '80', '4', NULL, NULL, NULL, NULL, NULL, NULL, 'formoptions:{\n	label_hide: true\n}\n'),
	(333, 36, 'date', 'date_action', 'תאריך', 'custom_date', 1, 0, 0, 0, 0, 0, NULL, 15, NULL, 'fx: db_utils::current_date()', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(339, 36, 'status', NULL, 'סטטוס', 'selectbox', 0, 0, 0, 0, 0, 1, NULL, 20, NULL, NULL, NULL, '60', NULL, NULL, 'select tid as id, name from jset_list where `type` = \'status\' order by id', NULL, NULL, NULL, NULL, NULL, NULL),
	(340, 28, 'action_id', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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

-- Dumping data for table mission.jset_error: ~38 rows (approximately)
/*!40000 ALTER TABLE `jset_error` DISABLE KEYS */;
REPLACE INTO `jset_error` (`id`, `message`, `query`, `params`) VALUES
	(23644302273937448, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23644302273937449, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349440, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349441, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349442, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349443, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349444, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349445, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349446, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349447, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349448, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349449, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349451, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349452, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349454, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349455, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349456, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349457, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349458, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349459, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349460, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349461, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349462, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349463, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349464, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349465, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349467, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'2\' for key \'PRIMARY\'', 'INSERT INTO jset_log_mission_ SELECT ?, mission.* FROM mission where mission.id = ?', '[0] => 23739657292349466\n    [1] => 2'),
	(23739657292349469, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'2\' for key \'PRIMARY\'', 'INSERT INTO jset_log_mission_ SELECT ?, mission.* FROM mission where mission.id = ?', '[0] => 23739657292349468\n    [1] => 2'),
	(23739657292349471, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1\' for key \'PRIMARY\'', 'INSERT INTO jset_log_mission_ SELECT ?, mission.* FROM mission where mission.id = ?', '[0] => 23739657292349470\n    [1] => 1'),
	(23739657292349472, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349473, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349474, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349475, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349476, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349477, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', ''),
	(23739657292349479, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'2\' for key \'PRIMARY\'', 'INSERT INTO jset_log_mission_ SELECT ?, mission.* FROM mission where mission.id = ?', '[0] => 23739657292349478\n    [1] => 2'),
	(23739657292349480, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_source\' doesn\'t exist', 'SELECT * FROM v_source', ''),
	(23739657292349481, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'mission.v_target\' doesn\'t exist', 'SELECT * FROM v_target', '');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table mission.jset_event: ~3 rows (approximately)
/*!40000 ALTER TABLE `jset_event` DISABLE KEYS */;
REPLACE INTO `jset_event` (`id`, `parent`, `before_insert`, `after_insert`, `before_select`, `after_select`, `before_update`, `after_update`, `before_delete`, `after_delete`) VALUES
	(2, 3, NULL, 'jset_columns_mysql::create_columns(id,source)~jset_event::create_event(id)', NULL, NULL, NULL, 'jset_columns_mysql::create_columns(id,source)~jset_event::create_event(id)', NULL, NULL),
	(57, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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


-- Dumping structure for table mission.jset_lang
DROP TABLE IF EXISTS `jset_lang`;
CREATE TABLE IF NOT EXISTS `jset_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `lang` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_lang: ~4 rows (approximately)
/*!40000 ALTER TABLE `jset_lang` DISABLE KEYS */;
REPLACE INTO `jset_lang` (`id`, `name`, `lang`) VALUES
	(1, 'login', 'en'),
	(2, 'login', 'he'),
	(3, 'password', 'en'),
	(4, 'password', 'he');
/*!40000 ALTER TABLE `jset_lang` ENABLE KEYS */;


-- Dumping structure for table mission.jset_lang_item
DROP TABLE IF EXISTS `jset_lang_item`;
CREATE TABLE IF NOT EXISTS `jset_lang_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_lang_item: ~30 rows (approximately)
/*!40000 ALTER TABLE `jset_lang_item` DISABLE KEYS */;
REPLACE INTO `jset_lang_item` (`id`, `parent`, `name`, `value`) VALUES
	(1, 1, 'title', 'Login'),
	(2, 1, 'user', 'User'),
	(3, 1, 'password', 'Password'),
	(4, 1, 'submit', 'Login'),
	(5, 2, 'title', 'משימות - התחברות'),
	(6, 2, 'user', 'שם'),
	(7, 2, 'password', 'סיסמה'),
	(8, 2, 'submit', 'התחבר'),
	(9, 1, 'not_valid', 'Not Valid'),
	(10, 2, 'not_valid', 'משתמש או סיסמה שגויים'),
	(11, 3, 'title', 'Change Password'),
	(12, 3, 'current_password', 'Current Password'),
	(13, 3, 'new_password', 'New Password'),
	(14, 3, 'submit', 'Change Password'),
	(15, 4, 'title', 'שינוי סיסמה'),
	(16, 4, 'current_password', 'סיסמה נוכחית'),
	(17, 4, 'new_password', 'סיסמה חדשה'),
	(18, 4, 'submit', 'שינוי סיסמה'),
	(19, 3, 'retype_password', 'Retype Password'),
	(20, 4, 'retype_password', 'הקלד סיסמה חדשה שוב'),
	(21, 4, 'valid', 'סיסמה הוחלפה בהצלחה'),
	(22, 3, 'not_valid', 'Current password not valid - Password was not changed'),
	(23, 3, 'valid', 'Password changed successfuly'),
	(24, 4, 'not_valid', 'סיסמה נוכתית שגוייה - סיסמה לא הוחלפה'),
	(25, 3, 'logout', 'Logout'),
	(26, 3, 'hi', 'Hi'),
	(27, 4, 'logout', 'צא'),
	(28, 4, 'hi', 'שלום'),
	(29, 3, 'back', 'Back'),
	(30, 4, 'back', 'חזור');
/*!40000 ALTER TABLE `jset_lang_item` ENABLE KEYS */;


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
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_list: ~19 rows (approximately)
/*!40000 ALTER TABLE `jset_list` DISABLE KEYS */;
REPLACE INTO `jset_list` (`id`, `tid`, `name`, `type`) VALUES
	(1, 1, 'waterproof', 'project'),
	(2, 2, '2', 'priority'),
	(3, 3, '3', 'priority'),
	(4, 4, '4', 'priority'),
	(5, 5, '5', 'priority'),
	(6, 1, '1', 'priority'),
	(9, 1, 'פיתוח', 'category'),
	(10, 2, 'באג', 'category'),
	(11, 3, 'תחזוקה', 'category'),
	(12, 4, 'ייעוץ', 'category'),
	(13, 5, 'אחר', 'category'),
	(16, 1, 'אופיין', 'status'),
	(17, 2, 'הצעת מחיר', 'status'),
	(18, 3, 'בטיפול', 'status'),
	(19, 5, 'נבדק', 'status'),
	(20, 6, 'טיפול חוזר', 'status'),
	(21, 7, 'בוצע', 'status'),
	(22, 8, 'לא הושלם', 'status'),
	(23, 4, 'טופל', 'status');
/*!40000 ALTER TABLE `jset_list` ENABLE KEYS */;


-- Dumping structure for table mission.jset_login
DROP TABLE IF EXISTS `jset_login`;
CREATE TABLE IF NOT EXISTS `jset_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `password` varbinary(150) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table mission.jset_login: ~10 rows (approximately)
/*!40000 ALTER TABLE `jset_login` DISABLE KEYS */;
REPLACE INTO `jset_login` (`id`, `stamp`, `ip`, `user`, `password`, `success`) VALUES
	(1, '2014-09-13 10:34:57', '::1', 'user', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 1),
	(2, '2014-11-03 08:36:45', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(3, '2014-11-03 08:36:57', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(4, '2014-11-03 08:37:12', '::1', 'shuki', _binary 0x88191A971995A4D3C2B042A4423C3C8A, 0),
	(5, '2014-11-03 08:37:53', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(6, '2014-11-03 08:40:54', '::1', 'user', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 1),
	(7, '2014-11-07 16:17:29', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(8, '2014-11-07 16:17:42', '::1', 'user', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 1),
	(9, '2014-11-09 06:27:51', '::1', 'user', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 1),
	(10, '2014-11-10 08:47:48', '::1', 'user', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 1),
	(11, '2014-11-10 08:58:53', '::1', 'shuki', _binary 0x88191A971995A4D3C2B042A4423C3C8A, 0),
	(12, '2014-11-10 08:59:02', '::1', 'user', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(13, '2014-11-10 08:59:17', '::1', 'shlomit', _binary 0x3927FB2BAF21874F7AB855B58EE6E77C, 1),
	(14, '2014-11-10 09:02:59', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(15, '2014-11-10 09:03:05', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(16, '2014-11-10 09:03:20', '::1', 'shuki', _binary 0x84563AA7421ADA432A88E0DDE543EA49, 0),
	(17, '2014-11-10 09:04:19', '::1', 'shuki', _binary 0x3927FB2BAF21874F7AB855B58EE6E77C, 0),
	(18, '2014-11-10 09:05:42', '::1', 'shuki', _binary 0x3927FB2BAF21874F7AB855B58EE6E77C, 1),
	(19, '2014-11-10 09:06:11', '::1', 'shuki', _binary 0x3927FB2BAF21874F7AB855B58EE6E77C, 1),
	(20, '2014-11-10 09:06:23', '::1', 'shuki', _binary 0x88191A971995A4D3C2B042A4423C3C8A, 1);
/*!40000 ALTER TABLE `jset_login` ENABLE KEYS */;


-- Dumping structure for table mission.jset_log_mission_
DROP TABLE IF EXISTS `jset_log_mission_`;
CREATE TABLE IF NOT EXISTS `jset_log_mission_` (
  `uuid` bigint(20) NOT NULL,
  `id` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(100) DEFAULT NULL,
  `category` smallint(7) DEFAULT NULL,
  `project` smallint(7) DEFAULT NULL,
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

-- Dumping data for table mission.jset_log_mission_: ~1 rows (approximately)
/*!40000 ALTER TABLE `jset_log_mission_` DISABLE KEYS */;
REPLACE INTO `jset_log_mission_` (`uuid`, `id`, `created_on`, `name`, `category`, `project`, `description`, `estimated_hours`, `actual_hours`, `approved`, `approved_date`, `due_date`, `delivery_date`, `status`, `comments`, `invoice_number`, `picture`, `priority`) VALUES
	(23739657292349482, 1, '2014-09-08 16:54:59', '1', 1, 1, '<ol>\n<li>היי שלומית, ברוכה הבאה אל מערכת המשימות החדשה שלנו.</li>\n</ol>\n<p>אני מאחל לנו עבודה משותפת רבה יחד.</p>\n<p>להלן המשימה הראשונה:</p>\n<ul>\n<li>עדכני את הגירסה של jxset דרך Aptana.</li>\n<li>עדכני את הגירסה של waterproof דרך Aptana.</li>\n<li>הריצי את הקוד הזה על מאגר הנתונים waterproof:</li>\n</ul>\n<pre dir="ltr"><span class="sql1-reservedword">CREATE</span><span class="sql1-reservedword">TABLE</span><span class="sql1-delimitedidentifier">`reading_register`</span><span class="sql1-symbol">(\n</span><span class="sql1-delimitedidentifier">`id`</span><span class="sql1-datatype">INT</span><span class="sql1-symbol">(</span><span class="sql1-number">10</span><span class="sql1-symbol">)</span><span class="sql1-datatype">UNSIGNED</span><span class="sql1-reservedword">NOT</span><span class="sql1-reservedword">NULL</span><span class="sql1-reservedword">AUTO_INCREMENT</span><span class="sql1-symbol">,\n</span><span class="sql1-delimitedidentifier">`date`</span><span class="sql1-datatype">DATE</span><span class="sql1-reservedword">NULL</span><span class="sql1-reservedword">DEFAULT</span><span class="sql1-reservedword">NULL</span><span class="sql1-symbol">,\n</span><span class="sql1-delimitedidentifier">`reader`</span><span class="sql1-datatype">varchar</span><span class="sql1-symbol">(</span><span class="sql1-number">100</span><span class="sql1-symbol">),\n</span><span class="sql1-reservedword">PRIMARY</span><span class="sql1-reservedword">KEY</span><span class="sql1-symbol">(</span><span class="sql1-delimitedidentifier">`id`</span><span class="sql1-symbol">)\n)\n</span><span class="sql1-reservedword">COLLATE</span><span class="sql1-symbol">=</span><span class="sql1-string">\'utf8_bin\'\n</span><span class="sql1-reservedword">ENGINE</span><span class="sql1-symbol">=</span><span class="sql1-datatype">InnoDB</span><span class="sql1-symbol">;<br /></span></pre>\n<ul>\n<li>סדרי את הטבלה בלשונית \'קריאות\'.</li>\n<li>ייצאי את כל מאגר הנתונים ושלחי אותו אלי במייל.</li>\n</ul>\n<p>תודה!</p>\n<p>&nbsp;</p>', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1);
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
  `section` smallint(6) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `source` varchar(8000) DEFAULT NULL,
  `target` varchar(100) DEFAULT NULL,
  `help` text,
  `validation` varchar(8000) DEFAULT NULL,
  `system` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_table: ~8 rows (approximately)
/*!40000 ALTER TABLE `jset_table` DISABLE KEYS */;
REPLACE INTO `jset_table` (`id`, `name`, `section`, `description`, `title`, `source`, `target`, `help`, `validation`, `system`) VALUES
	(3, 'jset_table', NULL, 'Manage grid definition', 'Tables', 'jset_table', 'jset_table', '<div>This grid let you define data objects to be used by grids in an application.</div>', NULL, 1),
	(4, 'jset_column', NULL, NULL, 'Columns', 'jset_column', 'jset_column', 'This grid let you define attributes for each field in a grid. Help on each attribute\'s meaning is available in edit and view modes by moving the mouse over an attribute name.', NULL, 1),
	(13, 'jset_help', NULL, NULL, 'Help Tips', 'v_jset_help', 'jset_column', NULL, NULL, 1),
	(19, 'jset_event', NULL, NULL, 'Events', 'jset_event', 'jset_event', 'This grid let you define events for a grid.<br />An event is a php method that can be set to run on the following situations:<br /><br />before insert<br />after insert<br />before select<br />after select<br />before update<br />after update<br />before delete<br />after delete<br /><br />', NULL, 1),
	(20, 'jset_host', NULL, NULL, 'Hosts', 'jset_host', 'jset_host', 'This grid let you define credentials for accessing projects.', NULL, 1),
	(28, 'mission', NULL, NULL, 'משימות לביצוע', 'v_mission', 'mission', NULL, NULL, 0),
	(35, 'document', NULL, NULL, NULL, 'document', 'document', NULL, NULL, 0),
	(36, 'action', NULL, NULL, NULL, 'action', 'action', NULL, NULL, 0);
/*!40000 ALTER TABLE `jset_table` ENABLE KEYS */;


-- Dumping structure for table mission.jset_upload
DROP TABLE IF EXISTS `jset_upload`;
CREATE TABLE IF NOT EXISTS `jset_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `upload_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_name` (`upload_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.jset_upload: ~1 rows (approximately)
/*!40000 ALTER TABLE `jset_upload` DISABLE KEYS */;
REPLACE INTO `jset_upload` (`id`, `created_at`, `name`, `upload_name`) VALUES
	(1, '2014-11-03 11:36:07', 'export.jpg', 'd985495e-633c-11e4-9886-60eb695d014e');
/*!40000 ALTER TABLE `jset_upload` ENABLE KEYS */;


-- Dumping structure for table mission.mission
DROP TABLE IF EXISTS `mission`;
CREATE TABLE IF NOT EXISTS `mission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(100) DEFAULT NULL,
  `category` smallint(7) DEFAULT NULL,
  `project` smallint(7) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.mission: ~1 rows (approximately)
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
REPLACE INTO `mission` (`id`, `created_on`, `name`, `category`, `project`, `description`, `estimated_hours`, `actual_hours`, `approved`, `approved_date`, `due_date`, `delivery_date`, `status`, `comments`, `invoice_number`, `picture`, `priority`) VALUES
	(1, '2014-09-08 16:54:59', '1', 1, 1, '<ol>\n<li>היי שלומית, ברוכה הבאה אל מערכת המשימות החדשה שלנו.</li>\n</ol>\n<p>אני מאחל לנו עבודה משותפת רבה יחד.</p>\n<p>להלן המשימה הראשונה:</p>\n<ul>\n<li>עדכני את הגירסה של jxset דרך Aptana.</li>\n<li>עדכני את הגירסה של waterproof דרך Aptana.</li>\n<li>הריצי את הקוד הזה על מאגר הנתונים waterproof:</li>\n</ul>\n<pre dir="ltr"><span class="sql1-reservedword">CREATE</span><span class="sql1-reservedword">TABLE</span><span class="sql1-delimitedidentifier">`reading_register`</span><span class="sql1-symbol">(\n</span><span class="sql1-delimitedidentifier">`id`</span><span class="sql1-datatype">INT</span><span class="sql1-symbol">(</span><span class="sql1-number">10</span><span class="sql1-symbol">)</span><span class="sql1-datatype">UNSIGNED</span><span class="sql1-reservedword">NOT</span><span class="sql1-reservedword">NULL</span><span class="sql1-reservedword">AUTO_INCREMENT</span><span class="sql1-symbol">,\n</span><span class="sql1-delimitedidentifier">`date`</span><span class="sql1-datatype">DATE</span><span class="sql1-reservedword">NULL</span><span class="sql1-reservedword">DEFAULT</span><span class="sql1-reservedword">NULL</span><span class="sql1-symbol">,\n</span><span class="sql1-delimitedidentifier">`reader`</span><span class="sql1-datatype">varchar</span><span class="sql1-symbol">(</span><span class="sql1-number">100</span><span class="sql1-symbol">),\n</span><span class="sql1-reservedword">PRIMARY</span><span class="sql1-reservedword">KEY</span><span class="sql1-symbol">(</span><span class="sql1-delimitedidentifier">`id`</span><span class="sql1-symbol">)\n)\n</span><span class="sql1-reservedword">COLLATE</span><span class="sql1-symbol">=</span><span class="sql1-string">\'utf8_bin\'\n</span><span class="sql1-reservedword">ENGINE</span><span class="sql1-symbol">=</span><span class="sql1-datatype">InnoDB</span><span class="sql1-symbol">;<br /></span></pre>\n<ul>\n<li>סדרי את הטבלה בלשונית \'קריאות\'.</li>\n<li>ייצאי את כל מאגר הנתונים ושלחי אותו אלי במייל.</li>\n</ul>\n<p>תודה!</p>\n<p>&nbsp;</p>', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;


-- Dumping structure for view mission.v_mission
DROP VIEW IF EXISTS `v_mission`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_mission` (
	`id` INT(10) NOT NULL,
	`action_id` INT(11) NULL,
	`created_on` TIMESTAMP NOT NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`project` SMALLINT(7) NULL,
	`category` SMALLINT(7) NULL,
	`description` TEXT NULL COLLATE 'utf8_general_ci',
	`estimated_hours` DECIMAL(10,2) NULL,
	`charged_hours` DECIMAL(10,2) NULL,
	`approved` TINYINT(4) NULL,
	`approved_date` DATE NULL,
	`due_date` DATE NULL,
	`delivery_date` DATE NULL,
	`actual_hours` DECIMAL(10,2) NULL,
	`status_last` BIGINT(11) NULL,
	`comments` TEXT NULL COLLATE 'utf8_general_ci',
	`invoice_number` MEDIUMINT(9) NULL,
	`picture` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`priority` SMALLINT(6) NULL,
	`documents` INT(10) NOT NULL,
	`actions` INT(10) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view mission.v_mission_base
DROP VIEW IF EXISTS `v_mission_base`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_mission_base` (
	`id` INT(10) NOT NULL,
	`action_id` INT(11) NULL,
	`created_on` TIMESTAMP NOT NULL,
	`name` VARCHAR(100) NULL COLLATE 'utf8_general_ci',
	`project` SMALLINT(7) NULL,
	`category` SMALLINT(7) NULL,
	`description` TEXT NULL COLLATE 'utf8_general_ci',
	`estimated_hours` DECIMAL(10,2) NULL,
	`charged_hours` DECIMAL(10,2) NULL,
	`approved` TINYINT(4) NULL,
	`approved_date` DATE NULL,
	`due_date` DATE NULL,
	`delivery_date` DATE NULL,
	`actual_hours` DECIMAL(10,2) NULL,
	`status_last` BIGINT(11) NULL,
	`comments` TEXT NULL COLLATE 'utf8_general_ci',
	`invoice_number` MEDIUMINT(9) NULL,
	`picture` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`priority` SMALLINT(6) NULL,
	`documents` INT(10) NOT NULL,
	`actions` INT(10) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for table mission.worker
DROP TABLE IF EXISTS `worker`;
CREATE TABLE IF NOT EXISTS `worker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `worker_number` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `surename` varchar(100) DEFAULT NULL,
  `gender` tinyint(1) unsigned DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `marital_status` tinyint(1) unsigned DEFAULT NULL,
  `id_number` varchar(12) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `dormitory` int(10) unsigned DEFAULT NULL,
  `house` int(11) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varbinary(150) DEFAULT NULL,
  `group` smallint(6) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `pension_fund` tinyint(3) unsigned DEFAULT NULL,
  `bank` tinyint(3) unsigned DEFAULT NULL,
  `bank_branch` smallint(5) unsigned DEFAULT NULL,
  `bank_account` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 2` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table mission.worker: 1 rows
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
REPLACE INTO `worker` (`id`, `worker_number`, `first_name`, `surename`, `gender`, `birth_date`, `marital_status`, `id_number`, `start_date`, `end_date`, `mobile`, `phone`, `email`, `address`, `dormitory`, `house`, `position`, `login`, `password`, `group`, `picture`, `pension_fund`, `bank`, `bank_branch`, `bank_account`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'shuki', _binary 0x88191A971995A4D3C2B042A4423C3C8A, 1, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'shlomit', _binary 0x3927FB2BAF21874F7AB855B58EE6E77C, 1, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;


-- Dumping structure for view mission.v_mission
DROP VIEW IF EXISTS `v_mission`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_mission`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_mission` AS select * from v_mission_base
group by id ;


-- Dumping structure for view mission.v_mission_base
DROP VIEW IF EXISTS `v_mission_base`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_mission_base`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_mission_base` AS select 
	mission.`id`,
	`action`.id as action_id,
	`created_on`,
	`name`,
	`project`,
	`category`,
	mission.`description`,
	`estimated_hours`,
	if(`action`.`status` > 3 , if(actual_hours is not null, actual_hours, estimated_hours), null) as charged_hours,
	`approved`,
	`approved_date`,
	`due_date`,
	`delivery_date`,
	`actual_hours`,
--	SUBSTRING_INDEX(group_concat( `action`.`status` order by `action`.creation_date desc), ',', 1) as statusa,
	COALESCE(`action`.`status`, 1) as `status_last`,
	`comments`,
	`invoice_number`,
	`picture`,
	`priority`,
	mission.id as `documents`,
	mission.id as `actions`
	from mission 
	left join `action` on mission.id = `action`.parent 
	group by `action`.id
	order by `action`.id desc ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
