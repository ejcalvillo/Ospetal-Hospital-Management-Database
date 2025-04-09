DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `birthdate` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `patients` (`name`,`address`,`birthdate`)
VALUES
  ("Vernon Duke","162-4761 Enim St.","Apr 3, 2015"),
  ("Jolene Wright","Ap #136-8049 Dapibus Rd.","Dec 10, 2017"),
  ("Nero Wilson","388 Elit, Ave","Jul 12, 1992"),
  ("Oren Sanders","260-2516 Felis Street","Feb 10, 2018"),
  ("Preston Bryan","Ap #684-7431 Justo Avenue","Oct 19, 1986"),
  ("Ashton Leon","477-5484 Arcu. Road","Apr 24, 2014"),
  ("Kirby Curry","275-7876 Integer Rd.","Oct 17, 1986"),
  ("Tamekah Mcpherson","752-3353 Donec Ave","Sep 16, 2016"),
  ("Boris Newman","5531 A St.","Nov 25, 1978"),
  ("Rana Hendrix","Ap #971-8269 Donec Road","Apr 27, 2014"),
  ("Galena Wheeler","Ap #714-4019 Felis Street","Apr 18, 2004"),
  ("Simon Marquez","P.O. Box 522, 1913 Magnis Street","Jun 29, 1981"),
  ("Hakeem Nunez","Ap #786-4820 Nunc, Rd.","Jul 19, 2018"),
  ("Oliver Harding","709-6218 Nam Avenue","Sep 22, 2007"),
  ("Alexandra Randolph","616 Suspendisse Rd.","Jun 24, 1979"),
  ("Indigo Lara","981-3684 Purus Av.","Sep 14, 2015"),
  ("Kay Cash","P.O. Box 441, 4472 Dignissim. Rd.","Mar 31, 2023"),
  ("Deborah Rowland","Ap #621-2794 Sed Street","Jul 6, 2022"),
  ("Beverly Head","Ap #980-1756 Diam St.","Nov 13, 1977"),
  ("Macon Watson","Ap #776-2327 Sit Avenue","Oct 29, 2021");
INSERT INTO `patients` (`name`,`address`,`birthdate`)
VALUES
  ("Megan Cotton","Ap #866-6688 Non Rd.","Mar 11, 1982"),
  ("Blaze Buck","2814 Duis Street","May 17, 1982"),
  ("Oscar Haney","Ap #175-4185 Nascetur Street","Mar 2, 2009"),
  ("Yasir Riley","946-9459 Sodales Avenue","Nov 23, 2018"),
  ("Yvette Cruz","845-262 Dictum Av.","May 21, 2016");
