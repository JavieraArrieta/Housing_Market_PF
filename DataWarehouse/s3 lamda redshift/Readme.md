# Pipeline ETL para cargar datos de forma incremental desde Amazon S3 a Amazon Redshift mediante una función Lambda.
#### Pasos:
1.  Se crea un depósito S3.
2.  Se Crea un clúster Redshift.
3.  Se conecta a Redshift.
4.  Crear las tablas en una base de datos.
5.  Crear su función Lambda.
6.  La función carga los datos de S3 a Redshift.
7.  Consulta tus datos.


Nos a conectarnos a nuestra base de datos con la ayuda del cliente SQL, para esto necesitamos recordar los siguientes datos de la configuración de Redshift Cluster

    HOST = "redshift-cluster-1.cmsj8u0zj9uy.us- east redshift.amazonaws.com"  
    PORT = "5439"  
    DATABASE = "markethousing"
    USERNAME = "awsuser"  
    PASSWORD = "******"  
    TABLe = "markethousing"

Una vez que nos conectemos al cluster de Redshift se crea las nuevas tablas  `Crear tablas.sql`..

La función Lambda necesitará algunas bibliotecas de Python como Sqalchemy y Psycopg2.

Para configurar la función Lambda en AWS, que es una secuencia de comandos de Python, sedebe configurar los siguientes recursos:

1.  Cargar la funcón lambda.zip `funcion_lamda.py`.
2.  Insertar un rol de IAM a la función Lambda, que otorga acceso a`AWSLambdaVPCAccesExcecutionRole`
3.  Se debe agregar VPC por defecto en la función Lambda.









