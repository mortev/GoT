using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class TrophyVisitor
    {
        public static List<TrophyDto> Visit(List<Trophy> trophies)
        {
            List<TrophyDto> response = new List<TrophyDto>();

            foreach (var trophy in trophies)
            {
                var trophyDto = Visit(trophy);
                if (trophyDto != null)
                    response.Add(trophyDto);
            }

            return response;
        }

        public static TrophyDto Visit(Trophy trophy)
        {
            if (trophy == null)
                return null;

            return new TrophyDto
            {
                TrophyId = trophy.TrophyId,
                Name = trophy.Name,
                Description = trophy.Description
            };
        }
    }
}