import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import org.apache.hadoop.io.*;

public class StandardDevTuple implements Writable {
	private float median = 0f;
	private float variance = 0f;

	public float getMedian() {
		return median;
	}

	public void setMedian(float median) {
		this.median = median;
	}

	public float getVariance() {
		return variance;
	}

	public void setVariance(float variance) {
		this.variance = variance;
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		median = in.readFloat();
		variance = in.readFloat();
	}

	@Override
	public void write(DataOutput out) throws IOException {
		out.writeFloat(median);
		out.writeFloat(variance);
	}

	@Override
	public String toString() {
		return median + "\t" + variance;
	}
}
