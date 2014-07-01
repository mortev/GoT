var webApiUrl = "http://192.168.0.117/GoT/GoTService/";


function parseJsonDate(jsonDate) {
    var offset = new Date().getTimezoneOffset() * 60000;
    var parts = /\/Date\((-?\d+)([+-]\d{2})?(\d{2})?.*/.exec(jsonDate);
    
    if (parts[2] == undefined) 
      parts[2] = 0;
    
    if (parts[3] == undefined) 
        parts[3] = 0;

    return $.datepicker.formatDate('dd.mm.yy', new Date(+parts[1] + offset + parts[2] * 3600000 + parts[3] * 60000));
};