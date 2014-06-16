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
                    response = PlayerVisitor.Visit(players);
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
        public List<GameDto> GetGames(int maxNumberOfGamesToReturn)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public void CreateGame(GameDto game)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc />
        public void CreateRound(RoundDto round)
        {
            throw new NotImplementedException();
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
