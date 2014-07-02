using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class HouseDto
    {
        public Int32 HouseId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public byte[] Sigil { get; set; }
        public string Color { get; set; }

        public Int32 NumberOfWins { get; set; }

        public Int32 CapitalRegionId { get; set; }
        public List<CharacterDto> Characters { get; set; }
        public List<HouseCardDto> HouseCards { get; set; }
    }
}