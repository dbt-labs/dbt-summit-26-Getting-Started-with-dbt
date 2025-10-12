-- Use a valid SQL statement to wrap the Jinja code
{{ codegen.generate_source(
    schema_name= 'jaffle_shop', 
    database_name= 'raw',
    table_names= ['customers', 'orders'],
    include_descriptions= True,
    generate_columns= True
    ) }}