using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class GameDto
    {
        public Int64 GameId { get; set; }
        public DateTime Date { get; set; }
        public string Mode { get; set; }
        public string Status { get; set; }
        public DateTime CreatedDate { get; set; }
        public Int64 CreatedByPlayerId { get; set; }
    }
}