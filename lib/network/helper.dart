

toCamelCase(str){
  return str.split(' ').map((word,index){
      // If it is the first word make sure to lowercase all the chars.
      if(index == 0){
    return word.toLowerCase();
  }
  // If it is not the first word only upper case the first char and lowercase the rest.
  return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
}).join('');
}