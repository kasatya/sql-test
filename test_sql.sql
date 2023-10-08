CREATE TABLE `countries` (
  `id` int not null primary key AUTO_INCREMENT,
  `country_name` text not null
);
INSERT INTO `countries` (`country_name`) VALUES ('Ukraine');
INSERT INTO `countries` (`country_name`) VALUES ('Italy');
INSERT INTO `countries` (`country_name`) VALUES ('Germany');

CREATE TABLE `cities` (
  `id` int not null primary key AUTO_INCREMENT,
  `city_name` text not null,
  `country_id` int not null,
  FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`)
);
INSERT INTO `cities` (`city_name`, `country_id`) VALUES ('Kyiv', 1);
INSERT INTO `cities` (`city_name`, `country_id`) VALUES ('Lviv', 1);
INSERT INTO `cities` (`city_name`, `country_id`) VALUES ('Sorrento', 2);
INSERT INTO `cities` (`city_name`, `country_id`) VALUES ('Milan', 2);
INSERT INTO `cities` (`city_name`, `country_id`) VALUES ('Rome', 2);

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int not null primary key AUTO_INCREMENT,
  `address` text not null,
  `city_id` int not null,
  `postal_code` int,
  FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`)
);
INSERT INTO `addresses` (`address`, `city_id`, `postal_code`) VALUES ('Metalistiv 7', 1, 545454);
INSERT INTO `addresses` (`address`, `city_id`, `postal_code`) VALUES ('Chrvonopilska 50', 1, 532234);
INSERT INTO `addresses` (`address`, `city_id`, `postal_code`) VALUES ('Geroiv 100', 2, 656546);
INSERT INTO `addresses` (`address`, `city_id`, `postal_code`) VALUES ('Gellato 76', 4, 232144);

select * from addresses;
select * from cities;

select addresses.address, addresses.postal_code, cities.city_name
from addresses 
inner join cities 
on addresses.city_id=cities.id
where city_name='Kyiv'
order by address;

select addresses.address, cities.city_name, countries.country_name
from addresses 
inner join cities on addresses.city_id=cities.id
inner join countries on cities.country_id=countries.id;

select count(*), countries.country_name
from addresses
inner join cities on addresses.city_id=cities.id
inner join countries on cities.country_id=countries.id
group by country_name;