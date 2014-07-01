using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;
using GoT.Server.Utils;

namespace GoT.Server.Visitors
{
    public static class GameVisitor
    {
        /// <summary>
        /// Map list of Game to list of GameDto.
        /// </summary>
        /// <param name="games"></param>
        /// <param name="details"></param>
        /// <returns></returns>
        public static List<GameDto> Visit(List<Game> games, GoTDataContext ctx)
        {
            List<GameDto> response = new List<GameDto>();

            foreach (var game in games)
            {
                var gameDto = Visit(game, false, ctx);
                if (gameDto != null)
                    response.Add(gameDto);
            }

            return response;
        }

        /// <summary>
        /// Map Game to GameDto.
        /// </summary>
        /// <param name="game"></param>
        /// <param name="details"></param>
        /// <returns></returns>
        public static GameDto Visit(Game game, bool details, GoTDataContext ctx)
        {
            if (game == null)
                return null;

            var response = new GameDto
            {
                GameId = game.GameId,
                Date = game.Date,
                CreatedDate = game.CreatedDate,
                CreatedByPlayerId = game.CreatedByPlayerId,
                Mode = game.Mode,
                Status = game.Status,
                Players = Visit(game.GamePlayers.ToList(), ctx)
            };

            var createdByPlayer = ctx.Players.FirstOrDefault(w => w.PlayerId == game.CreatedByPlayerId);
            if(createdByPlayer != null)
            {
                response.CreatedByPlayerName = createdByPlayer.FirstName + " " + createdByPlayer.LastName;
            }

            //Check for winning player:
            var winningGamePlayer = game.GamePlayers.FirstOrDefault(w => w.Place == 1);
            if (winningGamePlayer != null)
            {
                var winningPlayer = ctx.Players.FirstOrDefault(w => w.PlayerId == winningGamePlayer.PlayerId);
                if(winningPlayer != null)
                {
                    response.WinningPlayerName = winningPlayer.FirstName + " " + winningPlayer.LastName;
                }
            }

            if (details)
            {
                //TODO:: Add detailed game information::

            }

            return response;
        }

        public static List<GamePlayerDto> Visit(List<GamePlayer> gamePlayers, GoTDataContext ctx)
        {
            if (gamePlayers == null)
                return null;

            var response = new List<GamePlayerDto>();

            foreach (var gamePlayer in gamePlayers)
            {
                var gamePlayerDto = new GamePlayerDto();
                gamePlayerDto.GameId = gamePlayer.Game.GameId;
                gamePlayerDto.GamePlayerId = gamePlayer.GamePlayerId;
                gamePlayerDto.PlayerId = gamePlayer.PlayerId;
                gamePlayerDto.HouseId = gamePlayer.HouseId;
                gamePlayerDto.Place = gamePlayer.Place;

                var player = ctx.Players.FirstOrDefault(w => w.PlayerId == gamePlayer.PlayerId);
                if(player != null)
                {
                    gamePlayerDto.FirstName = player.FirstName;
                    gamePlayerDto.LastName = player.LastName;
                }

                var house = ctx.Houses.FirstOrDefault(w => w.HouseId == gamePlayer.HouseId);
                if (house != null)
                {
                    gamePlayerDto.HouseName = house.Name;
                    gamePlayerDto.HouseDescription = house.Description;
                    gamePlayerDto.HouseColor = house.Color;
                }

                response.Add(gamePlayerDto);
            }

            return response;
        }


        /// <summary>
        /// Map GameDto to Game.
        /// </summary>
        /// <param name="gameDto"></param>
        /// <param name="game"></param>
        /// <returns></returns>
        public static Game Visit(GameDto gameDto, Game game)
        {
            game.GameId = gameDto.GameId.HasValue ? gameDto.GameId.Value : 0;
            game.Date = gameDto.Date.ToLocalTime();
            game.CreatedDate = DateTime.Now;
            game.CreatedByPlayerId = gameDto.CreatedByPlayerId;
            game.Mode = gameDto.Mode;
            game.Status = gameDto.Status;

            return game;
        }
    }
}