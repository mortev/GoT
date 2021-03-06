﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class PlayerDto
    {
        public Int32 PlayerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Nullable<DateTime> DateOfBirth { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public bool IsAdmin { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public Int32 NumberOfGames { get; set; }
        public Int32 NumberOfWins { get; set; }

        public Int32 LannisterCount { get; set; }
        public Int32 StarkCount { get; set; }
        public Int32 BaratheonCount { get; set; }
        public Int32 GreyjoyCount { get; set; }
        public Int32 MartellCount { get; set; }
        public Int32 TyrellCount { get; set; }

        public List<TrophyDto> Trophies { get; set; }
    }
}