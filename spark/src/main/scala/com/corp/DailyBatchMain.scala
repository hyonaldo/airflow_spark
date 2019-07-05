package com.corp

import com.typesafe.config._

import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.SQLContext

import java.time.ZoneId
import java.time.LocalDate
import org.apache.log4j.LogManager

object DailyBatchMain {
    val spark = SparkSession.builder()
        .config("spark.ui.showConsoleProgress", false)
        .getOrCreate()
    val sc = spark.sparkContext
    sc.setLogLevel("ERROR")
    org.apache.log4j.LogManager.getLogger("org").setLevel(org.apache.log4j.Level.ERROR)
    org.apache.log4j.LogManager.getLogger("akka").setLevel(org.apache.log4j.Level.ERROR)
    
    def main(args: Array[String]) {
        val usage =
            s"""
        Usage: [ENV] [START_DATE] [NUM_DAYS]
        """
        var argString = ""
    
        if (args.size != 4) {
            argString = args.mkString(" , ")
            println(
                s"""
            Error ${args.size} Args: ${argString}
            ${usage}
            """)
            System.exit(1)
        }
    
        val CLASS_NAME = args(0)
        val ENV = args(1)
        val START_DATE = args(2).replaceAll("-", "")
        val NUM_DAYS = args(3)
    
        val job = Class.forName(CLASS_NAME).newInstance.asInstanceOf[DailyBatch]
        
        val conf = ConfigFactory.load(ENV)
        val OUTPUT_BUCKET = conf.getString("OUTPUT_BUCKET")
    
        var _date = START_DATE.toString
        val _year = _date.substring(0, 4).toInt
        val _month = _date.substring(4, 6).toInt
        val _day = _date.substring(6, 8).toInt
        
        var n = NUM_DAYS.toString.toDouble.toInt
    
        println(
            s"""
        ----------------------------
        ENV: ${ENV} OUTPUT_BUCKET: $OUTPUT_BUCKET
        START_DATE: ${START_DATE}
        NUM_DAYS: ${NUM_DAYS}
        ----------------------------
        """)
    
        val start = LocalDate.of(_year, _month, _day)
        val date_list = (0 to n - 1).map {
            i =>
                // bypass java bug
                start.minusDays(i).toString
        }
    
        /*run period*/
        date_list.foreach {
            ds =>
                job.run(ds, OUTPUT_BUCKET, spark)
        }
        
    }
    
}

