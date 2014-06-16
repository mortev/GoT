using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GoT.Server.Messages;
using GoT.Data;

namespace GoT.Server.Visitors
{
    public static class CharacterVisitor
    {
        /// <summary>
        /// Map from list of Character to list of CharacterDto.
        /// </summary>
        /// <param name="characters"></param>
        /// <returns></returns>
        public static List<CharacterDto> Visit(List<Character> characters)
        {
            List<CharacterDto> response = new List<CharacterDto>();

            foreach (var character in characters)
            {
                var characterDto = Visit(character);
                if (characterDto != null)
                    response.Add(characterDto);
            }

            return response;
        }

        /// <summary>
        /// Map from Character to CharacterDto.
        /// </summary>
        /// <param name="character"></param>
        /// <returns></returns>
        public static CharacterDto Visit(Character character)
        {
            if (character == null)
                return null;

            return new CharacterDto
            {
                CharacterId = character.CharacterId,
                FirstName = character.FirstName,
                LastName = character.LastName,
                NickName = character.NickName,
                Gender = character.Gender
            };
        }
    }
}