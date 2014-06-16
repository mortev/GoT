using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class PlayerVisitor
    {
        /// <summary>
        /// Map list of Player to list of PlayerDto.
        /// </summary>
        /// <param name="players"></param>
        /// <returns></returns>
        public static List<PlayerDto> Visit(List<Player> players)
        {
            List<PlayerDto> response = new List<PlayerDto>();

            foreach (var player in players)
            {
                var playerDto = Visit(player);
                if (playerDto != null)
                    response.Add(playerDto);
            }

            return response;
        }

        /// <summary>
        /// Map Player to PlayerDto.
        /// </summary>
        /// <param name="player"></param>
        /// <returns></returns>
        public static PlayerDto Visit(Player player)
        {
            if (player == null)
                return null;

            return new PlayerDto
            {
                PlayerId = player.PlayerId,
                FirstName = player.FirstName,
                LastName = player.LastName,
                DateOfBirth = player.DateOfBirth,
                City = player.City,
                Country = player.Country,
                Trophies = TrophyVisitor.Visit(player.Trophys.ToList())
            };
        }
    }
}