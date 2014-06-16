using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoT.Server.Messages
{
    public class TriviaDto
    {
        public Int64 TriviaId { get; set; }
        public string QuestionText { get; set; }
        public string AnswerText { get; set; }

        public List<TriviaAlternativeDto> Alternatives { get; set; }
    }
}