from pyspark import SparkContext, SparkConf
from pyspark.sql import SparkSession

# set conf
conf = (
SparkConf()
    .set("spark.hadoop.fs.s3a.fast.upload", True)
    .set("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
    .set('spark.hadoop.fs.s3a.aws.credentials.provider', 'com.amazonaws.auth.EnvironmentVariableCredentialsProvider')
    .set('spark.jars.packages', 'org.apache.hadoop:hadoop-aws:2.7.3')
)

# apply config
sc = SparkContext(conf=conf).getOrCreate()
    

if __name__ == "__main__":

    # init spark session
    spark = SparkSession\
            .builder\
            .appName("ENEM Job")\
            .getOrCreate()

    spark.sparkContext.setLogLevel("WARN")

    uf_idade = (
        spark
        .read
        .format("parquet") 
        .load("s3a://${aws_s3_bucket.datalake.bucket}/processing-zone/intermediary/uf_idade")
    )

    uf_sexo = (
        spark
        .read
        .format("parquet")
        .load("s3a://${aws_s3_bucket.datalake.bucket}/processing-zone/intermediary/uf_sexo")
    )

    uf_notas = (
        spark
        .read
        .format("parquet")
        .load("s3a://${aws_s3_bucket.datalake.bucket}/processing-zone/intermediary/uf_notas")
    )
    
    print("****************")
    print("* JOIN FINAL *")
    print("****************")

    uf_final = (
        uf_idade
        .join(uf_sexo, on="SG_UF_RESIDENCIA", how="inner")
        .join(uf_notas, on="SG_UF_RESIDENCIA", how="inner")
    )

    (
        uf_final
        .write
        .mode("overwrite")
        .format("parquet")
        .save("s3a://${aws_s3_bucket.datalake.bucket}/consumer-zone/enem_uf")
    )

    print("*********************")
    print("Escrito com sucesso!")
    print("*********************")

    spark.stop()