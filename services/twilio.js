// load .env data into process.env
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../.env') });

twilioParams = {
  accountID: process.env.accountID,
  authToken: process.env.authToken,
  messagingID: process.env.messagingID,
};

const twilio = require('twilio');
const client = new twilio(twilioParams.accountID, twilioParams.authToken);

const sendMessage = function(phoneNumber, message) {
  return client.messages
    .create({
      body: message,
      messagingServiceSid: twilioParams.messagingID,
      to: `${phoneNumber}`
    })
    .then(message => console.log(message.sid))
    .catch((err) => {
      console.log(err.message);
      return null;
    })
    .done();
};

module.exports = {sendMessage};


//console.log(sendMessage('7783586873', 'Hello final testing!!'));
