const googlehome = require('google-home-notifier')
const language = 'ja';

googlehome.device('Google-Home-Mini', language); 
googlehome.ip("xx.xx.xx.xx");
googlehome.play('http://xxxxxxxxxxx/koishi.wav', function(res) {
  console.log(res);
});
