{% for role in ['Data Analyst', 'Data Scientist', 'Data Engineer'] %}
SELECT '{{ role }}' AS role
{% if not loop.last %}UNION ALL{% endif %}
{% endfor %}