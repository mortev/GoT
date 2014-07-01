using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class GamePlayerDto
    {
        public Nullable<Int32> GamePlayerId { get; set; }
        public Nullable<Int32> GameId { get; set; }
        public Nullable<Int32> HouseId { get; set; }
        public string HouseName { get; set; }
        public string HouseDescription { get; set; }
        public string HouseColor { get; set; }
        public Int32 PlayerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        
        public Nullable<Int32> Place { get; set; }
    }
}