-- Creating Schema
create database spotify_2023_analysis;

-- Using schema fro further table creation and generatng queries

use spotify_2023_analysis;

-- altering tbale name due to -

ALTER TABLE `spotify_2023_analysis`.`spotify-2023` 
RENAME TO  `spotify_2023_analysis`.`spotify_2023` ;

-- table describe
desc spotify_2023;

 SELECT 
    *
FROM		
    spotify_2023;
 
 -- altering columns name for better readability
 -- artist(s)_name			
 
ALTER TABLE `spotify_2023_analysis`.`spotify_2023` 
CHANGE COLUMN `artist(s)_name` `artist_name` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `danceability_%` `danceability_perc` INT NULL DEFAULT NULL ,
CHANGE COLUMN `valence_%` `valence_perc` INT NULL DEFAULT NULL ,
CHANGE COLUMN `energy_%` `energy_perc` INT NULL DEFAULT NULL ,
CHANGE COLUMN `acousticness_%` `acousticness_perc` INT NULL DEFAULT NULL ,
CHANGE COLUMN `instrumentalness_%` `instrumentalness_perc` INT NULL DEFAULT NULL ,
CHANGE COLUMN `liveness_%` `liveness_perc` INT NULL DEFAULT NULL ,
CHANGE COLUMN `speechiness_%` `speechiness_perc` INT NULL DEFAULT NULL ;
