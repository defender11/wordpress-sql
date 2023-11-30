-- find all pages that templates belong to
SELECT wp_posts.ID                            AS ID,
       wp_posts.post_title                    AS `Page Name`,
       wp_postmeta.meta_value                 AS `Page Template`,
       CONCAT('site_url', wp_posts.post_name) AS `Page Link`
FROM wp_posts
         LEFT JOIN
     wp_postmeta ON (wp_posts.ID = wp_postmeta.post_id)
WHERE wp_posts.post_type = 'page'
  AND wp_postmeta.meta_key = '_wp_page_template'
  AND wp_posts.post_status = 'publish'
