resource "aws_glue_catalog_database" "db" {
  name = "enem2019db"
}

resource "aws_glue_crawler" "enem_anon_crawler" {
  database_name = aws_glue_catalog_database.db.name
  name          = "enem_anon_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3a://${aws_s3_bucket.datalake.bucket}/consumer-zone/enem_anon/"
  }

  configuration = <<EOF
    {
        "Version": 1.0,
        "Grouping": {
            "TableGroupingPolicy": "CombineCompatibleSchemas" }
    }
    EOF

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_glue_crawler" "enem_uf_final_crawler" {
  database_name = aws_glue_catalog_database.db.name
  name          = "enem_uf_final_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3a://${aws_s3_bucket.datalake.bucket}/consumer-zone/enem_uf"
  }

  configuration = <<EOF
    {
        "Version": 1.0,
        "Grouping": {
            "TableGroupingPolicy": "CombineCompatibleSchemas" }
    }
    EOF

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}