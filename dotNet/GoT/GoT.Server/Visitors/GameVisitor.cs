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
        public static List<GameDto> Visit(List<Game> games)
        {
            List<GameDto> response = new List<GameDto>();

            foreach (var game in games)
            {
                var gameDto = Visit(game, false);
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
        public static GameDto Visit(Game game, bool details)
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
                Status = game.Status
            };

            if (details)
            {
                //TODO:: Add detailed game information::
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
            game.GameId = gameDto.GameId;
            game.Date = gameDto.Date;
            game.CreatedDate = gameDto.CreatedDate;
            game.CreatedByPlayerId = gameDto.CreatedByPlayerId;
            game.Mode = gameDto.Mode;
            game.Status = gameDto.Status;

            return game;
        }
    }
}