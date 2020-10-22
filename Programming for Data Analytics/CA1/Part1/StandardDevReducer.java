import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.Reducer;

public class StandardDevReducer extends Reducer<IntWritable, IntWritable, IntWritable, StandardDevTuple> {

	private StandardDevTuple result = new StandardDevTuple();

	private ArrayList<Float> stringLengths = new ArrayList<Float>();

	public void reduce(IntWritable key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {

		float sum = 0;
		float count = 0;
		stringLengths.clear();
		result.setVariance(0);

		for (IntWritable val : values) {
			stringLengths.add((float) val.get());
			sum += val.get();
			++count;
		}

		Collections.sort(stringLengths);

		if (count % 2 == 0) {
			result.setMedian((stringLengths.get(((int) count / 2) - 1) + stringLengths.get((int) count / 2)) / 2.0f);
		} else {
			result.setMedian(stringLengths.get((int) count / 2));
		}

		float mean = sum / count;
		float sumOfSquares = 0.0f;
		for (Float f : stringLengths) {
			sumOfSquares += (f - mean) * (f - mean);
		}

		result.setVariance((float) Math.sqrt(sumOfSquares / (count - 1)));

		context.write(key, result);
	}
}
