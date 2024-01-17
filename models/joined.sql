{{
    config(
        materialized="table",
    )
}}

with
    comments as (select * from {{ ref("cmt") }}),
    posts as (select * from {{ ref("post") }})

{# todo reduce num of columns  #}

select comments.*, posts.*
from comments
left join posts on comments.comments_post_id = posts.post_fullname