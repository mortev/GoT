using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class PortVisitor
    {
        /// <summary>
        /// Map Port to PortDto.
        /// </summary>
        /// <param name="port"></param>
        /// <returns></returns>
        public static PortDto Visit(Port port)
        {
            if (port == null)
                return null;

            return new PortDto
            {
                PortId = port.PortId,
                Name = port.Name
            };
        }
    }
}