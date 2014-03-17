
var nodemailer = require("nodemailer");

exports.send = function(req, res){
    // create reusable transport method (opens pool of SMTP connections)
    var smtpTransport = nodemailer.createTransport("SMTP",{
        service: "QQ",
        auth: {
            user: "736909136@qq.com",
            pass: "xiaoliang"
        }
    });

    // setup e-mail data with unicode symbols
    var mailOptions = {
        from: "736909136@qq.com", // sender address
        to: "cxj_liang@126.com", // list of receivers
        subject: "Hello ✔", // Subject line
        text: "Hello world ✔", // plaintext body
        html: "<b>Hello world ✔</b>" // html body
    };

    // send mail with defined transport object
    smtpTransport.sendMail(mailOptions, function(error, response){
        if(error){
            console.log(error);
        }else{
            console.log("Message sent: " + response.message);
        }

        // if you don't want to use this transport object anymore, uncomment following line
        //smtpTransport.close(); // shut down the connection pool, no more messages
    });
};
