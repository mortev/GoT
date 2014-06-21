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
        public PlayerDto Login(LoginDto login)
        {
            var response = new PlayerDto();

            if (login == null)
                return response;
            if(string.IsNullOrWhiteSpace(login.Username))
                return response;
            if(string.IsNullOrWhiteSpace(login.Password))
                return response;

            using (var ctx = new GoTDataContext())
            {
                var encrypted = Cryptography.EncryptData(login.Password);
                var player = ctx.Players.FirstOrDefault(w => w.Username.Equals(login.Username) && w.Password.Equals(encrypted));
                if(player != null)
                    response = PlayerVisitor.Visit(player, ctx);
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
                    var players = ctx.Players.ToList();
                    response = PlayerVisitor.Visit(players, ctx);
                }
            }
            catch (Exception exc)
            {

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
                    //Get last 20 games::
                    var games = ctx.Games.OrderByDescending(o => o.Date).Take(10).ToList();

                    //Add filter::
                    if(filter != null)
                    {
                        //Player id filter::
                        if (filter.PlayerId != null && filter.PlayerId > 0)
                            games = games.Where(w => w.GamePlayers.Select(s => s.PlayerId).Contains(filter.PlayerId)).ToList();
                        //From date filter::
                        if (filter.FromDate != null && filter.FromDate > DateTime.MinValue)
                            games = games.Where(w => w.Date > filter.FromDate).ToList();
                        //To date filter::
                        if (filter.ToDate != null && filter.ToDate > DateTime.MinValue)
                            games = games.Where(w => w.Date < filter.ToDate).ToList();

                        //TODO:: Add more filters if needed::
                    }
                    
                    response = GameVisitor.Visit(games);
                }
            }
            catch (Exception exc)
            {
                //TODO:: Handle error
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
                        response = GameVisitor.Visit(game, true);
                    }
                }
            }
            catch (Exception exc)
            {
                //TODO:: Handle error
            }

            return response;
        }

        /// <inheritdoc />
        public GameDto CreateGame(GameDto gameDto)
        {
            if (gameDto == null)
                throw new NullReferenceException("Missing method input parameter.");

            var response = new GameDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var game = ctx.Games.CreateObject();
                    game = GameVisitor.Visit(gameDto, game);
                    ctx.Games.AddObject(game);
                    ctx.SaveChanges();

                    response = GameVisitor.Visit(game, true);
                }
            }
            catch (Exception exc)
            {
                //TODO:: Handle error
            }

            return response;
        }

        /// <inheritdoc />
        public void UpdateGame(GameDto game)
        {
            throw new NotImplementedException();
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
                throw new NullReferenceException("Missing method input parameter.");

            var response = new PlayerDto();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var player = ctx.Players.FirstOrDefault(w => w.Username.Equals(playerDto.Username));
                    if (player != null)
                    {
                        //TODO:: Handle error
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
                //TODO:: Handle error
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
