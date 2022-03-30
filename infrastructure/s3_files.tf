resource "aws_s3_object" "enem_agrega_idade" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/airflow/dags/pyspark/enem_agrega_idade.py"
  source = "../dags/pyspark/enem_agrega_idade.py"
  etag   = filemd5("../dags/pyspark/enem_agrega_idade.py")
}

resource "aws_s3_object" "enem_agrega_notas" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/airflow/dags/pyspark/enem_agrega_notas.py"
  source = "../dags/pyspark/enem_agrega_notas.py"
  etag   = filemd5("../dags/pyspark/enem_agrega_notas.py")
}

resource "aws_s3_object" "enem_agrega_sexo" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/airflow/dags/pyspark/enem_agrega_sexo.py"
  source = "../dags/pyspark/enem_agrega_sexo.py"
  etag   = filemd5("../dags/pyspark/enem_agrega_sexo.py")
}

resource "aws_s3_object" "enem_anonimiza_inscricao" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/airflow/dags/pyspark/enem_anonimiza_inscricao.py"
  source = "../dags/pyspark/enem_anonimiza_inscricao.py"
  etag   = filemd5("../dags/pyspark/enem_anonimiza_inscricao.py")
}

resource "aws_s3_object" "enem_converte_parquet" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/airflow/dags/pyspark/enem_converte_parquet.py"
  source = "../dags/pyspark/enem_converte_parquet.py"
  etag   = filemd5("../dags/pyspark/enem_converte_parquet.py")
}

resource "aws_s3_object" "enem_join_final" {
  bucket = aws_s3_bucket.datalake.id
  key    = "/airflow/dags/pyspark/enem_join_final.py"
  source = "../dags/pyspark/enem_join_final.py"
  etag   = filemd5("../dags/pyspark/enem_join_final.py")
}