using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class TrophyDto
    {
        public Int64 TrophyId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}