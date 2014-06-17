using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class BaseDto
    {
        public Int32 ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
    }
}