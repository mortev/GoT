using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;
using GoT.Server.Utils;

namespace GoT.Server.Visitors
{
    public static class PlayerVisitor
    {
        /// <summary>
        /// Map list of Player to list of PlayerDto.
        /// </summary>
        /// <param name="players"></param>
        /// <param name="ctx"></param>
        /// <returns></returns>
        public static List<PlayerDto> Visit(List<Player> players, GoTDataContext ctx)
        {
            List<PlayerDto> response = new List<PlayerDto>();

            foreach (var player in players)
            {
                var playerDto = Visit(player, ctx);
                if (playerDto != null)
                    response.Add(playerDto);
            }

            return response;
        }

        /// <summary>
        /// Map Player to PlayerDto.
        /// </summary>
        /// <param name="player"></param>
        /// <param name="ctx"></param>
        /// <returns></returns>
        public static PlayerDto Visit(Player player, GoTDataContext ctx)
        {
            if (player == null)
                return null;

            var games = ctx.Games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId));

            var response = new PlayerDto
            {
                PlayerId = player.PlayerId,
                FirstName = player.FirstName,
                LastName = player.LastName,
                DateOfBirth = player.DateOfBirth,
                City = player.City,
                Country = player.Country,
                IsAdmin = player.IsAdmin,
                NumberOfGames = games.Count(),
                NumberOfWins = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.Place == 1)).Count(),
                LannisterCount = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.HouseId  == 4)).Count(),
                StarkCount = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.HouseId == 1)).Count(),
                BaratheonCount = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.HouseId == 2)).Count(),
                GreyjoyCount = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.HouseId == 3)).Count(),
                MartellCount = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.HouseId == 5)).Count(),
                TyrellCount = games.Where(w => w.GamePlayers.Any(a => a.PlayerId == player.PlayerId && a.HouseId == 6)).Count(),
                Trophies = TrophyVisitor.Visit(player.PlayerTrophies.ToList(), ctx)
            };

            return response;  
        }

        /// <summary>
        /// Map PlayerDto to Player.
        /// </summary>
        /// <param name="playerDto"></param>
        /// <param name="player"></param>
        /// <param name="ctx"></param>
        /// <returns></returns>
        public static Player Visit(PlayerDto playerDto, Player player, GoTDataContext ctx)
        {
            player.FirstName = playerDto.FirstName;
            player.LastName = playerDto.LastName;
            player.City = playerDto.City;
            player.Country = playerDto.Country;
            player.DateOfBirth = playerDto.DateOfBirth;
            player.IsAdmin = playerDto.IsAdmin;
            player.Username = playerDto.Username;
            player.Password = Cryptography.EncryptData(playerDto.Password);

            return player;
        }
    }
}