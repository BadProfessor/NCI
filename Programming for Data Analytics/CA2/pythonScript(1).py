from pyspark import SparkContext, SparkConf
from pyspark.sql import SQLContext

conf=SparkConf()
conf.set('spark.mongodb.input.uri','mongodb://127.0.0.1/db1.collection1')
conf.set('spark.mongodb.output.uri','mongodb://127.0.0.1/db1.collection1')

sc = SparkContext(conf=conf)
sqlContext = SQLContext(sc)

rdd1 = sqlContext.read.csv("hdfs://localhost:9000/CA2/dataset.csv")
rdd1.write.format("mongo").mode("append").save()

df = sqlContext.read.format("com.mongodb.spark.sql.DefaultSource").load()
df.printSchema()

df.registerTempTable("airbnb_listings")

rsd1=sqlContext.sql("SELECT _c4 area, _c8 price from airbnb_listings")
rsd1.show()

rsd2=sqlContext.sql("SELECT _c4 area, AVG(_c8) avg_price from airbnb_listings GROUP BY _c4")
rsd2.show()

rsd1.write.format("jdbc").option("url", "jdbc:mysql://localhost:3306?autoReconnect=true&useSSL=false").option("driver", "com.mysql.jdbc.Driver").option("dbtable", "output.rsd1").option("user", "root").option("password", "Students@0@0").save()

rsd2.write.format("jdbc").option("url", "jdbc:mysql://localhost:3306?autoReconnect=true&useSSL=false").option("driver", "com.mysql.jdbc.Driver").option("dbtable", "output.rsd2").option("user", "root").option("password", "Students@0@0").save()

rsd1.coalesce(1).write.csv("hdfs://localhost:9000/Output/Output1")
rsd2.coalesce(1).write.csv("hdfs://localhost:9000/Output/Output2")
