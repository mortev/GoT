using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class PlayerDto
    {
        public Int64 PlayerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Nullable<DateTime> DateOfBirth { get; set; }
        public string City { get; set; }
        public string Country { get; set; }

        public List<TrophyDto> Trophies { get; set; }
    }
}