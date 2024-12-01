class CryptoResponse{
  String? hash;
  String?time;
  String?blockIndex;
  CryptoResponse(
  this.hash,
  this.time,
  this.blockIndex,
  );

  CryptoResponse.from(Map<String,dynamic>json){
    hash=json['hash'];
    time=json['time'];
    blockIndex=json['blockIndex'];
  }
  }