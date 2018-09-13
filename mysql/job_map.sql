CREATE DATABASE `job_map`;

USE `job_map`;

CREATE TABLE IF NOT EXISTS `users` (
    `id` SMALLINT(5) UNSIGNED AUTO_INCREMENT,
    `user_pictures` VARCHAR(45) NOT NULL UNIQUE,
    `username` VARCHAR(50) NOT NULL UNIQUE DEFAULT 'anonymous',
    `email_address` VARCHAR(50) NOT NULL UNIQUE DEFAULT 'anonymous@email.com',
    `password` VARCHAR(50) NOT NULL DEFAULT 'secret',
    `hash_key` VARCHAR(64) NOT NULL UNIQUE,
    `born_place` VARCHAR(50) NOT NULL DEFAULT 'Unknown Place',
    `birthday` DATE NOT NULL DEFAULT '1970-01-01',
    `home_address` VARCHAR(50) NOT NULL DEFAULT 'Unknown Address',
    `living_address` VARCHAR(50) NOT NULL DEFAULT 'Unknown Address',
    `phone_number` VARCHAR(21) NOT NULL DEFAULT 'Unknown Phone Number',
    `social_media_account_links` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `website_address` VARCHAR(50) NOT NULL DEFAULT 'http://www.unknown.website.address.com',
    `gender` ENUM('Male', 'Female') NOT NULL DEFAULT 'Male',
    `status` ENUM('Single', 'Married', 'Widow', 'Widower') NOT NULL DEFAULT 'Single',
    `height_in_cm` TINYINT(200) UNSIGNED NOT NULL DEFAULT 150,
    `weight_in_kg` TINYINT(100) UNSIGNED NOT NULL DEFAULT 40,
    `nationality` VARCHAR(50) NOT NULL DEFAULT 'Unknown Nationality',
    `languages` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `religion` ENUM('Islam', 'Protestanism', 'Catholic', 'Hindu', 'Buddha', 'Konghucu') NOT NULL DEFAULT 'Islam',
    `formal_education` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `non_formal_education` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `hobbies` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `specialities` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `work_experiences` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `organization_history` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `certifications` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `achievements` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `created_date` DATE NOT NULL DEFAULT '1970-01-01',
    `created_time` TIME NOT NULL DEFAULT '00:00:00',
    `updated_date` DATE NOT NULL DEFAULT '1970-01-01',
    `updated_time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`id`)
    ) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `companies` (
    `id` SMALLINT(5) UNSIGNED AUTO_INCREMENT,
    `company_logo` VARCHAR(47) NOT NULL UNIQUE,
    `name` VARCHAR(50) NOT NULL DEFAULT 'Unknown Company',
    `birthday` DATE NOT NULL DEFAULT '1970-01-01',
    `address` VARCHAR(50) NOT NULL DEFAULT 'Unknown Address',
    `phone_number` VARCHAR(21) NOT NULL DEFAULT 'Unknown Phone Number',
    `email_address` VARCHAR(50) NOT NULL DEFAULT 'unknown.company@email.com',
    `social_media_account_links` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `website_address` VARCHAR(50) NOT NULL DEFAULT 'http://www.unknown.website.address.com',
    `introduction` VARCHAR(9000) NOT NULL DEFAULT 'None',
    `visions` VARCHAR(9000) NOT NULL DEFAULT '["None"]',
    `missions` VARCHAR(9000) NOT NULL DEFAULT '["None"]',
    `policy` VARCHAR(9000) NOT NULL DEFAULT '["None"]',
    `product_or_service_description` VARCHAR(9000) NOT NULL DEFAULT 'None',
    `portofolio` VARCHAR(9000) NOT NULL DEFAULT 'None',
    `unique_identity` VARCHAR(9000) NOT NULL DEFAULT 'None',
    `certifications` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `achievements` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `company_owner_id` SMALLINT(5) UNSIGNED NOT NULL,
    `created_date` DATE NOT NULL DEFAULT '1970-01-01',
    `created_time` TIME NOT NULL DEFAULT '00:00:00',
    `updated_date` DATE NOT NULL DEFAULT '1970-01-01',
    `updated_time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_owner_id`) REFERENCES `users`(`id`)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `job_vacancies` (
    `id` SMALLINT(5) UNSIGNED AUTO_INCREMENT,
    `status` ENUM('Not Found', 'Found', 'Cancelled') DEFAULT 'Not Found',
    `job_type` VARCHAR(50) NOT NULL DEFAULT 'Unknown Job Type',
    `location` VARCHAR(50) NOT NULL DEFAULT 'Unknown Place',
    `title` VARCHAR(50) NOT NULL DEFAULT 'Untitled',
    `description` VARCHAR(9000) NOT NULL DEFAULT 'None',
    `tags` VARCHAR(255) NOT NULL DEFAULT '["None"]',
    `company_id` SMALLINT(5) UNSIGNED NOT NULL,
    `created_date` DATE NOT NULL DEFAULT '1970-01-01',
    `created_time` TIME NOT NULL DEFAULT '00:00:00',
    `updated_date` DATE NOT NULL DEFAULT '1970-01-01',
    `updated_time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `job_requests` (
    `id` SMALLINT(5) UNSIGNED AUTO_INCREMENT,
    `status` ENUM('Pending', 'Accepted', 'Rejected', 'Cancelled') DEFAULT 'Pending',
    `job_type` VARCHAR(50) NOT NULL DEFAULT 'Unknown Job Type',
    `location` VARCHAR(50) NOT NULL DEFAULT 'Unknown Place',
    `title` VARCHAR(50) NOT NULL DEFAULT 'Untitled',
    `message` VARCHAR(255) NOT NULL DEFAULT 'None',
    `company_id` SMALLINT(5) UNSIGNED NOT NULL,
    `receiver_id` SMALLINT(5) UNSIGNED NOT NULL,
    `created_date` DATE NOT NULL DEFAULT '1970-01-01',
    `created_time` TIME NOT NULL DEFAULT '00:00:00',
    `updated_date` DATE NOT NULL DEFAULT '1970-01-01',
    `updated_time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
    FOREIGN KEY(`receiver_id`) REFERENCES `users`(`id`)
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS `job_submissions` (
    `id` SMALLINT(5) UNSIGNED AUTO_INCREMENT,
    `status` ENUM('Pending', 'Accepted', 'Rejected', 'Cancelled') DEFAULT 'Pending',
    `sender_id` SMALLINT(5) UNSIGNED NOT NULL,
    `job_vacancy_id` SMALLINT(5) UNSIGNED NOT NULL,
    `created_date` DATE NOT NULL DEFAULT '1970-01-01',
    `created_time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`id`),
    FOREIGN KEY(`sender_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`job_vacancy_id`) REFERENCES `job_vacancies`(`id`)
) ENGINE = INNODB;