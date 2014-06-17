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
        public static List<TrophyDto> Visit(List<PlayerTrophy> trophies, GoTDataContext ctx)
        {
            List<TrophyDto> response = new List<TrophyDto>();

            foreach (var trophy in trophies)
            {
                var trophyDto = Visit(trophy, ctx);
                if (trophyDto != null)
                    response.Add(trophyDto);
            }

            return response;
        }

        private static TrophyDto Visit(PlayerTrophy playerTrophy, GoTDataContext ctx)
        {
            if (playerTrophy == null)
                return null;

            var trophy = ctx.Trophys.FirstOrDefault(w => w.TrophyId == playerTrophy.Trophy.TrophyId);
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