import java.util.Scanner;

public class rot13 {
  public static void main(String[] args) {
    StringBuilder encoded = new StringBuilder();

    Scanner in = new Scanner(System.in);
    System.out.println("Enter string to encode:");
    String encode = in.nextLine();

    in.close();
    for (char c : encode.toCharArray()) {
      if ('A' <= c && c <= 'Z') {
        c = (char) ((c - 'A' + 13) % 26 + 'A');
      } else if ('a' <= c && c <= 'z') {
        c = (char) ((c - 'a' + 13) % 26 + 'a');
      }
      encoded.append(c);
    }
    System.out.println("Encoded string:");
    System.out.println(encoded);
  }
}
