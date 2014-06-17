using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class RegionVisitor
    {
        /// <summary>
        /// Map list of Region to list of RegionDto.
        /// </summary>
        /// <param name="regions"></param>
        /// <returns></returns>
        public static List<RegionDto> Visit(List<Region> regions)
        {
            List<RegionDto> response = new List<RegionDto>();

            foreach (var region in regions)
            {
                var regionDto = Visit(region);
                if (regionDto != null)
                    response.Add(regionDto);
            }

            return response;
        }

        /// <summary>
        /// Map Region to RegionDto.
        /// </summary>
        /// <param name="region"></param>
        /// <returns></returns>
        private static RegionDto Visit(Region region)
        {
            if (region == null)
                return null;

            return new RegionDto
            {
                RegionId = region.RegionId,
                Name = region.Name,
                Description = region.Description,
                ConsolidatePowerCount = region.ConsolidatePowerCount,
                DefenseCount = region.DefenseCount,
                IsCastle = region.IsCastle,
                IsStronghold = region.IsStronghold,
                IsOcean = region.IsOcean,
                SupplyCount = region.SupplyCount,
                MinimumUnitsToEnter = region.MinimumUnitsToEnter,
                Port = PortVisitor.Visit(region.Port),
                Relationships = RegionRelationshipVisitor.Visit(region.RegionRelationships.ToList())
            };
        }
    }
}