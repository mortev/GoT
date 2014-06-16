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
        public static RegionRelationshipDto Visit(RegionRelationship regionRelationship)
        {
            if (regionRelationship == null)
                return null;

            return new RegionRelationshipDto
            {
                RegionRelationshipId = regionRelationship.RegionRelationshipId,
                SourceRegionId = regionRelationship.SourceRegion.RegionId,
                DestinationRegionId = regionRelationship.DestinationRegionId,
                BridgeRegionId = regionRelationship.BridgeRegionId
            };
        }
    }
}