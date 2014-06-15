using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class HouseDto
    {
        public Int64 HouseId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public byte[] Sigil { get; set; }
        
        public Int64 CapitalRegionId { get; set; }
        public List<CharacterDto> Characters { get; set; }
    }
}