using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class RegionRelationshipDto
    {
        public Int32 SourceRegionId { get; set; }
        public Int32 DestinationRegionId { get; set; }

        public List<RelationshipBridgeDto> Bridges { get; set; }
    }
}