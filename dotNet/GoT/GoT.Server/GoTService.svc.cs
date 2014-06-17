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
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public GameDto GetGame(long gameId)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public long CreateGame(GameDto game)
        {
            throw new NotImplementedException();
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
            var response = new PlayerDto();

            if (playerDto == null)
                return response;

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var player = ctx.Players.FirstOrDefault(w => w.Username.Equals(playerDto.Username));
                    if (player != null)
                    {
                        //TODO:: Add error
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
                //TODO:: Add error
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
