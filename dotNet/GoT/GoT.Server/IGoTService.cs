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
        /// Authenticate user.
        /// </summary>
        /// <param name="loginDto"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        PlayerDto Login(LoginDto loginDto);

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
        /// Get list of games.
        /// This method returns GameDto entities with header information only.
        /// Use GetGame method with game id paramter to get all information about a game.
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        List<GameDto> GetGames(GameFilterDto filter);

        /// <summary>
        /// Get single game.
        /// This method returns a single GameDto with all information about a game.
        /// </summary>
        /// <param name="gameId"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        GameDto GetGame(long gameId);

        /// <summary>
        /// Create new game.
        /// Returns unique game id to be used when later updating the game.
        /// </summary>
        /// <param name="gameDto"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        GameDto CreateGame(GameDto gameDto);

        /// <summary>
        /// Updates an existing game.
        /// </summary>
        /// <param name="game"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        void UpdateGame(GameDto gameDto);

        /// <summary>
        /// Add round to existing game.
        /// </summary>
        /// <param name="roundDto"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        void CreateRound(RoundDto roundDto);

        /// <summary>
        /// Create new player.
        /// </summary>
        /// <param name="playerDto"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        PlayerDto CreatePlayer(PlayerDto playerDto);

    }
}
