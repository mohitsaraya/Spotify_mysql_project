-- Beginner Level (20 Questions):
-- 1.	How many unique tracks are in the dataset? 
SELECT 
    COUNT(DISTINCT track_name) AS Tracks
FROM
    spotify_2023;

-- 2.	What is the total number of artists? 
SELECT 
    COUNT(DISTINCT artist_name) AS No_of_Artist
FROM
    spotify_2023;

-- 3.	Count the number of tracks released in each year.
SELECT 
    released_year, COUNT(track_name)
FROM
    spotify_2023
GROUP BY 1
ORDER BY 1;

-- 4.	Find the average number of streams for tracks in the dataset. 
SELECT 
    AVG(streams) AS Avg_strams
FROM
    spotify_2023;

-- 5.	List all the tracks that are in top 1 in Spotify charts. 
SELECT 
    track_name
FROM
    spotify_2023
WHERE
    in_spotify_charts = 1;

-- 6.	What is the minimum BPM among all tracks? 
SELECT 
    MIN(bpm) AS Min_beats_per_minute
FROM
    spotify_2023;

-- 7.	Find the track with the maximum streams.
SELECT 
    track_name, artist_name, streams
FROM
    spotify_2023
ORDER BY streams DESC
LIMIT 1;

-- 8.	Count the number of tracks in major mode and minor mode.
SELECT 
    mode, COUNT(track_name) AS No_of_tracks
FROM
    spotify_2023
GROUP BY mode;

-- 9.	What percentage of tracks are in Apple charts? 
SELECT 
    (COUNT(*) * 100.0 / (SELECT 
            COUNT(*)
        FROM
            spotify_2023)) AS percentage_in_apple_charts
FROM
    spotify_2023
WHERE
    in_apple_charts != 0;

-- 10.	How many tracks have an acousticness percentage greater than 50%? 
SELECT 
    COUNT(DISTINCT track_name) AS Acousitc_count
FROM
    spotify_2023
WHERE
    acousticness_perc > 50;

-- 11.	Count the tracks released in each month. 
SELECT 
    released_month,
    COUNT(DISTINCT track_name) AS Count_of_tracks
FROM
    spotify_2023
GROUP BY 1;

-- 12.	Find the track with the highest danceability percentage. 
SELECT 
    track_name, danceability_perc AS Max_danceability
FROM
    spotify_2023
GROUP BY 1 , 2
ORDER BY 2 DESC
LIMIT 1;

-- 13.	List the tracks with a valence percentage greater than 70%. 
SELECT 
    track_name
FROM
    spotify_2023
WHERE
    valence_perc > 70
ORDER BY valence_perc DESC;

-- 14.	What is the most common key for tracks? 
SELECT 
    s.key, COUNT(s.key)
FROM
    spotify_2023 AS s
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 15.	Find the average energy percentage for tracks in Deezer charts. 
SELECT 
    AVG(energy_perc) AS Energy_perc
FROM
    spotify_2023
WHERE
    in_deezer_charts != 0;

-- 16.	How many tracks are in top 1 in Shazam charts?
SELECT 
    COUNT(track_name) AS Tracks_count
FROM
    spotify_2023
WHERE
    in_shazam_charts = 1;

-- 17.	Identify the track with the lowest liveness percentage.
SELECT 
    MIN(liveness_perc)
FROM
    spotify_2023;-- to get lowest liveness value

SELECT 
    track_name, liveness_perc
FROM
    spotify_2023
WHERE
    liveness_perc = 3;

-- 18.	What is the median speechiness percentage of all tracks? 

SELECT speechiness_perc AS median
FROM (
    SELECT speechiness_perc, ROW_NUMBER() OVER (ORDER BY speechiness_perc) AS row_num
    FROM spotify_2023
) ranked
WHERE row_num = (SELECT FLOOR((COUNT(*) + 1) / 2) FROM spotify_2023);


-- 19.	Count the number of tracks in Spotify playlists but not in Apple playlists. 
SELECT 
    COUNT(track_name) AS Tracks_in_spotify_not_in_apple
FROM
    spotify_2023
WHERE
    in_spotify_charts != 0
        AND in_apple_charts = 0;

-- 20.	Find the most frequent release day of the week for tracks. 
SELECT 
    DAYNAME(STR_TO_DATE(CONCAT(released_year,
                            '-',
                            released_month,
                            '-',
                            released_day),
                    '%Y-%m-%d')) AS release_day,
    COUNT(*) AS occurrences
FROM
    spotify_2023
GROUP BY release_day
ORDER BY occurrences DESC
LIMIT 1;


