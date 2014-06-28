using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class TriviaAlternativeDto
    {
        public Int32 TriviaAlternativeId { get; set; }
        public string Text { get; set; }
        public bool IsCorrect { get; set; }
    }
}