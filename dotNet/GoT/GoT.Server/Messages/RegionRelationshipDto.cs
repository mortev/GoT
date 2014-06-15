using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class RegionRelationshipDto
    {
        public Int64 RegionRelationshipId { get; set; }
        public Int64 SourceRegionId { get; set; }
        public Int64 DestinationRegionId { get; set; }
        public Int64 BridgeRegionId { get; set; }
    }
}