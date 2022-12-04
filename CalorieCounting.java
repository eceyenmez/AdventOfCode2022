package Day_1;

import java.io.*;

public class CalorieCounting {
    public static void main(String[] args) throws IOException {

        File file = new File("src/Day_1/input.txt");
        InputStream inputStream = new FileInputStream(file);
        BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));

        String line;
        int sumTemp = 0, sumResult = 0;

        while ((line = br.readLine()) != null) {
            if (line.trim().isEmpty()){
                sumResult = Math.max(sumTemp,sumResult);
                sumTemp = 0;
            }else {
                sumTemp += Integer.parseInt(line);
            }
        }

        System.out.println("RESULT: "+sumResult);
    }
}