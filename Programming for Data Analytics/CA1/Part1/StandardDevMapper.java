import java.io.IOException;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.Mapper;

public class StandardDevMapper extends Mapper<Object, Text, IntWritable, IntWritable> {

	private IntWritable outNumber = new IntWritable();
	private IntWritable outStringLength = new IntWritable();

	public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

		String[] arrLine = value.toString().split(",");

		int num = Integer.parseInt(arrLine[4]);

		if (num >= 22 && num <= 98) {

			int num1 = (arrLine[5].length());

			outStringLength.set(1);
			outNumber.set(num1);

			context.write(outStringLength, outNumber);
		}
	}
}
