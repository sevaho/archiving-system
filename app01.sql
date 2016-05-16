-- Initialise database for the DbDemo application
CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(50) DEFAULT 'USA',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
