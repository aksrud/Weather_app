String weatherString(String weather){
  if(weather == 'Rain'){
    return 'images/흐림.png';
  }
  if(weather == 'Clouds'){
    return 'images/흐림-해.png';
  }
  if(weather == 'Clear'){
    return 'images/맑음-해.png';
  }
  else if(weather == null){
    return '';
  }
  return '';
}