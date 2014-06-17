using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class HouseCardVisitor
    {
        public static List<HouseCardDto> Visit(List<HouseCard> houseCards)
        {
            var response = new List<HouseCardDto>();

            foreach (var houseCard in houseCards)
            {
                var houseCardDto = Visit(houseCard);
                if (houseCardDto != null)
                    response.Add(houseCardDto);
            }

            return response;
        }

        private static HouseCardDto Visit(HouseCard houseCard)
        {
            if (houseCard == null)
                return null;

            return new HouseCardDto
            {
                HouseCardId = houseCard.HouseCardId,
                CharacterId = houseCard.CharacterId,
                CombatStrength = houseCard.CombatStrength,
                Description = houseCard.Description,
                SwordCount = houseCard.SwordCount,
                TowerCount = houseCard.TowerCount
            };
        }
    }
}