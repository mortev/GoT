using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server
{
    /// <summary>
    /// 
    /// </summary>
    [ServiceContract]
    [DataContractFormat]
    public interface IGoTService
    {
        /// <summary>
        /// Get list of Houses.
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<HouseDto> GetHouses();

        /// <summary>
        /// Get list of Regions.
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<RegionDto> GetRegions();

        /// <summary>
        /// Get list of Players.
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<PlayerDto> GetPlayers();

        /// <summary>
        /// Get list of DidYouKnows.
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<DidYouKnowDto> GetDidYouKnows();

        /// <summary>
        /// Get list of Trivias.
        /// </summary>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<TriviaDto> GetTrivias();

        /// <summary>
        /// Get list of Games.
        /// Pass in number of games to be included in response.
        /// </summary>
        /// <param name="maxNumberOfGamesToReturn"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<GameDto> GetGames(int maxNumberOfGamesToReturn);

        /// <summary>
        /// Create new Game.
        /// </summary>
        /// <param name="game"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        void CreateGame(GameDto game);

        /// <summary>
        /// Add round to Game.
        /// </summary>
        /// <param name="round"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        void CreateRound(RoundDto round);

        
    }
}
