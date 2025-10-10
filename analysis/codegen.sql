{{ codegen.generate_source(
    schema_name= 'jaffle_shop', 
    database_name= 'raw',
    include_description= True,
    generate_columns= True
    ) }}