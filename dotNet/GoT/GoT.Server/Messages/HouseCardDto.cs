using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class HouseCardDto
    {
        public Int64 HouseCardId { get; set; }
        public string Description { get; set; }
        public Int32 CombatStrength { get; set; }
        public string Speciality { get; set; }
        public Int32 SwordCount { get; set; }
        public Int32 TowerCount { get; set; }
    }
}