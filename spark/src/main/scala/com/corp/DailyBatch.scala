package com.corp

trait DailyBatch extends Serializable {
    def run(ds: String, OUTPUT_BUCKET: String, spark: org.apache.spark.sql.SparkSession)
}

