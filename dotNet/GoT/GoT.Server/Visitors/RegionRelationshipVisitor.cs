using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class RegionRelationshipVisitor
    {
        /// <summary>
        /// Map list of RegionRelationship to list of RegionRelationshipDto.
        /// </summary>
        /// <param name="regionRelationships"></param>
        /// <returns></returns>
        public static List<RegionRelationshipDto> Visit(List<RegionRelationship> regionRelationships)
        {
            List<RegionRelationshipDto> response = new List<RegionRelationshipDto>();

            foreach (var regionRelationship in regionRelationships)
            {
                var regionRelationshipDto = Visit(regionRelationship);
                if (regionRelationshipDto != null)
                    response.Add(regionRelationshipDto);
            }

            return response;
        }

        /// <summary>
        /// Map RegionRelationship to RegionRelationshipDto.
        /// </summary>
        /// <param name="regionRelationship"></param>
        /// <returns></returns>
        private static RegionRelationshipDto Visit(RegionRelationship regionRelationship)
        {
            if (regionRelationship == null)
                return null;

            return new RegionRelationshipDto
            {
                SourceRegionId = regionRelationship.SourceRegion.RegionId,
                DestinationRegionId = regionRelationship.DestinationRegionId,
                Bridges = Visit(regionRelationship.RelationshipBridges.ToList())
            };
        }

        private static List<RelationshipBridgeDto> Visit(List<RelationshipBridge> relationshipBridges)
        {
            List<RelationshipBridgeDto> response = new List<RelationshipBridgeDto>();

            foreach (var relationshipBridge in relationshipBridges)
            {
                var relationshipBridgeDto = Visit(relationshipBridge);
                if (relationshipBridgeDto != null)
                    response.Add(relationshipBridgeDto);
            }

            return response;
        }

        private static RelationshipBridgeDto Visit(RelationshipBridge relationshipBridge)
        {
            if (relationshipBridge == null)
                return null;

            return new RelationshipBridgeDto
            {
                BridgeRegionId = relationshipBridge.BridgeRegionId
            };
        }
    }
}