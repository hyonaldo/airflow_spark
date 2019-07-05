package com.corp

import org.apache.spark.sql.functions._

final case class TemplateFormat(denseQuery: String, day: String, qc: Int, avgClickRank: Double)

class Template extends DailyBatch {
    
    val HDFS_DENSE_CC_DIR = "/user/isearch/log/m_dense_cc"
    val HDFS_DENSE_QC_DIR = "/user/isearch/log/m_dense_qc"
    
    def overloaded_stuff(HDFS_OUTPUT: String) {
        println("-" * 40)
        println(s"HDFS_OUTPUT = $HDFS_OUTPUT")
    }
    
    override def run(ds: String, OUTPUT_BUCKET: String, spark: org.apache.spark.sql.SparkSession) = {
        import spark.implicits._
        val ds_nodash = ds.replaceAll("-", "")
        val HDFS_CC = s"${HDFS_DENSE_CC_DIR}/$ds_nodash"
        val HDFS_QC = s"${HDFS_DENSE_QC_DIR}/$ds_nodash"
        
        val HDFS_OUTPUT = s"${OUTPUT_BUCKET}/kr/summary/template/$ds_nodash"
        overloaded_stuff(HDFS_OUTPUT)
    }
    
}

