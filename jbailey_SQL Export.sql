-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2021 at 10:16 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectmanagementdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `BusinessName` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ContactID` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `Title` varchar(7) COLLATE utf8mb4_bin NOT NULL,
  `FirstName` varchar(24) COLLATE utf8mb4_bin NOT NULL,
  `LastName` varchar(24) COLLATE utf8mb4_bin NOT NULL,
  `Notes` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `Phone` bigint(11) NOT NULL,
  `Email` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `NumAndStreet` varchar(56) COLLATE utf8mb4_bin NOT NULL,
  `City` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `Postcode` varchar(7) COLLATE utf8mb4_bin NOT NULL,
  `Addedby` varchar(32) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`BusinessName`, `ContactID`, `Title`, `FirstName`, `LastName`, `Notes`, `Phone`, `Email`, `NumAndStreet`, `City`, `Postcode`, `Addedby`) VALUES
('Larus fuliginosus', '0081847548', 'Mr', 'Nuó', 'Gonzalo', 'Product Management', 8536830220, 'mgonzalo3h@forbes.com', '102 Acker Pass', 'Shahrak-e Bākharz', 'MS2 9EP', 'Administrator'),
('Ctenophorus ornatus', '0120772640', 'Mrs', 'Amélie', 'Heynel', 'Business Development', 9748498594, 'pheynel33@thetimes.co.uk', '836 Red Cloud Crossing', 'Muyi', 'NY1 4ZD', 'Administrator'),
('Gyps fulvus', '0161806261', 'Honorab', 'Eliès', 'Epelett', 'Support', 7063177258, 'mepelettu@gravatar.com', '3449 Morning Lane', 'Pingtang', 'TL4 1HJ', 'jbailey'),
('Bubo virginianus', '0209961508', 'Rev', 'Kù', 'Exelby', 'Research and Development', 1645052844, 'dexelby2g@google.ru', '51862 Butterfield Alley', 'Sanli', 'KG0 9NU', 'Administrator'),
('Columba livia', '0229836531', 'Dr', 'Dorothée', 'Jakubovicz', 'Research and Development', 9473140314, 'mjakubovicza@guardian.co.uk', '1 Declaration Hill', 'Shaba', 'TC0 2OL', 'Administrator'),
('Erethizon dorsatum', '0306435241', 'Honorab', 'Maï', 'Anstie', 'Legal', 5038911001, 'sanstiem@forbes.com', '9 Lawn Avenue', 'Jorochito', 'DC2 0QC', 'jbailey'),
('Uraeginthus angolensis', '0357680283', 'Mr', 'Yénora', 'Berrey', 'Sales', 3946818781, 'rberrey2@hp.com', '690 Carpenter Center', 'Cidadap', 'KG0 2BW', 'jbailey'),
('Semnopithecus entellus', '0451613760', 'Honorab', 'Eléa', 'Harbert', 'Legal', 4961854765, 'bharbert0@sciencedirect.com', '56 Westridge Place', 'Porsgrunn', 'FB3 4VR', 'Administrator'),
('Eolophus roseicapillus', '0482831187', 'Mr', 'Ráo', 'Draysey', 'Research and Development', 2261756776, 'sdraysey28@tinyurl.com', '8399 Kedzie Circle', 'Laval', 'DP8 6VT', 'Administrator'),
('Galago crassicaudataus', '0486495213', 'Dr', 'Lorène', 'Moreinu', 'Marketing', 6263669640, 'jmoreinu1k@cyberchimps.com', '899 Heffernan Road', 'Tamra', 'AH9 5BP', 'jbailey'),
('Francolinus swainsonii', '0492025152', 'Ms', 'Andrée', 'Curley', 'Sales', 4821667977, 'bcurley1k@biblegateway.com', '663 Pond Terrace', 'Şūrān', 'RO3 7DN', 'Administrator'),
('Otaria flavescens', '0565571883', 'Dr', 'Wá', 'MacIlhargy', 'Training', 4384315632, 'cmacilhargy24@ftc.gov', '3602 Tony Way', 'Jianxin', 'OK3 0IP', 'jbailey'),
('Physignathus cocincinus', '0591892547', 'Dr', 'Clémentine', 'Popeley', 'Marketing', 3793676342, 'cpopeley1b@constantcontact.com', '9 Hovde Trail', 'Bolhos', 'IX4 5OT', 'jbailey'),
('Sarcophilus harrisii', '0627289859', 'Mrs', 'Valérie', 'Raiston', 'Product Management', 6971769231, 'craiston1h@irs.gov', '65 Swallow Plaza', 'Krasnyye Chetai', 'FQ0 6OD', 'jbailey'),
('Grus rubicundus', '0688707844', 'Mrs', 'Pénélope', 'Wylie', 'Accounting', 6067091224, 'lwylie21@cpanel.net', '660 Tennyson Hill', 'Caimitillo', 'GU6 4GW', 'Administrator'),
('Platalea leucordia', '0726305388', 'Mr', 'Zhì', 'Birrell', 'Training', 7076219556, 'abirrell1e@booking.com', '719 Granby Park', 'Féres', 'IZ9 2XG', 'Administrator'),
('Agkistrodon piscivorus', '0814866003', 'Ms', 'Cunégonde', 'Laxston', 'Research and Development', 6432047668, 'elaxston15@freewebs.com', '40837 Meadow Ridge Road', 'Torres Novas', 'WX5 9VB', 'jbailey'),
('Lasiodora parahybana', '0855505221', 'Rev', 'Åsa', 'Greatland', 'Business Development', 9611240569, 'tgreatland25@imageshack.us', '22739 Loomis Plaza', 'Všetaty', 'MD6 7YS', 'Administrator'),
('Mazama americana', '0858408462', 'Mrs', 'Régine', 'Paridge', 'Legal', 8214959761, 'aparidge1c@4shared.com', '46480 Roth Junction', 'Hongmen', 'WO2 4LL', 'jbailey'),
('Boa constrictor mexicana', '0882168188', 'Honorab', 'Rébecca', 'Seago', 'Support', 4832376477, 'hseago1@imdb.com', '4 Dryden Place', 'Stari Banovci', 'LD3 5CS', 'jbailey'),
('Agkistrodon piscivorus', '0885044585', 'Rev', 'Aloïs', 'Adnams', 'Accounting', 3247676206, 'dadnams1q@gov.uk', '3 Goodland Lane', 'Yantianhe', 'OE3 6GJ', 'Administrator'),
('Tiliqua scincoides', '0888227249', 'Honorab', 'Maëlla', 'Jadczak', 'Services', 3037395006, 'ajadczako@hexun.com', '74280 Loftsgordon Drive', 'Vänersborg', 'SR5 1QN', 'Administrator'),
('Dusicyon thous', '0952016769', 'Mrs', 'Maïlys', 'Pritchard', 'Legal', 8017398967, 'rpritchard2h@dell.com', '5 Green Ridge Drive', 'Manticao', 'LD8 3SJ', 'Administrator'),
('Felis libyca', '0969857537', 'Ms', 'Kuí', 'Fochs', 'Services', 7986817572, 'sfochse@admin.ch', '63173 Golf View Drive', 'Izlake', 'KU2 6JP', 'Administrator'),
('Buteo galapagoensis', '0998947157', 'Rev', 'Björn', 'Davidovicz', 'Business Development', 3563105365, 'rdavidoviczm@github.io', '6 Loftsgordon Drive', 'Dengmu', 'HQ2 4OB', 'Administrator'),
('Butorides striatus', '1008141959', 'Honorab', 'Cloé', 'Sherred', 'Services', 8499816493, 'lsherred13@census.gov', '6201 Roth Street', 'Catujal', 'SQ0 1TE', 'Administrator'),
('Phalacrocorax varius', '1028829485', 'Honorab', 'Loïs', 'Caccavella', 'Business Development', 9157581419, 'ccaccavella32@businessweek.com', '2 Pleasure Court', 'Torez', 'VL3 3JW', 'Administrator'),
('Felis chaus', '1041108605', 'Mr', 'Léonie', 'Nequest', 'Business Development', 6549150275, 'snequest2x@europa.eu', '293 Corben Way', 'Baruunsuu', 'AV6 3GU', 'Administrator'),
('Corvus brachyrhynchos', '1058738519', 'Rev', 'Josée', 'Kaesmans', 'Legal', 6075018706, 'rkaesmansx@umich.edu', '953 Novick Avenue', 'Krasnyy Kholm', 'LX0 8EH', 'jbailey'),
('Raphicerus campestris', '1067477913', 'Ms', 'Nuó', 'Cotte', 'Sales', 1552122818, 'jcotten@time.com', '17601 Porter Pass', 'Ternopil’', 'PF6 5JQ', 'Administrator'),
('Ceratotherium simum', '1188577023', 'Ms', 'Ruì', 'Marron', 'Research and Development', 9074612169, 'amarron34@t-online.de', '414 Mesta Point', 'Bắc Kạn', 'JN6 6LO', 'Administrator'),
('Limosa haemastica', '1231393557', 'Mr', 'Bénédicte', 'Kears', 'Support', 5811250167, 'ckears2b@arstechnica.com', '9874 Valley Edge Hill', 'Sernur', 'DZ6 9VJ', 'Administrator'),
('Mellivora capensis', '1236480174', 'Dr', 'Åsa', 'McLleese', 'Research and Development', 1398193055, 'lmclleeseb@zdnet.com', '0 Village Road', 'Narutō', 'HD4 6TZ', 'jbailey'),
('Ciconia episcopus', '1238630522', 'Rev', 'Naéva', 'Charrett', 'Engineering', 5803245955, 'bcharrettp@amazon.co.jp', '24 Oxford Court', 'Balayong', 'LI9 2YK', 'jbailey'),
('Mungos mungo', '1257177709', 'Ms', 'Maëline', 'Beaford', 'Services', 4825407078, 'gbeafordq@netvibes.com', '33 Buell Trail', 'Zhaobei', 'LB5 6TS', 'jbailey'),
('Nucifraga columbiana', '1292777528', 'Rev', 'Lauréna', 'Lowrie', 'Legal', 7725243117, 'elowrie2r@xing.com', '3838 Stone Corner Alley', 'Lipu', 'UV3 4RY', 'Administrator'),
('Spermophilus tridecemlineatus', '1316147605', 'Mr', 'Andréa', 'Erat', 'Services', 3575322822, 'terat12@microsoft.com', '022 Division Street', 'Marcabal', 'NC2 1KN', 'jbailey'),
('Anas punctata', '1325474489', 'Rev', 'Léone', 'Labba', 'Business Development', 8386342523, 'slabba1j@guardian.co.uk', '90385 Del Mar Junction', 'Khelyulya', 'YN5 4JE', 'Administrator'),
('Ovis ammon', '1454969947', 'Mr', 'Anaël', 'Gledhill', 'Research and Development', 4223244373, 'lgledhill3d@nasa.gov', '9 Monument Plaza', 'Shiren', 'MR1 2FR', 'Administrator'),
('Ovibos moschatus', '1458819742', 'Mr', 'Mahélie', 'Sherston', 'Marketing', 7564272933, 'nsherston18@gmpg.org', '9782 Riverside Pass', 'Bořitov', 'TE3 2MJ', 'jbailey'),
('Sciurus vulgaris', '1535139802', 'Mrs', 'Zoé', 'Senyard', 'Engineering', 7718009806, 'rsenyard27@amazon.co.jp', '3 Talisman Street', 'Sukamaju', 'TN9 9RL', 'Administrator'),
('Iguana iguana', '1536570292', 'Mrs', 'Yáo', 'MacNeachtain', 'Product Management', 9703918374, 'lmacneachtaind@hostgator.com', '564 Kropf Place', 'Yekaterinovka', 'SQ2 6GE', 'jbailey'),
('Ateles paniscus', '1540370537', 'Mr', 'Pénélope', 'Cooke', 'Training', 5802367136, 'bcooke1i@gravatar.com', '08470 Loeprich Street', 'Lomma', 'LX2 8PX', 'Administrator'),
('Hyaena brunnea', '1554738742', 'Honorab', 'Mà', 'Signorelli', 'Product Management', 5636241697, 'ksignorelli20@xing.com', '0 Rowland Avenue', 'Savelugu', 'QY5 1SK', 'Administrator'),
('Chlamydosaurus kingii', '1577435658', 'Mr', 'Ruì', 'Leeds', 'Marketing', 1524219497, 'mleeds29@blogger.com', '944 Coolidge Terrace', 'Santo Domingo', 'WP3 6CL', 'Administrator'),
('Ovis ammon', '1600044885', 'Ms', 'Amélie', 'Spadotto', 'Research and Development', 3258412477, 'espadotto2a@freewebs.com', '92 Rutledge Park', 'Sonorejo', 'PG3 2WQ', 'jbailey'),
('Panthera tigris', '1628437816', 'Ms', 'Marie-hélène', 'Lindop', 'Human Resources', 7168562260, 'glindopw@adobe.com', '387 Lunder Avenue', 'Bodø', 'TG3 8UG', 'Administrator'),
('Butorides striatus', '1651299428', 'Mrs', 'Alizée', 'Heninghem', 'Engineering', 9876895164, 'pheninghem1r@redcross.org', '9 Longview Junction', 'Saue', 'FE9 7XU', 'Administrator'),
('Damaliscus dorcas', '1744778763', 'Mrs', 'Görel', 'Readwood', 'Business Development', 5018899473, 'mreadwoodk@webmd.com', '6693 Pearson Junction', 'Kramators’k', 'YE0 7EQ', 'jbailey'),
('Varanus salvator', '1805708811', 'Ms', 'Táng', 'Kleehuhler', 'Product Management', 8174847135, 'rkleehuhler9@stanford.edu', '396 Lyons Road', 'Helvecia', 'WY9 6KR', 'Administrator'),
('Nyctea scandiaca', '1926304142', 'Mr', 'Björn', 'Whetnell', 'Product Management', 4349596458, 'cwhetnell1j@1und1.de', '3 Barnett Center', 'Meizhou', 'WL7 0EJ', 'jbailey'),
('Chauna torquata', '1978528148', 'Mr', 'Lorène', 'Rawson', 'Accounting', 2421075059, 'lrawsonx@usda.gov', '3951 3rd Terrace', 'Kamubheka', 'UT4 0KV', 'Administrator'),
('Paraxerus cepapi', '2066225286', 'Mr', 'Dafnée', 'Heineken', 'Sales', 8017415939, 'theinekenv@jalbum.net', '0 Tomscot Road', 'Salt Lake City', 'DR2 5AW', 'jbailey'),
('Petaurus breviceps', '2164491491', 'Rev', 'Mélanie', 'Feldman', 'Research and Development', 8121760971, 'ffeldman2k@istockphoto.com', '28 Surrey Place', 'Kebonsari', 'EJ9 6HT', 'Administrator'),
('Hippotragus niger', '2259477055', 'Ms', 'Naëlle', 'Gapp', 'Training', 9593521015, 'kgapp1r@reverbnation.com', '6 Heath Point', 'Loughrea', 'MR4 0UY', 'jbailey'),
('Ciconia episcopus', '2268022396', 'Ms', 'Valérie', 'Palliser', 'Engineering', 4142728931, 'opalliser3i@apache.org', '68887 Alpine Street', 'Daqian', 'RX1 7SW', 'Administrator'),
('Morelia spilotes variegata', '2304973410', 'Ms', 'Yóu', 'O\'Scanlan', 'Accounting', 4328430418, 'toscanlan1x@feedburner.com', '013 Holmberg Alley', 'Polo', 'DU3 9GE', 'Administrator'),
('Anthropoides paradisea', '2424783524', 'Honorab', 'Athéna', 'Doggett', 'Legal', 5613190882, 'mdoggettz@wiley.com', '7 Artisan Trail', 'Boca Raton', 'TF6 9GH', 'Administrator'),
('Cathartes aura', '2540681620', 'Honorab', 'Björn', 'Huffadine', 'Support', 6287032978, 'mhuffadine24@macromedia.com', '9410 Bunting Way', 'Lökbatan', 'MY6 6GZ', 'Administrator'),
('Buteo jamaicensis', '2554880110', 'Mr', 'Eugénie', 'Nassau', 'Engineering', 5683320093, 'gnassau7@addtoany.com', '8515 Bay Junction', 'Kōnan', 'DC8 3UB', 'jbailey'),
('Raphicerus campestris', '2622748332', 'Dr', 'Dafnée', 'Whistlecraft', 'Human Resources', 2163780595, 'rwhistlecraft23@is.gd', '39860 Eagle Crest Court', 'Datian', 'FX0 3KB', 'jbailey'),
('Eurocephalus anguitimens', '2667424861', 'Mrs', 'Bécassine', 'Gheorghescu', 'Sales', 4053285713, 'egheorghescu1m@g.co', '79706 Cottonwood Crossing', 'Särö', 'OI4 7NJ', 'Administrator'),
('Phascolarctos cinereus', '2695427639', 'Mr', 'Mén', 'Speke', 'Human Resources', 2253940511, 'nspeke3f@marketwatch.com', '7635 Morning Drive', 'Protaras', 'LH4 1YY', 'Administrator'),
('Seiurus aurocapillus', '2697969579', 'Dr', 'Régine', 'Isakson', 'Support', 6296826185, 'aisakson25@netscape.com', '0 Dovetail Place', 'Tiechang', 'GL5 2JF', 'jbailey'),
('Tadorna tadorna', '2729301614', 'Ms', 'Thérèse', 'Pendleberry', 'Business Development', 6448430572, 'apendleberry6@loc.gov', '3224 Mitchell Drive', 'Kuvandyk', 'TS6 1LC', 'jbailey'),
('Haematopus ater', '2759922597', 'Rev', 'Faîtes', 'Jillions', 'Legal', 6638397941, 'ajillions5@noaa.gov', '8 Forest Dale Circle', 'Moroni', 'XP8 7NO', 'jbailey'),
('Plocepasser mahali', '2786158074', 'Mr', 'Yóu', 'Spon', 'Business Development', 4867078760, 'jsponi@chicagotribune.com', '2677 Anniversary Parkway', 'São Martinho de Árvore', 'SJ7 9HB', 'Administrator'),
('Phalaropus lobatus', '2935372392', 'Mr', 'Illustrée', 'Whitwood', 'Accounting', 3594208001, 'nwhitwood38@jugem.jp', '8597 Johnson Court', 'Tournon-sur-Rhône', 'HS4 3VM', 'Administrator'),
('Haliaetus leucogaster', '2951008709', 'Rev', 'Amélie', 'Pinnigar', 'Business Development', 9569572313, 'npinnigar1d@i2i.jp', '2 Stang Drive', 'Xiakou', 'QJ6 0GL', 'jbailey'),
('Cynictis penicillata', '3031084460', 'Dr', 'Cléopatre', 'Mercik', 'Services', 6084810523, 'lmercik1v@deviantart.com', '2 Banding Court', 'Fenchen', 'ZQ9 4OX', 'Administrator'),
('Ceratotherium simum', '3082432152', 'Rev', 'Anaëlle', 'Eva', 'Accounting', 4696165955, 'heval@freewebs.com', '94453 Corscot Terrace', 'Dallas', 'TZ1 1GF', 'jbailey'),
('Podargus strigoides', '3089031552', 'Ms', 'Publicité', 'Bambrough', 'Legal', 8993872985, 'cbambrough21@hugedomains.com', '07321 Manufacturers Terrace', 'Baabda', 'AG3 7IC', 'jbailey'),
('Varanus komodensis', '3164747586', 'Dr', 'Marie-thérèse', 'Moyle', 'Product Management', 3954040135, 'vmoyleg@sakura.ne.jp', '0 Graceland Trail', 'Tanenofunan', 'TL7 1QP', 'jbailey'),
('Gabianus pacificus', '3190828028', 'Mr', 'Maëlann', 'McGaugan', 'Human Resources', 1529410387, 'emcgauganu@ebay.com', '8175 Steensland Point', 'Oranmore', 'DZ0 0YJ', 'Administrator'),
('Grus canadensis', '3252743845', 'Rev', 'Gaïa', 'Woodyatt', 'Services', 3667923040, 'bwoodyatt17@digg.com', '87658 Saint Paul Hill', 'Mrozy', 'WE4 8PY', 'Administrator'),
('Fulica cristata', '3296295116', 'Mr', 'Åke', 'Marklew', 'Accounting', 4978534894, 'kmarklewc@sun.com', '3 Hayes Court', 'Stende', 'BM2 1OF', 'Administrator'),
('Felis concolor', '3301217927', 'Mrs', 'Estève', 'Fishbourn', 'Training', 5485779133, 'dfishbourn1l@chron.com', '0931 Continental Plaza', 'Gardēz', 'KQ9 8AD', 'jbailey'),
('Eumetopias jubatus', '3397703315', 'Mr', 'Illustrée', 'Kinglesyd', 'Services', 9119919025, 'rkinglesyd17@newyorker.com', '58 Village Trail', 'Barrancabermeja', 'YR2 2JR', 'jbailey'),
('Lama pacos', '3421225176', 'Dr', 'Cécilia', 'Conti', 'Engineering', 7556247365, 'aconti2v@trellian.com', '2038 Main Lane', 'Espinillo', 'MA7 9FD', 'Administrator'),
('Ourebia ourebi', '3433695930', 'Honorab', 'Kallisté', 'Spender', 'Accounting', 8153751275, 'gspender19@simplemachines.org', '353 Sullivan Avenue', 'Dulyapino', 'ZD0 3AD', 'Administrator'),
('Felis libyca', '3439407506', 'Mr', 'Lucrèce', 'Quigley', 'Training', 3377919737, 'dquigley2c@wikimedia.org', '68485 Manitowish Way', 'Ribas do Rio Pardo', 'XP5 4ZQ', 'Administrator'),
('Aonyx cinerea', '3531051765', 'Mr', 'Cécile', 'Tayloe', 'Legal', 1991271956, 'ltayloei@intel.com', '17 Derek Street', 'Varkaus', 'KL1 5RP', 'jbailey'),
('Cacatua galerita', '3531762611', 'Rev', 'Kallisté', 'Iggo', 'Training', 2118247391, 'aiggo1p@bloglines.com', '6 Redwing Lane', 'Revava', 'QU6 5GX', 'Administrator'),
('Deroptyus accipitrinus', '3546774028', 'Ms', 'Bécassine', 'Jonke', 'Business Development', 2941644689, 'sjonke1v@unicef.org', '6357 Melby Plaza', 'Zākhū', 'OZ7 7ZD', 'jbailey'),
('Dusicyon thous', '3660007796', 'Dr', 'Bénédicte', 'Caudrey', 'Services', 3284135109, 'dcaudreye@pbs.org', '4732 Farwell Point', 'Sidomulyo', 'DM6 8PB', 'jbailey'),
('Sula dactylatra', '3782061466', 'Mr', 'Régine', 'Kreutzer', 'Research and Development', 1527030216, 'nkreutzert@miitbeian.gov.cn', '9641 Arrowood Trail', 'Ljungbyholm', 'OP7 1TR', 'jbailey'),
('Equus hemionus', '3813969423', 'Dr', 'Rébecca', 'Sunter', 'Legal', 5323105052, 'usunter22@seattletimes.com', '72738 Florence Plaza', 'Azun Atme', 'ZQ7 8WI', 'Administrator'),
('Trichosurus vulpecula', '3820705211', 'Mr', 'Loïca', 'Seefus', 'Training', 6909720595, 'lseefusb@oracle.com', '254 Gateway Avenue', 'Pruszcz', 'VV1 8JS', 'Administrator'),
('Ara chloroptera', '4063937928', 'Mrs', 'Mélinda', 'Camamill', 'Sales', 9205258686, 'bcamamill1i@a8.net', '38872 Oneill Parkway', 'Pocito', 'UB5 9XX', 'jbailey'),
('Ratufa indica', '4102210107', 'Rev', 'Åslög', 'Iwanowicz', 'Training', 9819068190, 'kiwanowiczn@bloglovin.com', '6978 Warrior Court', 'Dū Qal‘ah', 'RC1 2EF', 'jbailey'),
('Mungos mungo', '4140692910', 'Honorab', 'Hélène', 'Flagg', 'Marketing', 5746491749, 'rflaggs@moonfruit.com', '03207 Autumn Leaf Place', 'Sancang', 'LS1 3CN', 'jbailey'),
('Lorythaixoides concolor', '4169408632', 'Ms', 'Illustrée', 'Simnor', 'Business Development', 1105982375, 'ksimnor1g@wiley.com', '1998 Cambridge Avenue', 'Farafenni', 'BL3 1PC', 'Administrator'),
('Alopex lagopus', '4178535065', 'Rev', 'Méthode', 'Kerley', 'Support', 2337044392, 'mkerleyy@ca.gov', '54 Ryan Trail', 'Don Matías', 'KX9 4RD', 'Administrator'),
('Eutamias minimus', '4258805365', 'Mr', 'Marie-françoise', 'Endrici', 'Accounting', 5488763322, 'oendrici2b@constantcontact.com', '07 Dunning Park', 'Xilai', 'TN9 7LF', 'jbailey'),
('Naja nivea', '4298591112', 'Honorab', 'Solène', 'Wantling', 'Human Resources', 5478848294, 'pwantling20@godaddy.com', '9 Butternut Road', 'Maswa', 'OG0 5KD', 'jbailey'),
('Bucorvus leadbeateri', '4455540145', 'Ms', 'Clémence', 'Perotti', 'Sales', 1799289828, 'cperotti1h@who.int', '706 Warrior Crossing', 'Port Maria', 'QD2 2KV', 'Administrator'),
('Gazella granti', '4457713917', 'Rev', 'Maëlys', 'Krzysztofiak', 'Legal', 9118565712, 'skrzysztofiak1b@slideshare.net', '45658 Jana Court', 'Gondar', 'FT8 4KE', 'Administrator'),
('Crotaphytus collaris', '4492239369', 'Ms', 'Annotés', 'Patchett', 'Sales', 8567371694, 'tpatchett2c@cnbc.com', '1817 Myrtle Lane', 'Laingsburg', 'TV4 8IQ', 'jbailey'),
('Varanus sp.', '4637281179', 'Mr', 'Eugénie', 'Finan', 'Sales', 7275354798, 'kfinan16@amazon.co.uk', '641 Barby Plaza', 'Chełm', 'WB8 0LI', 'Administrator'),
('Canis lupus', '4638598030', 'Honorab', 'Néhémie', 'Girt', 'Business Development', 7945691346, 'dgirt1w@ted.com', '88 Lakeland Point', 'Zverevo', 'TJ4 3RC', 'Administrator'),
('Agkistrodon piscivorus', '4713789650', 'Ms', 'Publicité', 'Walhedd', 'Legal', 2414136782, 'lwalhedd1w@cbslocal.com', '11 Blue Bill Park Trail', 'Niechanowo', 'RT8 6EJ', 'jbailey'),
('Tachyglossus aculeatus', '4769464246', 'Mr', 'André', 'Welds', 'Business Development', 8078805680, 'ewelds1y@php.net', '29 Sommers Avenue', 'Katipunan', 'SS5 8BC', 'jbailey'),
('Milvus migrans', '4790174293', 'Honorab', 'Françoise', 'Fenlon', 'Human Resources', 9517697971, 'mfenlon2w@a8.net', '9561 Colorado Junction', 'Liuji', 'XH4 4AX', 'Administrator'),
('Psophia viridis', '4814323281', 'Honorab', 'Kallisté', 'Handrahan', 'Engineering', 5889009240, 'ghandrahan2e@slate.com', '23127 Monterey Plaza', 'Sakata', 'TJ8 1XH', 'Administrator'),
('Ammospermophilus nelsoni', '4827388453', 'Mr', 'Garçon', 'Wyld', 'Product Management', 6908930008, 'bwyld8@usnews.com', '008 Sommers Circle', 'Hat Yai', 'UN9 0ZU', 'jbailey'),
('Ninox superciliaris', '4850139537', 'Dr', 'Tán', 'Bantham', 'Human Resources', 8885976545, 'obantham35@bloglovin.com', '41275 Kennedy Parkway', 'Tsinandali', 'DC1 3LG', 'Administrator'),
('Plectopterus gambensis', '5040979113', 'Rev', 'Noëlla', 'Merwe', 'Engineering', 7193249060, 'nmerwe1p@tinyurl.com', '2 Continental Trail', 'Paracambi', 'FS6 6RK', 'jbailey'),
('Thamnolaea cinnmomeiventris', '5186694249', 'Mr', 'Bénédicte', 'Gaymar', 'Training', 5154579814, 'sgaymar0@answers.com', '13820 Aberg Center', 'Bandaragung', 'FC5 6IV', 'jbailey'),
('Echimys chrysurus', '5193010905', 'Rev', 'Léonore', 'Rival', 'Services', 8969943727, 'brival3e@miibeian.gov.cn', '9306 Hayes Parkway', 'Lakinsk', 'CB3 1DI', 'Administrator'),
('Ovis ammon', '5298068684', 'Mrs', 'Stévina', 'Lapping', 'Human Resources', 4767831963, 'mlapping31@github.com', '64 Southridge Court', 'Corbeil-Essonnes', 'UR9 4UE', 'Administrator'),
('Thylogale stigmatica', '5423770788', 'Mrs', 'Eugénie', 'Struthers', 'Services', 1484715742, 'rstruthers16@domainmarket.com', '93942 Ilene Parkway', 'Zhongbu', 'QP7 6CT', 'jbailey'),
('Bubo virginianus', '5447860570', 'Mr', 'Faîtes', 'Bocke', 'Engineering', 6066186507, 'fbocke22@ifeng.com', '2 Ridgeway Road', 'Xindu', 'NQ8 0MV', 'jbailey'),
('Uraeginthus angolensis', '5494804899', 'Mrs', 'Laïla', 'Duffield', 'Research and Development', 6491792507, 'hduffield3a@sciencedaily.com', '500 Dawn Circle', 'Chesma', 'AR6 9YQ', 'Administrator'),
('Kobus defassa', '5522638087', 'Mr', 'Bérénice', 'Claus', 'Training', 5672494050, 'nclaus2n@desdev.cn', '00644 Loeprich Road', 'Kanshi', 'ZK5 2QX', 'Administrator'),
('Phalacrocorax carbo', '5533345022', 'Mrs', 'Médiamass', 'Hurtic', 'Sales', 1461599840, 'khurtic2@freewebs.com', '53 Northridge Place', 'Honiara', 'LV4 0UY', 'Administrator'),
('Laniaurius atrococcineus', '5537041888', 'Mr', 'Eléa', 'Marion', 'Accounting', 1658638303, 'amarion4@blogs.com', '2 Saint Paul Junction', 'Gulong', 'AJ9 5VH', 'Administrator'),
('Macropus robustus', '5567625246', 'Mr', 'Méryl', 'De Vile', 'Product Management', 5446007416, 'gdeviles@canalblog.com', '254 Hudson Hill', 'Psygansu', 'ET8 9NI', 'Administrator'),
('Uraeginthus angolensis', '5669763010', 'Honorab', 'Lóng', 'Rawstorne', 'Legal', 6692760680, 'jrawstorne2d@theatlantic.com', '76260 Arrowood Avenue', 'Pointe Michel', 'RW9 0PP', 'jbailey'),
('Ictalurus furcatus', '5679478100', 'Rev', 'Béatrice', 'Charkham', 'Services', 3038876793, 'lcharkhamf@sohu.com', '98 Burrows Circle', 'Littleton', 'EK5 3MX', 'jbailey'),
('Butorides striatus', '5684664744', 'Dr', 'Garçon', 'Rome', 'Services', 3642789120, 'trome2l@fema.gov', '76 Reinke Way', 'Basseterre', 'UQ6 0EF', 'Administrator'),
('Potos flavus', '5746584448', 'Mr', 'Marlène', 'Fieldhouse', 'Research and Development', 6643966344, 'rfieldhouse2f@bloglovin.com', '2 Coleman Circle', 'Zheleznogorsk', 'KV0 9MJ', 'Administrator'),
('Buteo galapagoensis', '5779361520', 'Mr', 'Marylène', 'Stalf', 'Support', 8453619583, 'lstalf23@miibeian.gov.cn', '77434 Springs Circle', 'Santa Fe', 'TC5 9NX', 'Administrator'),
('Procyon cancrivorus', '5839241488', 'Rev', 'Lóng', 'Mac Giolla Pheadair', 'Support', 7379973893, 'bmacgiollapheadairf@washington.edu', '126 Evergreen Plaza', 'Cruz das Almas', 'RH7 2FT', 'Administrator'),
('Oxybelis sp.', '5841188867', 'Mrs', 'Renée', 'Tappin', 'Marketing', 2347629104, 'ntappin36@netscape.com', '35476 Mcbride Alley', 'Tangshan', 'PO8 0SC', 'Administrator'),
('Phoenicopterus ruber', '5911529473', 'Honorab', 'Yáo', 'Delicate', 'Accounting', 4938872438, 'cdelicate2u@bbb.org', '7 Bunker Hill Terrace', 'Magapit', 'DT2 7YQ', 'Administrator'),
('Trachyphonus vaillantii', '6017254480', 'Mr', 'Marie-hélène', 'Bromehead', 'Accounting', 3233103116, 'cbromeheadh@tmall.com', '026 Carey Way', 'Emiliano Zapata', 'TD2 8RO', 'jbailey'),
('Ninox superciliaris', '6037375954', 'Mrs', 'Noëlla', 'Jacmard', 'Training', 3594790580, 'sjacmard5@webeden.co.uk', '699 Blackbird Court', 'Tver', 'KU5 6RN', 'Administrator'),
('Odocoileus hemionus', '6044203428', 'Mr', 'Cinéma', 'Trace', 'Research and Development', 2637319594, 'gtrace10@ovh.net', '00 Evergreen Plaza', 'Yaurisque', 'VU6 0UL', 'jbailey'),
('Sarkidornis melanotos', '6122140385', 'Mrs', 'Cinéma', 'Snalom', 'Services', 4403827052, 'psnalom9@youku.com', '3 West Lane', 'Shibetsu', 'LP1 0ZH', 'jbailey'),
('Nasua nasua', '6162390130', 'Honorab', 'Eloïse', 'Ciccotti', 'Business Development', 4198157887, 'wciccotti3@chronoengine.com', '45 Melody Drive', 'Uusikaupunki', 'LT7 1YO', 'Administrator'),
('Papio ursinus', '6175638547', 'Mrs', 'Gérald', 'Stroud', 'Engineering', 2119727593, 'nstroudg@independent.co.uk', '02 Rockefeller Point', 'Erdaojiang', 'ID1 8PD', 'Administrator'),
('Nycticorax nycticorax', '6176914068', 'Ms', 'Lóng', 'Gilley', 'Research and Development', 9881088803, 'fgilleyk@nsw.gov.au', '2 Warbler Place', 'Comalapa', 'QC2 5QD', 'Administrator'),
('Leptoptilos crumeniferus', '6239406915', 'Mr', 'Lén', 'Howatt', 'Product Management', 5055923636, 'vhowatt2m@cnn.com', '83 Dwight Center', 'Dlemer', 'VY3 6PD', 'Administrator'),
('Dasyurus maculatus', '6239654080', 'Honorab', 'Gérald', 'Vaughan', 'Engineering', 5404462819, 'bvaughan1t@lycos.com', '4110 Sheridan Street', 'Yangchengzhuang', 'UO8 4VY', 'jbailey'),
('Bettongia penicillata', '6248276367', 'Ms', 'Angèle', 'Dwine', 'Human Resources', 4815327143, 'bdwine1u@edublogs.org', '78308 Crownhardt Road', 'Nantes', 'MA2 6KP', 'Administrator'),
('Cygnus atratus', '6324533113', 'Mrs', 'Léana', 'Thundercliffe', 'Sales', 8916240970, 'ithundercliffe37@yelp.com', '4801 Moose Pass', 'Luleå', 'BI9 3VC', 'Administrator'),
('Hystrix cristata', '6328802335', 'Mr', 'Méng', 'Philipet', 'Accounting', 7685522624, 'zphilipetr@github.com', '2 Springs Hill', 'Casais Brancos', 'FV7 6NQ', 'jbailey'),
('Capreolus capreolus', '6359722820', 'Ms', 'Marylène', 'Popland', 'Sales', 2083609131, 'mpopland1a@cocolog-nifty.com', '48510 Mockingbird Park', 'Kotor', 'PL0 5EB', 'jbailey'),
('Neophron percnopterus', '6423268079', 'Honorab', 'Håkan', 'Echalie', 'Product Management', 2907681192, 'sechalie1z@cisco.com', '8 Moland Road', 'Castro Daire', 'ED5 5XR', 'Administrator'),
('Lycosa godeffroyi', '6542115731', 'Rev', 'Nuó', 'Oubridge', 'Product Management', 7922173895, 'foubridge3c@msn.com', '5991 Sherman Center', 'Yershov', 'NF2 2QO', 'Administrator'),
('Pteronura brasiliensis', '6651132775', 'Mr', 'Nuó', 'Bedbury', 'Product Management', 6911760645, 'obedbury2i@mysql.com', '359 Main Junction', 'Aţ Ţawīlah', 'OQ8 8OV', 'Administrator'),
('Phalacrocorax varius', '6677884469', 'Honorab', 'Marie-noël', 'Coxall', 'Marketing', 9384619680, 'bcoxallh@comcast.net', '19 2nd Plaza', 'Kilafors', 'PL3 5WY', 'Administrator'),
('Papio cynocephalus', '6802323945', 'Ms', 'Célia', 'De Few', 'Legal', 3657146016, 'tdefew14@hibu.com', '6094 Parkside Pass', 'Orléans', 'TI5 3LN', 'Administrator'),
('Milvus migrans', '6813086415', 'Mr', 'Noémie', 'Dutson', 'Business Development', 8183574460, 'cdutson3@yellowpages.com', '0776 Pierstorff Road', 'Ticaco', 'PQ2 5TI', 'jbailey'),
('Pteropus rufus', '6832579041', 'Rev', 'Geneviève', 'Blowfelde', 'Accounting', 7333674299, 'ablowfeldea@ning.com', '246 Judy Plaza', 'Cruz Alta', 'FB2 2VH', 'jbailey'),
('Equus burchelli', '6848897730', 'Mrs', 'Aloïs', 'Cardenas', 'Product Management', 3153102030, 'acardenas1o@utexas.edu', '90 Reinke Plaza', 'Smara', 'IN5 6SF', 'jbailey'),
('Cygnus atratus', '6954120712', 'Ms', 'Lèi', 'Dukesbury', 'Marketing', 5959926597, 'kdukesburyj@tumblr.com', '77422 Meadow Vale Park', 'Vorzel’', 'LZ6 6VK', 'Administrator'),
('Mellivora capensis', '7069844779', 'Ms', 'Börje', 'Crate', 'Legal', 2675722054, 'jcrate26@squidoo.com', '6 Continental Court', 'Basail', 'TH3 1DV', 'jbailey'),
('Martes pennanti', '7088310364', 'Honorab', 'Gwenaëlle', 'Corcoran', 'Accounting', 8799304326, 'mcorcoran1f@webnode.com', '1 Spenser Place', 'Santa Bárbara', 'LX4 6UV', 'Administrator'),
('Chlamydosaurus kingii', '7156003778', 'Mr', 'Eléa', 'Mahy', 'Research and Development', 2122704340, 'gmahyc@vimeo.com', '30854 Graceland Lane', 'Neob', 'JO5 9XQ', 'jbailey'),
('Ninox superciliaris', '7172074593', 'Dr', 'Mélissandre', 'Brimley', 'Services', 5414895367, 'tbrimley12@themeforest.net', '4739 Pine View Trail', 'La Libertad', 'GT2 6CG', 'Administrator'),
('Dusicyon thous', '7195089997', 'Rev', 'Lóng', 'Card', 'Engineering', 5409239695, 'ncard2z@uiuc.edu', '757 Eliot Crossing', 'Jiantian', 'BJ9 4NU', 'Administrator'),
('Papilio canadensis', '7223865379', 'Mrs', 'Dorothée', 'Dunderdale', 'Marketing', 8137027547, 'mdunderdalej@phpbb.com', '33 Di Loreto Way', 'Tampa', 'UD8 8QB', 'jbailey'),
('Streptopelia senegalensis', '7252287042', 'Honorab', 'Lén', 'Basset', 'Sales', 4152961093, 'pbasset6@dot.gov', '857 Shasta Place', 'San Francisco', 'SB7 8YG', 'Administrator'),
('Columba palumbus', '7296834221', 'Ms', 'Mélys', 'Willarton', 'Training', 2068588629, 'awillarton3b@pbs.org', '6331 Summit Circle', 'Gradil', 'VQ3 8QS', 'Administrator'),
('Pycnonotus nigricans', '7305291763', 'Mrs', 'Märta', 'Tombling', 'Engineering', 8728324315, 'stombling1y@acquirethisname.com', '30 Graceland Court', 'Francisco I Madero', 'ST3 2FU', 'Administrator'),
('Dicrostonyx groenlandicus', '7352437937', 'Mrs', 'Crééz', 'Cornels', 'Product Management', 5261291343, 'ecornels2t@gmpg.org', '60089 Lake View Road', 'Cantoria', 'FQ8 2GX', 'Administrator'),
('Dicrostonyx groenlandicus', '7369482376', 'Rev', 'Cécilia', 'McCrostie', 'Services', 6175755727, 'jmccrostie1u@loc.gov', '5 Hollow Ridge Avenue', 'Guayabal', 'SN9 0BW', 'jbailey'),
('Vanellus armatus', '7541086885', 'Ms', 'Maéna', 'Cotilard', 'Support', 1319419300, 'ccotilard28@biglobe.ne.jp', '3 Elmside Center', 'Rio Novo do Sul', 'KY7 8QD', 'jbailey'),
('Larus fuliginosus', '7582631468', 'Mr', 'Josée', 'Copperwaite', 'Sales', 3153444732, 'jcopperwaite2o@jiathis.com', '670 Continental Point', 'Río Segundo', 'QO0 8KI', 'Administrator'),
('Paradoxurus hermaphroditus', '7629154876', 'Mr', 'Mélanie', 'Steinor', 'Training', 6903575872, 'msteinoro@goo.ne.jp', '24343 Hudson Center', 'Colos', 'WF5 5WK', 'jbailey'),
('Cordylus giganteus', '7659598733', 'Mr', 'Yénora', 'Stienton', 'Accounting', 4293490960, 'rstienton1@cocolog-nifty.com', '9 John Wall Park', 'Ćićevac', 'OM2 2JE', 'Administrator'),
('Acridotheres tristis', '7697653940', 'Mr', 'Anaé', 'Flower', 'Engineering', 1533279499, 'sflowerv@wix.com', '8 Packers Center', 'Candoni', 'YR1 7UT', 'Administrator'),
('Rhabdomys pumilio', '7722943817', 'Rev', 'Réservés', 'Gilliatt', 'Legal', 2036617182, 'pgilliatt4@1und1.de', '7 Almo Trail', 'New Haven', 'VL5 1LR', 'jbailey'),
('Martes pennanti', '7882640711', 'Honorab', 'Faîtes', 'Begley', 'Services', 3248952647, 'nbegley1a@ted.com', '62 Ryan Drive', 'Aqqan', 'OO3 0VT', 'Administrator'),
('Rhabdomys pumilio', '7917527602', 'Dr', 'Noëlla', 'Code', 'Accounting', 1195223043, 'fcode39@businessinsider.com', '7 Elgar Road', 'Spanish Town', 'DO1 7NY', 'Administrator'),
('Choriotis kori', '7929038650', 'Honorab', 'Hélène', 'Tropman', 'Training', 9122812869, 'ltropman1q@techcrunch.com', '247 Schurz Street', 'Borda da Mata', 'AK1 7PF', 'jbailey'),
('Creagrus furcatus', '7930740222', 'Honorab', 'André', 'Lettsom', 'Sales', 1777749834, 'alettsom27@twitpic.com', '81 Calypso Junction', 'Gaotuan', 'KE4 7SE', 'jbailey'),
('Ara chloroptera', '8024605215', 'Honorab', 'Clémentine', 'Prayer', 'Business Development', 6465438728, 'gprayer2j@about.com', '41598 Surrey Lane', 'Markópoulo', 'ZN0 7GC', 'Administrator'),
('Varanus komodensis', '8138382736', 'Mr', 'Dafnée', 'Bleiman', 'Engineering', 6369170662, 'sbleiman7@ft.com', '7763 Portage Pass', 'Kaizuka', 'BT2 8NO', 'Administrator'),
('Eremophila alpestris', '8156674472', 'Mr', 'Mélys', 'Dessent', 'Business Development', 5324332944, 'ddessent14@sourceforge.net', '2 Melody Pass', 'Novyy Karachay', 'XJ9 0DH', 'jbailey'),
('Egretta thula', '8164407034', 'Mrs', 'Laurélie', 'Bartolommeo', 'Business Development', 8806101661, 'vbartolommeol@phpbb.com', '1635 Fremont Center', 'Tsukumiura', 'JQ1 8LM', 'Administrator'),
('Canis aureus', '8240482338', 'Honorab', 'Lorène', 'Kyne', 'Engineering', 8415085355, 'tkyne1t@istockphoto.com', '30 Esch Hill', 'Lameira', 'MT9 4BU', 'Administrator'),
('Semnopithecus entellus', '8268159887', 'Honorab', 'Almérinda', 'Cardall', 'Support', 1082952346, 'bcardall2p@squarespace.com', '02142 3rd Junction', 'Baofeng', 'YL6 7QH', 'Administrator'),
('unavailable', '8272831759', 'Mrs', 'Lucrèce', 'Fullom', 'Training', 8424777070, 'efullom2a@rakuten.co.jp', '46804 Washington Plaza', 'Wąbrzeźno', 'BD6 3QD', 'Administrator'),
('Dusicyon thous', '8294659717', 'Honorab', 'Marie-françoise', 'Stansall', 'Research and Development', 7962527065, 'estansall11@usa.gov', '1794 Ridgeview Point', 'Reconquista', 'ZZ2 0HQ', 'jbailey'),
('Balearica pavonina', '8313993475', 'Rev', 'Loïca', 'Davidson', 'Business Development', 3984370166, 'qdavidson30@illinois.edu', '5 Kingsford Park', 'Palekastro', 'DZ6 3BH', 'Administrator'),
('Mabuya spilogaster', '8339918182', 'Rev', 'Miléna', 'Wither', 'Services', 7451939976, 'swither29@themeforest.net', '52 Loeprich Park', 'Popovice', 'AN1 5PO', 'jbailey'),
('Dasyurus maculatus', '8445293882', 'Mr', 'Océanne', 'Titherington', 'Engineering', 8606650056, 'mtitherington15@pagesperso-orange.fr', '20371 Riverside Pass', 'Tiflet', 'WA7 3JZ', 'Administrator'),
('Tadorna tadorna', '8496711489', 'Honorab', 'Léane', 'Abberley', 'Product Management', 9097031707, 'nabberleyt@huffingtonpost.com', '74 Derek Crossing', 'Liwale', 'VG7 4VA', 'Administrator'),
('Cracticus nigroagularis', '8508092365', 'Mr', 'Styrbjörn', 'Cornu', 'Sales', 7977844458, 'kcornu1n@live.com', '540 Milwaukee Pass', 'Karanggintung', 'ZJ9 3SV', 'Administrator'),
('Castor canadensis', '8527378036', 'Rev', 'Anaëlle', 'Navarijo', 'Business Development', 7596372659, 'enavarijo1o@mit.edu', '54 Butternut Drive', 'Langtou', 'VN5 6MY', 'Administrator'),
('Larus dominicanus', '8554449053', 'Mr', 'Gösta', 'Gounard', 'Accounting', 5183707758, 'ogounardd@ucoz.com', '56678 International Junction', 'Pleshanovo', 'QO3 3IJ', 'Administrator'),
('Ephippiorhynchus mycteria', '8566025911', 'Honorab', 'Méline', 'Skacel', 'Support', 3166992887, 'sskacel8@flavors.me', '304 Farwell Place', 'Youxi', 'NS1 1NQ', 'Administrator'),
('Diceros bicornis', '8737315217', 'Dr', 'Mégane', 'Wegenen', 'Support', 9834230717, 'awegenen1z@mapquest.com', '529 Morning Crossing', 'Gongchang Zhen', 'HD0 2TI', 'jbailey'),
('Lamprotornis chalybaeus', '8749874073', 'Honorab', 'Miléna', 'Dragonette', 'Product Management', 7679314666, 'cdragonette1g@furl.net', '3 Leroy Park', 'Yunfu', 'IW2 2JI', 'jbailey'),
('Libellula quadrimaculata', '8795432855', 'Mr', 'Régine', 'Shimmings', 'Business Development', 4321282792, 'sshimmings1n@cnbc.com', '9 Delaware Park', 'Plato', 'RD4 4RK', 'jbailey'),
('Mellivora capensis', '8800063140', 'Rev', 'Åslög', 'Dowson', 'Accounting', 3728340150, 'hdowson2y@yolasite.com', '67253 Lien Crossing', 'Laval', 'EA4 5KC', 'Administrator'),
('unavailable', '8940431951', 'Dr', 'Marie-noël', 'Steven', 'Training', 1821158015, 'vsteven1d@nasa.gov', '54 Loomis Circle', 'Hinigaran', 'OC0 5ZR', 'Administrator'),
('Chloephaga melanoptera', '8987504244', 'Mr', 'Gaétane', 'Jeskin', 'Sales', 1038707606, 'njeskinq@histats.com', '57 Cordelia Center', 'Shahe', 'YK1 1GA', 'Administrator'),
('Canis aureus', '9030329922', 'Dr', 'Naéva', 'Friday', 'Product Management', 3526639475, 'ifriday2s@symantec.com', '2270 Kennedy Way', 'Taroudant', 'IJ5 4ZL', 'Administrator'),
('Mirounga leonina', '9085976312', 'Mrs', 'Gisèle', 'Diglin', 'Human Resources', 8518293568, 'gdiglin19@edublogs.org', '50918 Northport Pass', 'Careva Ćuprija', 'WD5 0KZ', 'jbailey'),
('Semnopithecus entellus', '9095413370', 'Mrs', 'Andrée', 'Link', 'Training', 9518029272, 'alink18@furl.net', '54 Clyde Gallagher Park', 'Corona', 'JM8 9HP', 'Administrator'),
('Ctenophorus ornatus', '9098052054', 'Honorab', 'Anaïs', 'O\'Crigane', 'Accounting', 6851564418, 'aocriganez@youtu.be', '9 Alpine Circle', 'Huifa', 'LK8 8HT', 'jbailey'),
('Geospiza sp.', '9113700142', 'Honorab', 'Anaé', 'Cosgrove', 'Services', 6253638877, 'mcosgrove13@redcross.org', '63 Blaine Avenue', 'Orós', 'FL0 2SQ', 'jbailey'),
('Columba livia', '9135413669', 'Rev', 'Stévina', 'Leaney', 'Product Management', 6945106077, 'sleaney1e@topsy.com', '7 Sauthoff Trail', 'Myślenice', 'JD3 5RV', 'jbailey'),
('Tenrec ecaudatus', '9177859706', 'Dr', 'Thérèsa', 'Harkes', 'Training', 6278019035, 'mharkes1c@patch.com', '2 Lakewood Center', 'Montluel', 'UB6 7IM', 'Administrator'),
('Phoca vitulina', '9216338910', 'Dr', 'Léane', 'MacKissack', 'Training', 1047068645, 'smackissack3g@jimdo.com', '20 Bayside Point', 'Kebonagung', 'YA4 7QQ', 'Administrator'),
('Gerbillus sp.', '9218584947', 'Honorab', 'Eléonore', 'Templman', 'Human Resources', 6371459327, 'mtemplmanw@parallels.com', '16849 Independence Junction', 'Ash Shuqayrah', 'XW8 0TE', 'jbailey'),
('Alopex lagopus', '9385633558', 'Mrs', 'Solène', 'Boller', 'Product Management', 3308919092, 'gboller1m@goodreads.com', '1 Di Loreto Court', 'Kasserine', 'VC4 8ZL', 'jbailey'),
('unavailable', '9417626591', 'Mrs', 'Cléopatre', 'Blindt', 'Services', 9499874364, 'xblindt1s@homestead.com', '81649 Holmberg Trail', 'Ciherang', 'PN1 7LP', 'jbailey'),
('Ammospermophilus nelsoni', '9592277749', 'Ms', 'Méryl', 'Zolini', 'Engineering', 7858645647, 'jzolini1s@chronoengine.com', '45686 Atwood Avenue', 'Bogoroditsk', 'VO8 2XZ', 'Administrator'),
('Chelodina longicollis', '9696538588', 'Mr', 'Åslög', 'Behrend', 'Training', 5283619288, 'ybehrendp@microsoft.com', '59 Florence Crossing', 'Maguan', 'IN5 1SD', 'Administrator'),
('Anas bahamensis', '9712019482', 'Honorab', 'Réservés', 'Spurdens', 'Training', 3948771635, 'sspurdens26@techcrunch.com', '149 Parkside Plaza', 'Goussainville', 'EP7 6KR', 'Administrator'),
('Dendrohyrax brucel', '9791221509', 'Mrs', 'Inès', 'Cauldfield', 'Legal', 7435224373, 'ocauldfield2d@cafepress.com', '0 Northwestern Alley', 'Chinú', 'LW1 1VJ', 'Administrator'),
('Pterocles gutturalis', '9839393240', 'Mr', 'Lauréna', 'Tressler', 'Human Resources', 7945403766, 'stressler2q@slashdot.org', '0 Esch Crossing', 'Stavanger', 'ZA1 9SS', 'Administrator'),
('Anas bahamensis', '9872383187', 'Honorab', 'Wá', 'Eastby', 'Legal', 7308524646, 'ueastby1f@storify.com', '891 Claremont Park', 'Zhongyuanlu', 'BX9 5CJ', 'jbailey'),
('Lutra canadensis', '9872520750', 'Mr', 'Maéna', 'Borles', 'Research and Development', 9277769863, 'rborles1l@blinklist.com', '64 Pleasure Trail', 'Tytuvėnėliai', 'EY4 6RG', 'Administrator'),
('Ploceus intermedius', '9922246378', 'Rev', 'Mylène', 'Bricknell', 'Support', 4575596810, 'hbricknellr@yolasite.com', '28457 Brown Point', 'Yantianhe', 'RM0 8BR', 'Administrator'),
('Varanus salvator', '9930013705', 'Dr', 'Laurène', 'Folland', 'Accounting', 1331796708, 'lfolland11@sun.com', '643 Upham Drive', 'Koceljeva', 'AM4 2UB', 'Administrator'),
('Certotrichas paena', '9940795305', 'Mr', 'Aurélie', 'Reagan', 'Sales', 4003211501, 'sreagan10@ucla.edu', '081 Fairfield Circle', 'Leone', 'BM5 9MG', 'Administrator'),
('Phalacrocorax albiventer', '9970818045', 'Ms', 'Mélinda', 'Elman', 'Support', 8127089629, 'delman1x@gnu.org', '881 Vermont Park', 'Kolochava', 'EE6 2EE', 'jbailey');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `GroupName` varchar(64) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`GroupName`) VALUES
('Administrator'),
('HGS Video Group'),
('Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectName` varchar(64) NOT NULL,
  `ProjectID` varchar(10) NOT NULL,
  `InGroup` varchar(64) NOT NULL,
  `Notes` varchar(255) NOT NULL,
  `CompletedStatus` varchar(12) NOT NULL,
  `CreateDate` date NOT NULL,
  `StartDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`ProjectName`, `ProjectID`, `InGroup`, `Notes`, `CompletedStatus`, `CreateDate`, `StartDate`) VALUES
('Submit COVID-19 Training Documents', '2033158861', 'Administrator', 'The documents for the new COVID-19 Restrictions need to be typed, and submitted for review.', 'Not Started', '2021-03-06', '2021-03-10'),
('Clean Out The Rubbish Bins', '2143660822', 'HGS Video Group', 'Please clean the bins out.', 'In Progress', '2021-03-06', '2021-03-06'),
('Training Video For Staff', '2147483647', 'HGS Video Group', 'We need to make a professional training video which will inform staff on the new COVID-19 requirements of the school.', 'Not Started', '2021-03-06', '2021-03-10'),
('Clean Drains', '3254771033', 'HGS Video Group', 'Clean The Drains', 'Not Started', '2021-03-06', '2021-03-06'),
('Give Paperwork To Bobby', '4375883144', 'HGS Video Group', 'Give bobby the paperwork for the files', 'Not Started', '2021-03-06', '2021-03-25'),
('Fax Some Faxes', '4710031558', 'HGS Video Group', '', 'Not Started', '2021-03-06', '2021-03-06'),
('Create Spreadsheeet', '4755831148', 'HGS Video Group', '', 'In Progress', '2021-03-07', '2021-03-07'),
('Print Some Documents Again', '5822142260', 'HGS Video Group', '', 'Not Started', '2021-03-06', '2021-03-31'),
('Print Some Documents', '6008255471', 'HGS Video Group', '', 'Not Started', '2021-03-06', '2021-03-31'),
('Test The Nuclear Power Plant', '6033253371', 'HGS Video Group', 'Please do this quickly', 'Not Started', '2021-03-07', '2021-03-07'),
('Make Cupcakes', '6071153661', 'HGS Video Group', 'Please make some cupcakes', 'Completed', '2021-03-07', '2021-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `staffinformation`
--

CREATE TABLE `staffinformation` (
  `Username` varchar(32) NOT NULL,
  `FirstName` varchar(24) NOT NULL,
  `MiddleName` varchar(24) NOT NULL,
  `LastName` varchar(24) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `NationalInsurance` char(9) NOT NULL,
  `Phone` bigint(11) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `LocatedAt` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staffinformation`
