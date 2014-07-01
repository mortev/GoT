using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class GameDto
    {
        public Nullable<Int32> GameId { get; set; }
        public DateTime Date { get; set; }
        public string Mode { get; set; }
        public string Status { get; set; }
        public Nullable<DateTime> CreatedDate { get; set; }
        public Int32 CreatedByPlayerId { get; set; }
        public string CreatedByPlayerName { get; set; }
        public string WinningPlayerName { get; set; }

        public List<GamePlayerDto> Players { get; set; }
    }
}