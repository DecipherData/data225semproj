

CREATE TABLE IF NOT EXISTS `product_group` (
  `product_group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  PRIMARY KEY (`product_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='product group for categorizing product type';

insert into product_group (product_group_id , group_name , is_active) values(1,'Garment Upper body','Y');
insert into product_group (product_group_id , group_name , is_active) values(2,'Underwear','N');
insert into product_group (product_group_id , group_name , is_active) values(3,'Socks & Tights','N');
insert into product_group (product_group_id , group_name , is_active) values(4,'Garment Lower body','Y');
insert into product_group (product_group_id , group_name , is_active) values(5,'Accessories','N');
insert into product_group (product_group_id , group_name , is_active) values(6,'Items','N');
insert into product_group (product_group_id , group_name , is_active) values(7,'Nightwear','N');
insert into product_group (product_group_id , group_name , is_active) values(8,'Unknown','N');
insert into product_group (product_group_id , group_name , is_active) values(9,'Underwear/nightwear','N');
insert into product_group (product_group_id , group_name , is_active) values(10,'Shoes','N');
insert into product_group (product_group_id , group_name , is_active) values(11,'Swimwear','N');
insert into product_group (product_group_id , group_name , is_active) values(12,'Garment Full body','Y');
insert into product_group (product_group_id , group_name , is_active) values(13,'Cosmetic','N');
insert into product_group (product_group_id , group_name , is_active) values(14,'Interior textile','N');
insert into product_group (product_group_id , group_name , is_active) values(15,'Bags','N');
insert into product_group (product_group_id , group_name , is_active) values(16,'Furniture','N');
insert into product_group (product_group_id , group_name , is_active) values(17,'Garment and Shoe care','N');
insert into product_group (product_group_id , group_name , is_active) values(18,'Fun','N');
insert into product_group (product_group_id , group_name , is_active) values(19,'Stationery','N');

CREATE TABLE IF NOT EXISTS `projectdata225`.`product_type` (
  `product_type_id` INT NOT NULL AUTO_INCREMENT,
  `product_group_id` INT NOT NULL,
  `type_name` VARCHAR(100) NOT NULL,
  `is_active` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`product_type_id`),
  INDEX `fk_product_type_product_grp_id_idx` (`product_group_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_type_product_grp_id`
    FOREIGN KEY (`product_group_id`)
    REFERENCES `projectdata225`.`product_group` (`product_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'product type for categorization of product';


insert into product_type (product_type_id, product_group_id,type_name,is_active) values(253,1,'Vest top','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(273,4,'Leggings/Tights','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(252,1,'Sweater','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(254,1,'Top','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(272,4,'Trousers','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(256,12,'Bodysuit','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(308,1,'Hoodie','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(275,4,'Skirt','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(255,1,'T-shirt','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(265,12,'Dress','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(274,4,'Shorts','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(259,1,'Shirt','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(245,1,'Cardigan','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(264,1,'Blazer','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(267,12,'Jumpsuit/Playsuit','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(262,1,'Jacket','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(277,12,'Costumes','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(263,1,'Coat','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(257,1,'Polo shirt','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(260,1,'Tailored Waistcoat','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(258,1,'Blouse','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(271,12,'Outdoor overall','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(268,12,'Dungarees','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(276,4,'Outdoor trousers','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(270,12,'Garment Set','Y');
insert into product_type (product_type_id, product_group_id,type_name,is_active) values(261,1,'Outdoor Waistcoat','Y');




CREATE TABLE IF NOT EXISTS `projectdata225`.`product_style` (
  `product_style_id` INT NOT NULL AUTO_INCREMENT,
  `style_name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`product_style_id`))
COMMENT = 'different style of products supported by the system';

insert into product_style(product_style_id , style_name , description) values(1,'Offsholder Neckline','');
insert into product_style(product_style_id , style_name , description) values(2,'Bateau Neckline','');
insert into product_style(product_style_id , style_name , description) values(3,'Sweetheart Neckline','');
insert into product_style(product_style_id , style_name , description) values(4,'Scoop Neckline','');
insert into product_style(product_style_id , style_name , description) values(5,'V neckline','');
insert into product_style(product_style_id , style_name , description) values(6,'Sqaure Neckline','');
insert into product_style(product_style_id , style_name , description) values(7,'Cowl Neckline','');
insert into product_style(product_style_id , style_name , description) values(8,'Sabrina Neckline','');
insert into product_style(product_style_id , style_name , description) values(9,'Asymmetric Neckline','');
insert into product_style(product_style_id , style_name , description) values(10,'U Neckline','');
insert into product_style(product_style_id , style_name , description) values(11,'Halter Neckline','');
insert into product_style(product_style_id , style_name , description) values(12,'Strapless Neckline','');
insert into product_style(product_style_id , style_name , description) values(13,'Rolledup Sleeve','');
insert into product_style(product_style_id , style_name , description) values(14,'Puffed Sleeve','');
insert into product_style(product_style_id , style_name , description) values(15,'Flutter Sleeve','');
insert into product_style(product_style_id , style_name , description) values(16,'Flared Sleeve','');
insert into product_style(product_style_id , style_name , description) values(17,'Cuffed Sleeve','');
insert into product_style(product_style_id , style_name , description) values(18,'Cap Sleeve','');
insert into product_style(product_style_id , style_name , description) values(19,'Bell Sleeve','');
insert into product_style(product_style_id , style_name , description) values(20,'Batwing Sleeve','');
insert into product_style(product_style_id , style_name , description) values(21,'Drop Shoulder Sleeve','');
insert into product_style(product_style_id , style_name , description) values(22,'Dolman Sleeve','');
insert into product_style(product_style_id , style_name , description) values(23,'Kimono Sleeve','');
insert into product_style(product_style_id , style_name , description) values(24,'Raglan Sleeve','');
insert into product_style(product_style_id , style_name , description) values(25,'Wide Straps Sleeve','');
insert into product_style(product_style_id , style_name , description) values(26,'Sleeveless ','');
insert into product_style(product_style_id , style_name , description) values(27,'Set-in Sleeve','');
insert into product_style(product_style_id , style_name , description) values(28,'3/4 Sleeve','');
insert into product_style(product_style_id , style_name , description) values(29,'Fitted Sleeve','');
insert into product_style(product_style_id , style_name , description) values(30,'Bishop','');
insert into product_style(product_style_id , style_name , description) values(31,'Slit Sleeve','');
insert into product_style(product_style_id , style_name , description) values(32,'Drape Sleeve','');
insert into product_style(product_style_id , style_name , description) values(33,'Ruffle','');
insert into product_style(product_style_id , style_name , description) values(34,'Belted','');
insert into product_style(product_style_id , style_name , description) values(35,'Button Down','');
insert into product_style(product_style_id , style_name , description) values(36,'Wrap','');
insert into product_style(product_style_id , style_name , description) values(37,'Pussy Bow','');
insert into product_style(product_style_id , style_name , description) values(38,'Crop','');
insert into product_style(product_style_id , style_name , description) values(39,'Wrap Bust','');
insert into product_style(product_style_id , style_name , description) values(40,'Stripes','');
insert into product_style(product_style_id , style_name , description) values(41,'Bust Pocket','');
insert into product_style(product_style_id , style_name , description) values(42,'Trapeze','');
insert into product_style(product_style_id , style_name , description) values(43,'Peplum','');
insert into product_style(product_style_id , style_name , description) values(44,'Fitted T','');
insert into product_style(product_style_id , style_name , description) values(45,'Fitted','');
insert into product_style(product_style_id , style_name , description) values(46,'Fitted Warp','');
insert into product_style(product_style_id , style_name , description) values(47,'Swing','');
insert into product_style(product_style_id , style_name , description) values(48,'Draping','');
insert into product_style(product_style_id , style_name , description) values(49,'Tunic','');
insert into product_style(product_style_id , style_name , description) values(50,'Structured','');
insert into product_style(product_style_id , style_name , description) values(51,'Straight','');
insert into product_style(product_style_id , style_name , description) values(52,'double-breasted','');
insert into product_style(product_style_id , style_name , description) values(53,'Cropped Denim','');
insert into product_style(product_style_id , style_name , description) values(54,'Cropped Bomber','');
insert into product_style(product_style_id , style_name , description) values(55,'Long Blazer','');
insert into product_style(product_style_id , style_name , description) values(56,'Long Shearling','');
insert into product_style(product_style_id , style_name , description) values(57,'Wrap Cardigan','');
insert into product_style(product_style_id , style_name , description) values(58,'Waterfall','');
insert into product_style(product_style_id , style_name , description) values(59,'Hip Details','');
insert into product_style(product_style_id , style_name , description) values(60,'Cutaway','');
insert into product_style(product_style_id , style_name , description) values(61,'Short','');
insert into product_style(product_style_id , style_name , description) values(62,'Belted Cardigan','');
insert into product_style(product_style_id , style_name , description) values(63,'Empire','');
insert into product_style(product_style_id , style_name , description) values(64,'Cardigan','');
insert into product_style(product_style_id , style_name , description) values(65,'Trench','');
insert into product_style(product_style_id , style_name , description) values(66,'Peacoat','');
insert into product_style(product_style_id , style_name , description) values(67,'Duster','');
insert into product_style(product_style_id , style_name , description) values(68,'Straight Cut','');
insert into product_style(product_style_id , style_name , description) values(69,'Empire Line','');
insert into product_style(product_style_id , style_name , description) values(70,'Princess','');
insert into product_style(product_style_id , style_name , description) values(71,'A-line','');
insert into product_style(product_style_id , style_name , description) values(72,'Cocoon','');
insert into product_style(product_style_id , style_name , description) values(73,'Coachman','');
insert into product_style(product_style_id , style_name , description) values(74,'Turn-up','');
insert into product_style(product_style_id , style_name , description) values(75,'Cargo','');
insert into product_style(product_style_id , style_name , description) values(76,'Bootcut','');
insert into product_style(product_style_id , style_name , description) values(77,'wide','');
insert into product_style(product_style_id , style_name , description) values(78,'Harem','');
insert into product_style(product_style_id , style_name , description) values(79,'Flared','');
insert into product_style(product_style_id , style_name , description) values(80,'High-rise','');
insert into product_style(product_style_id , style_name , description) values(81,'Culottes','');
insert into product_style(product_style_id , style_name , description) values(82,'Palazzo','');
insert into product_style(product_style_id , style_name , description) values(83,'Slim','');
insert into product_style(product_style_id , style_name , description) values(84,'Top-entry','');
insert into product_style(product_style_id , style_name , description) values(85,'Flowy','');
insert into product_style(product_style_id , style_name , description) values(86,'Skinny','');
insert into product_style(product_style_id , style_name , description) values(87,'Flare','');
insert into product_style(product_style_id , style_name , description) values(88,'Baggy','');
insert into product_style(product_style_id , style_name , description) values(89,'Boyfriend','');
insert into product_style(product_style_id , style_name , description) values(90,'Bubble','');
insert into product_style(product_style_id , style_name , description) values(91,'Full','');
insert into product_style(product_style_id , style_name , description) values(92,'Layered','');
insert into product_style(product_style_id , style_name , description) values(93,'Pencil','');
insert into product_style(product_style_id , style_name , description) values(94,'Tulip','');
insert into product_style(product_style_id , style_name , description) values(95,'Panelled','');
insert into product_style(product_style_id , style_name , description) values(96,'Bias','');
insert into product_style(product_style_id , style_name , description) values(97,'Box pleated','');
insert into product_style(product_style_id , style_name , description) values(98,'Gored','');
insert into product_style(product_style_id , style_name , description) values(99,'Flip','');
insert into product_style(product_style_id , style_name , description) values(100,'Asymmetric','');
insert into product_style(product_style_id , style_name , description) values(101,'Trumpet','');
insert into product_style(product_style_id , style_name , description) values(102,'Shift','');
insert into product_style(product_style_id , style_name , description) values(103,'Princess Seams','');
insert into product_style(product_style_id , style_name , description) values(104,'X-Line','');
insert into product_style(product_style_id , style_name , description) values(105,'Panelled Waist','');
insert into product_style(product_style_id , style_name , description) values(106,'Nippped Waist','');
insert into product_style(product_style_id , style_name , description) values(107,'Pleated','');
insert into product_style(product_style_id , style_name , description) values(108,'Loose','');
insert into product_style(product_style_id , style_name , description) values(109,'Patterned','');
insert into product_style(product_style_id , style_name , description) values(110,'waist-embelishment','');
insert into product_style(product_style_id , style_name , description) values(111,'Wide-leg','');
insert into product_style(product_style_id , style_name , description) values(112,'Tapered','');
insert into product_style(product_style_id , style_name , description) values(113,'Waistband','');
insert into product_style(product_style_id , style_name , description) values(114,'High-waisted','');
insert into product_style(product_style_id , style_name , description) values(115,'Drawstring','');
insert into product_style(product_style_id , style_name , description) values(116,'Strapless','');
insert into product_style(product_style_id , style_name , description) values(117,'Wide Leg','');
insert into product_style(product_style_id , style_name , description) values(118,'Two-color','');
insert into product_style(product_style_id , style_name , description) values(119,'Deep V Neck','');
insert into product_style(product_style_id , style_name , description) values(120,'Belted & Straight','');
insert into product_style(product_style_id , style_name , description) values(121,'Waist details','');
insert into product_style(product_style_id , style_name , description) values(122,'Vertical Stripes','');
insert into product_style(product_style_id , style_name , description) values(123,'Pleated Flare','');


CREATE TABLE IF NOT EXISTS `projectdata225`.`body_type` (
  `body_type_id` INT NOT NULL AUTO_INCREMENT,
  `body_type_name` VARCHAR(100) NOT NULL,
  `type_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`body_type_id`))
COMMENT = 'indicator for body trypes in the system';

insert into body_type(body_type_id, body_type_name, type_code) values(1,'hourglass','HRG');
insert into body_type(body_type_id, body_type_name, type_code) values(2,'bottomhourglass','BHG');
insert into body_type(body_type_id, body_type_name, type_code) values(3,'tophourglass','THG');
insert into body_type(body_type_id, body_type_name, type_code) values(4,'triangle','TRN');
insert into body_type(body_type_id, body_type_name, type_code) values(5,'round','RND');
insert into body_type(body_type_id, body_type_name, type_code) values(6,'invertedtriangle','ITRG');
insert into body_type(body_type_id, body_type_name, type_code) values(7,'rectangle','RCT');


CREATE TABLE `body_style_map` (
  `product_style_id` int DEFAULT NULL,
  `body_type_id` int DEFAULT NULL,
  PRIMARY KEY (`product_style_id`,`body_type_id`),
  UNIQUE KEY `UQ_INDX_TYPE_STYLE_ID` (`product_style_id`,`body_type_id`) /*!80000 INVISIBLE */,
  KEY `FK_BTM_BODY_TYPE_ID_idx` (`body_type_id`),
  KEY `FK_BTM_PRODUCT_STYLE_ID_idx` (`product_style_id`),
  CONSTRAINT `FK_BTM_BODY_TYPE_ID` FOREIGN KEY (`body_type_id`) REFERENCES `body_type` (`body_type_id`),
  CONSTRAINT `FK_BTM_PRODUCT_STYLE_ID` FOREIGN KEY (`product_style_id`) REFERENCES `product_style` (`product_style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


insert into body_style_map(product_style_id , body_type_id) values(1,1);
insert into body_style_map(product_style_id , body_type_id) values(3,1);
insert into body_style_map(product_style_id , body_type_id) values(4,1);
insert into body_style_map(product_style_id , body_type_id) values(5,1);
insert into body_style_map(product_style_id , body_type_id) values(6,1);
insert into body_style_map(product_style_id , body_type_id) values(26,1);
insert into body_style_map(product_style_id , body_type_id) values(27,1);
insert into body_style_map(product_style_id , body_type_id) values(28,1);
insert into body_style_map(product_style_id , body_type_id) values(29,1);
insert into body_style_map(product_style_id , body_type_id) values(30,1);
insert into body_style_map(product_style_id , body_type_id) values(1,2);
insert into body_style_map(product_style_id , body_type_id) values(2,2);
insert into body_style_map(product_style_id , body_type_id) values(3,2);
insert into body_style_map(product_style_id , body_type_id) values(4,2);
insert into body_style_map(product_style_id , body_type_id) values(5,2);
insert into body_style_map(product_style_id , body_type_id) values(6,2);
insert into body_style_map(product_style_id , body_type_id) values(7,2);
insert into body_style_map(product_style_id , body_type_id) values(8,2);
insert into body_style_map(product_style_id , body_type_id) values(14,2);
insert into body_style_map(product_style_id , body_type_id) values(15,2);
insert into body_style_map(product_style_id , body_type_id) values(18,2);
insert into body_style_map(product_style_id , body_type_id) values(19,2);
insert into body_style_map(product_style_id , body_type_id) values(20,2);
insert into body_style_map(product_style_id , body_type_id) values(26,2);
insert into body_style_map(product_style_id , body_type_id) values(27,2);
insert into body_style_map(product_style_id , body_type_id) values(28,2);
insert into body_style_map(product_style_id , body_type_id) values(29,2);
insert into body_style_map(product_style_id , body_type_id) values(30,2);
insert into body_style_map(product_style_id , body_type_id) values(1,3);
insert into body_style_map(product_style_id , body_type_id) values(3,3);
insert into body_style_map(product_style_id , body_type_id) values(4,3);
insert into body_style_map(product_style_id , body_type_id) values(5,3);
insert into body_style_map(product_style_id , body_type_id) values(6,3);
insert into body_style_map(product_style_id , body_type_id) values(9,3);
insert into body_style_map(product_style_id , body_type_id) values(10,3);
insert into body_style_map(product_style_id , body_type_id) values(11,3);
insert into body_style_map(product_style_id , body_type_id) values(12,3);
insert into body_style_map(product_style_id , body_type_id) values(21,3);
insert into body_style_map(product_style_id , body_type_id) values(22,3);
insert into body_style_map(product_style_id , body_type_id) values(23,3);
insert into body_style_map(product_style_id , body_type_id) values(24,3);
insert into body_style_map(product_style_id , body_type_id) values(25,3);
insert into body_style_map(product_style_id , body_type_id) values(26,3);
insert into body_style_map(product_style_id , body_type_id) values(27,3);
insert into body_style_map(product_style_id , body_type_id) values(28,3);
insert into body_style_map(product_style_id , body_type_id) values(29,3);
insert into body_style_map(product_style_id , body_type_id) values(30,3);
insert into body_style_map(product_style_id , body_type_id) values(1,4);
insert into body_style_map(product_style_id , body_type_id) values(2,4);
insert into body_style_map(product_style_id , body_type_id) values(6,4);
insert into body_style_map(product_style_id , body_type_id) values(23,6);
insert into body_style_map(product_style_id , body_type_id) values(24,6);
insert into body_style_map(product_style_id , body_type_id) values(25,6);
insert into body_style_map(product_style_id , body_type_id) values(1,7);
insert into body_style_map(product_style_id , body_type_id) values(2,7);
insert into body_style_map(product_style_id , body_type_id) values(3,7);
insert into body_style_map(product_style_id , body_type_id) values(4,7);
insert into body_style_map(product_style_id , body_type_id) values(5,7);
insert into body_style_map(product_style_id , body_type_id) values(13,7);
insert into body_style_map(product_style_id , body_type_id) values(14,7);
insert into body_style_map(product_style_id , body_type_id) values(15,7);
insert into body_style_map(product_style_id , body_type_id) values(16,7);
insert into body_style_map(product_style_id , body_type_id) values(17,7);
insert into body_style_map(product_style_id , body_type_id) values(34,1);
insert into body_style_map(product_style_id , body_type_id) values(43,1);
insert into body_style_map(product_style_id , body_type_id) values(44,1);
insert into body_style_map(product_style_id , body_type_id) values(46,1);
insert into body_style_map(product_style_id , body_type_id) values(33,2);
insert into body_style_map(product_style_id , body_type_id) values(38,2);
insert into body_style_map(product_style_id , body_type_id) values(39,2);
insert into body_style_map(product_style_id , body_type_id) values(40,2);
insert into body_style_map(product_style_id , body_type_id) values(41,2);
insert into body_style_map(product_style_id , body_type_id) values(43,2);
insert into body_style_map(product_style_id , body_type_id) values(44,2);
insert into body_style_map(product_style_id , body_type_id) values(46,2);
insert into body_style_map(product_style_id , body_type_id) values(43,3);
insert into body_style_map(product_style_id , body_type_id) values(44,3);
insert into body_style_map(product_style_id , body_type_id) values(46,3);
insert into body_style_map(product_style_id , body_type_id) values(33,4);
insert into body_style_map(product_style_id , body_type_id) values(38,4);
insert into body_style_map(product_style_id , body_type_id) values(39,4);
insert into body_style_map(product_style_id , body_type_id) values(40,4);
insert into body_style_map(product_style_id , body_type_id) values(41,4);
insert into body_style_map(product_style_id , body_type_id) values(36,5);
insert into body_style_map(product_style_id , body_type_id) values(42,5);
insert into body_style_map(product_style_id , body_type_id) values(47,5);
insert into body_style_map(product_style_id , body_type_id) values(48,5);
insert into body_style_map(product_style_id , body_type_id) values(49,5);
insert into body_style_map(product_style_id , body_type_id) values(36,6);
insert into body_style_map(product_style_id , body_type_id) values(43,6);
insert into body_style_map(product_style_id , body_type_id) values(44,6);
insert into body_style_map(product_style_id , body_type_id) values(45,6);
insert into body_style_map(product_style_id , body_type_id) values(33,7);
insert into body_style_map(product_style_id , body_type_id) values(35,7);
insert into body_style_map(product_style_id , body_type_id) values(37,7);
insert into body_style_map(product_style_id , body_type_id) values(61,1);
insert into body_style_map(product_style_id , body_type_id) values(45,1);
insert into body_style_map(product_style_id , body_type_id) values(62,1);
insert into body_style_map(product_style_id , body_type_id) values(34,2);
insert into body_style_map(product_style_id , body_type_id) values(53,2);
insert into body_style_map(product_style_id , body_type_id) values(42,2);
insert into body_style_map(product_style_id , body_type_id) values(54,2);
insert into body_style_map(product_style_id , body_type_id) values(55,2);
insert into body_style_map(product_style_id , body_type_id) values(56,2);
insert into body_style_map(product_style_id , body_type_id) values(61,2);
insert into body_style_map(product_style_id , body_type_id) values(45,2);
insert into body_style_map(product_style_id , body_type_id) values(62,2);
insert into body_style_map(product_style_id , body_type_id) values(34,3);
insert into body_style_map(product_style_id , body_type_id) values(57,3);
insert into body_style_map(product_style_id , body_type_id) values(58,3);
insert into body_style_map(product_style_id , body_type_id) values(59,3);
insert into body_style_map(product_style_id , body_type_id) values(60,3);
insert into body_style_map(product_style_id , body_type_id) values(61,3);
insert into body_style_map(product_style_id , body_type_id) values(45,3);
insert into body_style_map(product_style_id , body_type_id) values(62,3);
insert into body_style_map(product_style_id , body_type_id) values(53,4);
insert into body_style_map(product_style_id , body_type_id) values(42,4);
insert into body_style_map(product_style_id , body_type_id) values(54,4);
insert into body_style_map(product_style_id , body_type_id) values(55,4);
insert into body_style_map(product_style_id , body_type_id) values(56,4);
insert into body_style_map(product_style_id , body_type_id) values(51,5);
insert into body_style_map(product_style_id , body_type_id) values(58,5);
insert into body_style_map(product_style_id , body_type_id) values(45,5);
insert into body_style_map(product_style_id , body_type_id) values(64,5);
insert into body_style_map(product_style_id , body_type_id) values(34,6);
insert into body_style_map(product_style_id , body_type_id) values(57,6);
insert into body_style_map(product_style_id , body_type_id) values(58,6);
insert into body_style_map(product_style_id , body_type_id) values(59,6);
insert into body_style_map(product_style_id , body_type_id) values(60,6);
insert into body_style_map(product_style_id , body_type_id) values(43,7);
insert into body_style_map(product_style_id , body_type_id) values(50,7);
insert into body_style_map(product_style_id , body_type_id) values(34,7);
insert into body_style_map(product_style_id , body_type_id) values(51,7);
insert into body_style_map(product_style_id , body_type_id) values(52,7);
insert into body_style_map(product_style_id , body_type_id) values(65,1);
insert into body_style_map(product_style_id , body_type_id) values(36,1);
insert into body_style_map(product_style_id , body_type_id) values(70,1);
insert into body_style_map(product_style_id , body_type_id) values(71,1);
insert into body_style_map(product_style_id , body_type_id) values(73,1);
insert into body_style_map(product_style_id , body_type_id) values(65,2);
insert into body_style_map(product_style_id , body_type_id) values(36,2);
insert into body_style_map(product_style_id , body_type_id) values(69,2);
insert into body_style_map(product_style_id , body_type_id) values(70,2);
insert into body_style_map(product_style_id , body_type_id) values(71,2);
insert into body_style_map(product_style_id , body_type_id) values(73,2);
insert into body_style_map(product_style_id , body_type_id) values(65,3);
insert into body_style_map(product_style_id , body_type_id) values(36,3);
insert into body_style_map(product_style_id , body_type_id) values(70,3);
insert into body_style_map(product_style_id , body_type_id) values(71,3);
insert into body_style_map(product_style_id , body_type_id) values(72,3);
insert into body_style_map(product_style_id , body_type_id) values(42,3);
insert into body_style_map(product_style_id , body_type_id) values(73,3);
insert into body_style_map(product_style_id , body_type_id) values(65,4);
insert into body_style_map(product_style_id , body_type_id) values(36,4);
insert into body_style_map(product_style_id , body_type_id) values(69,4);
insert into body_style_map(product_style_id , body_type_id) values(70,4);
insert into body_style_map(product_style_id , body_type_id) values(71,4);
insert into body_style_map(product_style_id , body_type_id) values(65,5);
insert into body_style_map(product_style_id , body_type_id) values(68,5);
insert into body_style_map(product_style_id , body_type_id) values(71,5);
insert into body_style_map(product_style_id , body_type_id) values(60,5);
insert into body_style_map(product_style_id , body_type_id) values(63,5);
insert into body_style_map(product_style_id , body_type_id) values(65,6);
insert into body_style_map(product_style_id , body_type_id) values(70,6);
insert into body_style_map(product_style_id , body_type_id) values(71,6);
insert into body_style_map(product_style_id , body_type_id) values(72,6);
insert into body_style_map(product_style_id , body_type_id) values(42,6);
insert into body_style_map(product_style_id , body_type_id) values(65,7);
insert into body_style_map(product_style_id , body_type_id) values(66,7);
insert into body_style_map(product_style_id , body_type_id) values(36,7);
insert into body_style_map(product_style_id , body_type_id) values(67,7);
insert into body_style_map(product_style_id , body_type_id) values(68,7);
insert into body_style_map(product_style_id , body_type_id) values(84,1);
insert into body_style_map(product_style_id , body_type_id) values(76,2);
insert into body_style_map(product_style_id , body_type_id) values(79,2);
insert into body_style_map(product_style_id , body_type_id) values(84,2);
insert into body_style_map(product_style_id , body_type_id) values(74,3);
insert into body_style_map(product_style_id , body_type_id) values(78,3);
insert into body_style_map(product_style_id , body_type_id) values(79,3);
insert into body_style_map(product_style_id , body_type_id) values(81,3);
insert into body_style_map(product_style_id , body_type_id) values(82,3);
insert into body_style_map(product_style_id , body_type_id) values(84,3);
insert into body_style_map(product_style_id , body_type_id) values(76,4);
insert into body_style_map(product_style_id , body_type_id) values(79,4);
insert into body_style_map(product_style_id , body_type_id) values(80,4);
insert into body_style_map(product_style_id , body_type_id) values(75,5);
insert into body_style_map(product_style_id , body_type_id) values(76,5);
insert into body_style_map(product_style_id , body_type_id) values(77,5);
insert into body_style_map(product_style_id , body_type_id) values(79,5);
insert into body_style_map(product_style_id , body_type_id) values(85,5);
insert into body_style_map(product_style_id , body_type_id) values(74,6);
insert into body_style_map(product_style_id , body_type_id) values(78,6);
insert into body_style_map(product_style_id , body_type_id) values(79,6);
insert into body_style_map(product_style_id , body_type_id) values(81,6);
insert into body_style_map(product_style_id , body_type_id) values(82,6);
insert into body_style_map(product_style_id , body_type_id) values(74,7);
insert into body_style_map(product_style_id , body_type_id) values(75,7);
insert into body_style_map(product_style_id , body_type_id) values(76,7);
insert into body_style_map(product_style_id , body_type_id) values(77,7);
insert into body_style_map(product_style_id , body_type_id) values(78,7);
insert into body_style_map(product_style_id , body_type_id) values(83,1);
insert into body_style_map(product_style_id , body_type_id) values(51,1);
insert into body_style_map(product_style_id , body_type_id) values(76,1);
insert into body_style_map(product_style_id , body_type_id) values(77,1);
insert into body_style_map(product_style_id , body_type_id) values(87,1);
insert into body_style_map(product_style_id , body_type_id) values(83,2);
insert into body_style_map(product_style_id , body_type_id) values(51,2);
insert into body_style_map(product_style_id , body_type_id) values(77,2);
insert into body_style_map(product_style_id , body_type_id) values(87,2);
insert into body_style_map(product_style_id , body_type_id) values(80,2);
insert into body_style_map(product_style_id , body_type_id) values(83,3);
insert into body_style_map(product_style_id , body_type_id) values(51,3);
insert into body_style_map(product_style_id , body_type_id) values(76,3);
insert into body_style_map(product_style_id , body_type_id) values(77,3);
insert into body_style_map(product_style_id , body_type_id) values(87,3);
insert into body_style_map(product_style_id , body_type_id) values(88,3);
insert into body_style_map(product_style_id , body_type_id) values(89,3);
insert into body_style_map(product_style_id , body_type_id) values(51,4);
insert into body_style_map(product_style_id , body_type_id) values(77,4);
insert into body_style_map(product_style_id , body_type_id) values(87,4);
insert into body_style_map(product_style_id , body_type_id) values(87,5);
insert into body_style_map(product_style_id , body_type_id) values(89,5);
insert into body_style_map(product_style_id , body_type_id) values(76,6);
insert into body_style_map(product_style_id , body_type_id) values(77,6);
insert into body_style_map(product_style_id , body_type_id) values(87,6);
insert into body_style_map(product_style_id , body_type_id) values(88,6);
insert into body_style_map(product_style_id , body_type_id) values(89,6);
insert into body_style_map(product_style_id , body_type_id) values(86,7);
insert into body_style_map(product_style_id , body_type_id) values(83,7);
insert into body_style_map(product_style_id , body_type_id) values(91,1);
insert into body_style_map(product_style_id , body_type_id) values(93,1);
insert into body_style_map(product_style_id , body_type_id) values(94,1);
insert into body_style_map(product_style_id , body_type_id) values(98,1);
insert into body_style_map(product_style_id , body_type_id) values(91,2);
insert into body_style_map(product_style_id , body_type_id) values(93,2);
insert into body_style_map(product_style_id , body_type_id) values(94,2);
insert into body_style_map(product_style_id , body_type_id) values(95,2);
insert into body_style_map(product_style_id , body_type_id) values(96,2);
insert into body_style_map(product_style_id , body_type_id) values(98,2);
insert into body_style_map(product_style_id , body_type_id) values(91,3);
insert into body_style_map(product_style_id , body_type_id) values(92,3);
insert into body_style_map(product_style_id , body_type_id) values(93,3);
insert into body_style_map(product_style_id , body_type_id) values(94,3);
insert into body_style_map(product_style_id , body_type_id) values(96,3);
insert into body_style_map(product_style_id , body_type_id) values(97,3);
insert into body_style_map(product_style_id , body_type_id) values(98,3);
insert into body_style_map(product_style_id , body_type_id) values(91,4);
insert into body_style_map(product_style_id , body_type_id) values(94,4);
insert into body_style_map(product_style_id , body_type_id) values(95,4);
insert into body_style_map(product_style_id , body_type_id) values(96,4);
insert into body_style_map(product_style_id , body_type_id) values(96,5);
insert into body_style_map(product_style_id , body_type_id) values(99,5);
insert into body_style_map(product_style_id , body_type_id) values(100,5);
insert into body_style_map(product_style_id , body_type_id) values(101,5);
insert into body_style_map(product_style_id , body_type_id) values(92,6);
insert into body_style_map(product_style_id , body_type_id) values(94,6);
insert into body_style_map(product_style_id , body_type_id) values(96,6);
insert into body_style_map(product_style_id , body_type_id) values(97,6);
insert into body_style_map(product_style_id , body_type_id) values(90,7);
insert into body_style_map(product_style_id , body_type_id) values(91,7);
insert into body_style_map(product_style_id , body_type_id) values(92,7);
insert into body_style_map(product_style_id , body_type_id) values(93,7);
insert into body_style_map(product_style_id , body_type_id) values(102,1);
insert into body_style_map(product_style_id , body_type_id) values(105,1);
insert into body_style_map(product_style_id , body_type_id) values(96,1);
insert into body_style_map(product_style_id , body_type_id) values(102,2);
insert into body_style_map(product_style_id , body_type_id) values(63,2);
insert into body_style_map(product_style_id , body_type_id) values(104,2);
insert into body_style_map(product_style_id , body_type_id) values(105,2);
insert into body_style_map(product_style_id , body_type_id) values(102,3);
insert into body_style_map(product_style_id , body_type_id) values(105,3);
insert into body_style_map(product_style_id , body_type_id) values(106,3);
insert into body_style_map(product_style_id , body_type_id) values(107,3);
insert into body_style_map(product_style_id , body_type_id) values(63,4);
insert into body_style_map(product_style_id , body_type_id) values(104,4);
insert into body_style_map(product_style_id , body_type_id) values(102,5);
insert into body_style_map(product_style_id , body_type_id) values(102,6);
insert into body_style_map(product_style_id , body_type_id) values(105,6);
insert into body_style_map(product_style_id , body_type_id) values(106,6);
insert into body_style_map(product_style_id , body_type_id) values(107,6);
insert into body_style_map(product_style_id , body_type_id) values(102,7);
insert into body_style_map(product_style_id , body_type_id) values(63,7);
insert into body_style_map(product_style_id , body_type_id) values(103,7);
insert into body_style_map(product_style_id , body_type_id) values(104,7);
insert into body_style_map(product_style_id , body_type_id) values(108,1);
insert into body_style_map(product_style_id , body_type_id) values(79,1);
insert into body_style_map(product_style_id , body_type_id) values(50,1);
insert into body_style_map(product_style_id , body_type_id) values(112,1);
insert into body_style_map(product_style_id , body_type_id) values(113,1);
insert into body_style_map(product_style_id , body_type_id) values(108,2);
insert into body_style_map(product_style_id , body_type_id) values(110,2);
insert into body_style_map(product_style_id , body_type_id) values(50,2);
insert into body_style_map(product_style_id , body_type_id) values(112,2);
insert into body_style_map(product_style_id , body_type_id) values(113,2);
insert into body_style_map(product_style_id , body_type_id) values(108,3);
insert into body_style_map(product_style_id , body_type_id) values(109,3);
insert into body_style_map(product_style_id , body_type_id) values(111,3);
insert into body_style_map(product_style_id , body_type_id) values(50,3);
insert into body_style_map(product_style_id , body_type_id) values(112,3);
insert into body_style_map(product_style_id , body_type_id) values(113,3);
insert into body_style_map(product_style_id , body_type_id) values(110,4);
insert into body_style_map(product_style_id , body_type_id) values(111,5);
insert into body_style_map(product_style_id , body_type_id) values(114,5);
insert into body_style_map(product_style_id , body_type_id) values(109,6);
insert into body_style_map(product_style_id , body_type_id) values(111,6);
insert into body_style_map(product_style_id , body_type_id) values(50,6);
insert into body_style_map(product_style_id , body_type_id) values(108,7);
insert into body_style_map(product_style_id , body_type_id) values(109,7);
insert into body_style_map(product_style_id , body_type_id) values(79,7);
insert into body_style_map(product_style_id , body_type_id) values(116,1);
insert into body_style_map(product_style_id , body_type_id) values(117,1);
insert into body_style_map(product_style_id , body_type_id) values(120,1);
insert into body_style_map(product_style_id , body_type_id) values(121,1);
insert into body_style_map(product_style_id , body_type_id) values(116,2);
insert into body_style_map(product_style_id , body_type_id) values(100,2);
insert into body_style_map(product_style_id , body_type_id) values(117,2);
insert into body_style_map(product_style_id , body_type_id) values(81,2);
insert into body_style_map(product_style_id , body_type_id) values(118,2);
insert into body_style_map(product_style_id , body_type_id) values(120,2);
insert into body_style_map(product_style_id , body_type_id) values(121,2);
insert into body_style_map(product_style_id , body_type_id) values(116,3);
insert into body_style_map(product_style_id , body_type_id) values(117,3);
insert into body_style_map(product_style_id , body_type_id) values(118,3);
insert into body_style_map(product_style_id , body_type_id) values(119,3);
insert into body_style_map(product_style_id , body_type_id) values(120,3);
insert into body_style_map(product_style_id , body_type_id) values(121,3);
insert into body_style_map(product_style_id , body_type_id) values(116,4);
insert into body_style_map(product_style_id , body_type_id) values(100,4);
insert into body_style_map(product_style_id , body_type_id) values(117,4);
insert into body_style_map(product_style_id , body_type_id) values(81,4);
insert into body_style_map(product_style_id , body_type_id) values(118,4);
insert into body_style_map(product_style_id , body_type_id) values(117,5);
insert into body_style_map(product_style_id , body_type_id) values(122,5);
insert into body_style_map(product_style_id , body_type_id) values(123,5);
insert into body_style_map(product_style_id , body_type_id) values(117,6);
insert into body_style_map(product_style_id , body_type_id) values(118,6);
insert into body_style_map(product_style_id , body_type_id) values(119,6);
insert into body_style_map(product_style_id , body_type_id) values(115,7);



CREATE TABLE `projectdata225`.`product_color` (
  `product_color_id` INT NOT NULL AUTO_INCREMENT,
  `color_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`product_color_id`))
COMMENT = 'Color of product';

insert into product_color (product_color_id , color_name) values(1,'Other');
insert into product_color (product_color_id , color_name) values(2,'Transparent');
insert into product_color (product_color_id , color_name) values(3,'Silver');
insert into product_color (product_color_id , color_name) values(4,'Bronze/Copper');
insert into product_color (product_color_id , color_name) values(5,'Gold');
insert into product_color (product_color_id , color_name) values(6,'Light Grey');
insert into product_color (product_color_id , color_name) values(7,'Grey');
insert into product_color (product_color_id , color_name) values(8,'Dark Grey');
insert into product_color (product_color_id , color_name) values(9,'Black');
insert into product_color (product_color_id , color_name) values(10,'White');
insert into product_color (product_color_id , color_name) values(11,'Off White');
insert into product_color (product_color_id , color_name) values(12,'Light Beige');
insert into product_color (product_color_id , color_name) values(13,'Beige');
insert into product_color (product_color_id , color_name) values(14,'Dark Beige');
insert into product_color (product_color_id , color_name) values(15,'Greyish Beige');
insert into product_color (product_color_id , color_name) values(17,'Yellowish Brown');
insert into product_color (product_color_id , color_name) values(19,'Greenish Khaki');
insert into product_color (product_color_id , color_name) values(20,'Other Yellow');
insert into product_color (product_color_id , color_name) values(21,'Light Yellow');
insert into product_color (product_color_id , color_name) values(22,'Yellow');
insert into product_color (product_color_id , color_name) values(23,'Dark Yellow');
insert into product_color (product_color_id , color_name) values(30,'Other Orange');
insert into product_color (product_color_id , color_name) values(31,'Light Orange');
insert into product_color (product_color_id , color_name) values(32,'Orange');
insert into product_color (product_color_id , color_name) values(33,'Dark Orange');
insert into product_color (product_color_id , color_name) values(40,'Other Red');
insert into product_color (product_color_id , color_name) values(41,'Light Red');
insert into product_color (product_color_id , color_name) values(42,'Red');
insert into product_color (product_color_id , color_name) values(43,'Dark Red');
insert into product_color (product_color_id , color_name) values(50,'Other Pink');
insert into product_color (product_color_id , color_name) values(51,'Light Pink');
insert into product_color (product_color_id , color_name) values(52,'Pink');
insert into product_color (product_color_id , color_name) values(53,'Dark Pink');
insert into product_color (product_color_id , color_name) values(60,'Other Purple');
insert into product_color (product_color_id , color_name) values(61,'Light Purple');
insert into product_color (product_color_id , color_name) values(62,'Purple');
insert into product_color (product_color_id , color_name) values(63,'Dark Purple');
insert into product_color (product_color_id , color_name) values(70,'Other Blue');
insert into product_color (product_color_id , color_name) values(71,'Light Blue');
insert into product_color (product_color_id , color_name) values(72,'Blue');
insert into product_color (product_color_id , color_name) values(73,'Dark Blue');
insert into product_color (product_color_id , color_name) values(80,'Other Turquoise');
insert into product_color (product_color_id , color_name) values(81,'Light Turquoise');
insert into product_color (product_color_id , color_name) values(82,'Turquoise');
insert into product_color (product_color_id , color_name) values(83,'Dark Turquoise');
insert into product_color (product_color_id , color_name) values(90,'Other Green');
insert into product_color (product_color_id , color_name) values(91,'Light Green');
insert into product_color (product_color_id , color_name) values(92,'Green');
insert into product_color (product_color_id , color_name) values(93,'Dark Green');
insert into product_color (product_color_id , color_name) values(-1,'Unknown');


CREATE TABLE `product` (
  `product_code` int NOT NULL,
  `product_type_id` int NOT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `detail_desc` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`product_code`),
  KEY `product_type_id_idx` (`product_type_id`),
  CONSTRAINT `product_type_id` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Product '


CREATE TABLE `projectdata225`.`product_color_map` (
  `article_id` INT NOT NULL AUTO_INCREMENT,
  `product_code` INT NOT NULL,
  `product_color_id` INT NOT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `FK_PCM_PRODUCT_ID_idx` (`product_code` ASC) VISIBLE,
  INDEX `FK_PCM_PRODUCT_COLOR_ID_idx` (`product_color_id` ASC) VISIBLE,
  CONSTRAINT `FK_PCM_PRODUCT_ID`
    FOREIGN KEY (`product_code`)
    REFERENCES `projectdata225`.`product` (`product_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PCM_PRODUCT_COLOR_ID`
    FOREIGN KEY (`product_color_id`)
    REFERENCES `projectdata225`.`product_color` (`product_color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Mapping of product and color';


CREATE TABLE `projectdata225`.`product_style_map` (
  `product_style_id` INT NOT NULL,
  `product_code` INT NOT NULL,
  PRIMARY KEY (`product_style_id`, `product_code`),
  INDEX `FK_PSM_PRODUCT_CODE_idx` (`product_code` ASC) VISIBLE,
  CONSTRAINT `FK_PSM_PRODUCT_STYLE_ID`
    FOREIGN KEY (`product_style_id`)
    REFERENCES `projectdata225`.`product_style` (`product_style_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PSM_PRODUCT_CODE`
    FOREIGN KEY (`product_code`)
    REFERENCES `projectdata225`.`product` (`product_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    CREATE TABLE `projectdata225`.`customer_transaction` (
  `t_dat` DATE NULL,
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `article_id` INT NULL,
  `price` DECIMAL NULL,
  PRIMARY KEY (`customer_id`));

  CREATE TABLE `projectdata225`.`customer` (
  `customer_id` INT NOT NULL,
  `body_type_id` INT NULL,
  `gender` INT NULL,
  `age` INT NULL,
  `bust` FLOAT NULL,
  `highhip` FLOAT NULL,
  `waist` FLOAT NULL,
  `hip` FLOAT NULL,
  `bodytype` VARCHAR(50) NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `FK_CBT_BODY_TYPE_ID_idx` (`body_type_id` ASC) VISIBLE,
  CONSTRAINT `FK_CBT_BODY_TYPE_ID`
    FOREIGN KEY (`body_type_id`)
    REFERENCES `projectdata225`.`body_type` (`body_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);