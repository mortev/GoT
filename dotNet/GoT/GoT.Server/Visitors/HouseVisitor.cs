using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class HouseVisitor
    {
        /// <summary>
        /// Map from list of House to list of HouseDto.
        /// </summary>
        /// <param name="houses"></param>
        /// <param name="ctx"></param>
        /// <returns></returns>
        public static List<HouseDto> Visit(List<House> houses, GoTDataContext ctx)
        {
            List<HouseDto> response = new List<HouseDto>();

            foreach (var house in houses)
            {
                var houseDto = Visit(house, ctx);
                if (houseDto != null)
                    response.Add(houseDto);
            }

            return response;
        }

        /// <summary>
        /// Map from House to HouseDto.
        /// </summary>
        /// <param name="house"></param>
        /// <param name="ctx"></param>
        /// <returns></returns>
        public static HouseDto Visit(House house, GoTDataContext ctx)
        {
            if (house == null)
                return null;

            //Get capital region::
            var capitalRegion = ctx.Regions.FirstOrDefault(w => w.RegionId == house.CapitalRegionId);

            return new HouseDto
            {
                HouseId = house.HouseId,
                Name = house.Name,
                Description = house.Description,
                Sigil = house.Sigil,
                CapitalRegionId = capitalRegion != null ? capitalRegion.RegionId : 0,
                Characters = CharacterVisitor.Visit(house.Characters.ToList())
            };
        }
    }
}