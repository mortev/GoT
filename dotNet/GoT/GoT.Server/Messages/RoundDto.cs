using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class RoundDto
    {
        public Int64 RoundId { get; set; }
        public Int32 RoundNumber { get; set; }
        public Int32 WildlingCount { get; set; }
        public bool WildlingAttack { get; set; }
        public Nullable<bool> WildlingVictory { get; set; }
        public string Restriction { get; set; }
    }
}