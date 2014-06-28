using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class RegionDto
    {
        public Int32 RegionId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Int32 SupplyCount { get; set; }
        public Int32 ConsolidatePowerCount { get; set; }
        public Int32 MinimumUnitsToEnter { get; set; }
        public Nullable<Int32> DefenseCount { get; set; }
        public bool IsStronghold { get; set; }
        public bool IsCastle { get; set; }
        public bool IsOcean { get; set; }

        public PortDto Port { get; set; }
        public List<RegionRelationshipDto> Relationships { get; set; }
    }
}