using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Activation;
using GoT.Data;
using GoT.Server.Messages;
using GoT.Server.Visitors;
using GoT.Server.Utils;
using System.Security;
using System.Reflection;
using System.Security.Authentication;

namespace GoT.Server
{
    /// <summary>
    /// 
    /// </summary>    
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
    public class GoTService : IGoTService, IDisposable
    {
        /// <inheritdoc />
        public GoTService()
        {

        }

        /// <inheritdoc />
        public PlayerDto Login(LoginDto loginDto)
        {
            if (loginDto == null)
                throw new ArgumentNullException("loginDto");
            if (string.IsNullOrWhiteSpace(loginDto.Username))
                throw new ArgumentNullException("loginDto.Username");
            if (string.IsNullOrWhiteSpace(loginDto.Password))
                throw new ArgumentNullException("loginDto.Password");

            var response = new PlayerDto();

            using (var ctx = new GoTDataContext())
            {
                var encrypted = Cryptography.EncryptData(loginDto.Password);
                var player = ctx.Players.FirstOrDefault(w => w.Username.Equals(loginDto.Username) && w.Password.Equals(encrypted));
                if (player != null)
                    response = PlayerVisitor.Visit(player, ctx);
                else
                    throw new AuthenticationException("Login failed.");
            }

            return response;
        }

        /// <inheritdoc />
        public DashboardDto GetDashboard()
        {
            var response = new DashboardDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    response.NumberOfCompletedGames = ctx.Games.Count(w => w.Status.Equals("Completed"));
                    var players = ctx.Players.OrderBy(o => o.FirstName).ToList();
                    response.Players = PlayerVisitor.Visit(players, ctx);
                    response.Houses = new List<HouseDto>();

                    foreach (var house in ctx.Houses.ToList())
                    {
                        response.Houses.Add(new HouseDto
                        {
                            CapitalRegionId = house.CapitalRegionId,
                            Color = house.Color,
                            Description = house.Description,
                            HouseId = house.HouseId,
                            Name = house.Name,
                            Sigil = house.Sigil,
                            NumberOfWins = ctx.Games.Count(w => w.GamePlayers.Any(a => a.HouseId == house.HouseId && a.Place == 1))
                        });
                    }
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception(string.Format("Failed to get list of houses."));
            }

            return response;
        }

        /// <inheritdoc />
        public List<HouseDto> GetHouses()
        {
            var response = new List<HouseDto>();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var houses = ctx.Houses.ToList();
                    response = HouseVisitor.Visit(houses, ctx);
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception(string.Format("Failed to get list of houses."));
            }

