
select
    date_trunc('month', search_date)::date as month,
    count(*) as total_postings,
    -- count only remote jobs
    sum(case when job_work_from_home = true then 1 else 0 end) as remote_postings,
    -- percent remote
    round(
        100.0 * sum(case when job_work_from_home = true then 1 else 0 end) / count(*),
        1
    ) as pct_remote
from {{ ref('job_postings') }}
group by 1
order by 1