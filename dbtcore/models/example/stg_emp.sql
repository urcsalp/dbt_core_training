select emp_no,emp_name from {{ ref('emp_info') }} 