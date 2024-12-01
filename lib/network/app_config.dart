abstract class AppConfig {
  static String baseUral = "https://blockchain.info/";

  static String getLatestBlock= baseUral +"latestblock";
  static String getTxnByHash(String hash)=> baseUral +"rawblock/$hash";


}