            return response;
        }

        /// <inheritdoc />
        public List<RegionDto> GetRegions()
        {
            var response = new List<RegionDto>();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var regions = ctx.Regions.ToList();
                    response = RegionVisitor.Visit(regions);
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception(string.Format("Failed to get list of regions."));
            }

            return response;
        }

        /// <inheritdoc />
        public List<PlayerDto> GetPlayers()
        {
            var response = new List<PlayerDto>();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var players = ctx.Players.OrderBy(o => o.FirstName).ToList();
                    response = PlayerVisitor.Visit(players, ctx);
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception(string.Format("Failed to get list of players."));
            }

            return response;
        }
        
        /// <inheritdoc />
        public List<TriviaDto> GetTrivias()
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public List<DidYouKnowDto> GetDidYouKnows()
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public List<GameDto> GetGames(GameFilterDto filter)
        {
            var response = new List<GameDto>();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    //TODO:: Add paging in order to return games continuously::
                    //Get last 30 games::
                    var games = ctx.Games.OrderByDescending(o => o.Date).Take(100).ToList();

                    //Add filter::
                    if(filter != null)
                    {
                        //Player id filter::
                        if (filter.PlayerId > 0)
                            games = games.Where(w => w.GamePlayers.Select(s => s.PlayerId).Contains(filter.PlayerId)).ToList();
                        //From date filter::
                        if (filter.FromDate != null && filter.FromDate > DateTime.MinValue)
                            games = games.Where(w => w.Date > filter.FromDate).ToList();
                        //To date filter::
                        if (filter.ToDate != null && filter.ToDate > DateTime.MinValue)
                            games = games.Where(w => w.Date < filter.ToDate).ToList();

                        //TODO:: Add more filters if needed::
                    }
                    
                    response = GameVisitor.Visit(games, ctx);
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception(string.Format("Failed to get list of games."));
            }

            return response;
        }

        /// <inheritdoc />
        public GameDto GetGame(long gameId)
        {
            var response = new GameDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var game = ctx.Games.FirstOrDefault(w => w.GameId == gameId);
                    if (game != null)
                    {
                        response = GameVisitor.Visit(game, true, ctx);
                    }
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception(string.Format("Failed to get game with id {0}.", gameId));
            }

            return response;
        }

        /// <inheritdoc />
        public GameDto CreateGame(GameDto gameDto)
        {
            if (gameDto == null)
                throw new ArgumentNullException("gameDto");

            var response = new GameDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var game = ctx.Games.CreateObject();
                    game = GameVisitor.Visit(gameDto, game);

                    var houses = ctx.Houses.ToList();
                    Random rnd = new Random();

                    foreach (var player in gameDto.Players)
                    {
                        int houseIndex = rnd.Next(houses.Count);

                        var gamePlayer = ctx.GamePlayers.CreateObject();
                        gamePlayer.PlayerId = player.PlayerId;
                        gamePlayer.HouseId = houses.ElementAt(houseIndex).HouseId;
                        houses.RemoveAt(houseIndex);

                        game.GamePlayers.Add(gamePlayer);
                    }

                    ctx.Games.AddObject(game);
                    ctx.SaveChanges();

                    response = GameVisitor.Visit(game, true, ctx);
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception("Failed to create game.");
            }

            return response;
        }

        /// <inheritdoc />
        public GameDto UpdateGame(GameDto gameDto)
        {
            if (gameDto == null)
                throw new ArgumentNullException("gameDto");

            var response = new GameDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var game = ctx.Games.FirstOrDefault(w => w.GameId == gameDto.GameId);
                    if (game != null)
                    {
                        game.Status = gameDto.Status;

                        if (gameDto.Players != null)
                        {

                            foreach (var gamePlayerDto in gameDto.Players)
                            {
                                var gamePlayer = game.GamePlayers.FirstOrDefault(w => w.GamePlayerId == gamePlayerDto.GamePlayerId);
                                if (gamePlayer != null)
                                {
                                    gamePlayer.Place = gamePlayerDto.Place;
                                }
                            }
                        }

                        ctx.SaveChanges();

                        response = GameVisitor.Visit(game, true, ctx);
                    }
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception("Failed to update game.");
            }

            return response;
        }

        /// <inheritdoc />
        public void CreateRound(RoundDto round)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public PlayerDto CreatePlayer(PlayerDto playerDto)
        {
            if (playerDto == null)
                throw new ArgumentNullException("playerDto");

            var response = new PlayerDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var player = ctx.Players.FirstOrDefault(w => w.Username.Equals(playerDto.Username));
                    if (player != null)
                    {
                        throw new Exception(string.Format("Player with username {0} already exists.", playerDto.Username));
                    }
                    else
                    {
                        player = ctx.Players.CreateObject();
                        player = PlayerVisitor.Visit(playerDto, player, ctx);
                        ctx.Players.AddObject(player);
                        ctx.SaveChanges();

                        response = PlayerVisitor.Visit(player, ctx);
                    }
                }
            }
            catch (Exception exc)
            {
                Logger.LogError(MethodBase.GetCurrentMethod().Name, "2", exc.Message, exc.StackTrace);
                throw new Exception("Failed to create player.");
            }

            return response;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <exclude/>
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
