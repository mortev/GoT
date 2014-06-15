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
        /// Add description.
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = System.ServiceModel.Web.WebMessageBodyStyle.Bare)]
        GameDto CreateGame(GameDto game);
    }
}
