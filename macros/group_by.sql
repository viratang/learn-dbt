{% macro group_by(n) %}   -- n is the parameters for group by macro
    GROUP BY
     {% for i in range(1, n+1) %}  --For loops
        {{ i }} -- if n is 3, this will run from 1,2,3
        {% if not loop.last %}, {% endif %} --if not loop.last means if it is not last in the loop, add ",", otherwise end "if statement to add ",".
     {% endfor %}
{% endmacro %} -- this means end macro