--

INSERT INTO `staffinformation` (`Username`, `FirstName`, `MiddleName`, `LastName`, `DateOfBirth`, `NationalInsurance`, `Phone`, `Email`, `LocatedAt`) VALUES
('Administrator', '', '', '', '2021-03-01', 'AB123456A', 0, '', ''),
('mfletcher', 'Marcus', 'A', 'Fletcher', '1955-07-16', 'HU787637A', 7892892836, 'fl.marcus@gmail.com', 'Bradford, England'),
('jbailey', 'Jack', 'A', 'Bailey', '2002-10-26', 'NH676254A', 2147483647, '14jbailey@heckgrammar.co.uk', 'Heckmondwike, UK');

-- --------------------------------------------------------

--
-- Table structure for table `userinformation`
--

CREATE TABLE `userinformation` (
  `Username` varchar(32) NOT NULL,
  `Password` varchar(64) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `MemberGroup` varchar(64) NOT NULL,
  `IsTeamLeader` tinyint(1) NOT NULL,
  `AccessLevel` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userinformation`
--

INSERT INTO `userinformation` (`Username`, `Password`, `MemberGroup`, `IsTeamLeader`, `AccessLevel`) VALUES
('Administrator', 'password', 'Administrator', 1, 2),
('jbailey', 'password', 'HGS Video Group', 1, 1),
('mfletcher', 'MARCUS10', 'Marketing', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`ContactID`),
  ADD KEY `Addedby` (`Addedby`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`GroupName`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `InGroup` (`InGroup`);

--
-- Indexes for table `staffinformation`
--
ALTER TABLE `staffinformation`
  ADD PRIMARY KEY (`NationalInsurance`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `userinformation`
--
ALTER TABLE `userinformation`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `MemberGroup` (`MemberGroup`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`Addedby`) REFERENCES `userinformation` (`Username`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`InGroup`) REFERENCES `groups` (`GroupName`);

--
-- Constraints for table `staffinformation`
--
ALTER TABLE `staffinformation`
  ADD CONSTRAINT `staffinformation_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `userinformation` (`Username`);

--
-- Constraints for table `userinformation`
--
ALTER TABLE `userinformation`
  ADD CONSTRAINT `userinformation_ibfk_1` FOREIGN KEY (`MemberGroup`) REFERENCES `groups` (`GroupName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
