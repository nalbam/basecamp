## geotag

```
miles          => 3959
nautical miles => 3444
kilometers     => 6371

37.572, 126.805

(
 3959
 *
 acos(
      cos(radians(37.572)) * cos(radians(lat)) * cos(radians(lng) - radians(126.805))
      +
      sin(radians(37.572)) * sin(radians(lat))
 )
) AS distance
```

```
SELECT no, twid, lat, lng, 
       (6371 * acos(cos(radians(37.572)) * cos(radians(lat)) * cos(radians(lng) - radians(126.805))
        + sin(radians(37.572)) * sin(radians(lat)))) AS distance
  FROM nb_spickr_img
HAVING distance < 10
 ORDER BY distance
 LIMIT 0, 20
```
```
SELECT no, twid, lat, lng,
       (6371 * acos(cos(radians('$lat')) * cos(radians(lat)) * cos(radians(lng) - radians('$lng'))
        + sin(radians('$lat')) * sin(radians(lat)))) AS distance
  FROM nb_spickr_img
HAVING distance < '$dist'
 ORDER BY distance
 LIMIT 0, 20
```

 * https://developers.google.com/maps/articles/phpsqlsearch_v3
