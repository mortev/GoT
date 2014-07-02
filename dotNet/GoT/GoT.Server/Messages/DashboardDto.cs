using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class DashboardDto
    {
        public Int32 NumberOfCompletedGames { get; set; }

        public List<HouseDto> Houses { get; set; }
        public List<PlayerDto> Players { get; set; }
    }
}