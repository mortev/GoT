using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Activation;
using GoT.Data;
using GoT.Server.Messages;

namespace GoT.Server
{
    /// <summary>
    /// 
    /// </summary>    
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall)]
    public class GoTService : IGoTService, IDisposable
    {
        /// <inheritdoc />
        public GoTService()
        {

        }

        /// <inheritdoc />
        public List<HouseDto> GetHouses()
        {
            var response = new List<HouseDto>();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var houses = ctx.Houses.ToList();
                    
                    //TODO:: Refactor to mapping classes::
                    foreach (var house in houses)
                    {
                        var houseDto = new HouseDto
                        {
                            HouseId = house.HouseId,
                            Name = house.Name,
                            Sigil = house.Sigil,
                            Characters = new List<CharacterDto>()
                        };
                        foreach (var character in house.Characters)
                        {
                            var characterDto = new CharacterDto
                            {
                                CharacterId = character.CharacterId,
                                FirstName = character.FirstName,
                                LastName = character.LastName,
                                NickName = character.NickName,
                                Gender = character.Gender
                            };
                            houseDto.Characters.Add(characterDto);
                        }
                        response.Add(houseDto);
                    }
                }
            }
            catch (Exception exc)
            {

            }

            return response;
        }

        /// <inheritdoc />
        public List<PlayerDto> GetPlayers()
        {
            var response = new List<PlayerDto>();

            try
            {
                using (var ctx = new GoTDataContext())
                {
                    var players = ctx.Players.ToList();

                    //TODO:: Refactor to mapping classes::
                    foreach (var player in players)
                    {
                        var playerDto = new PlayerDto
                        {
                            PlayerId = player.PlayerId,
                            FirstName = player.FirstName,
                            LastName = player.LastName,
                            DateOfBirth = player.DateOfBirth,
                            City = player.City,
                            Country = player.Country,
                            Trophies = new List<TrophyDto>()
                        };
                        foreach (var trophy in player.Trophys)
                        {
                            var trophyDto = new TrophyDto
                            {
                                TrophyId = trophy.TrophyId,
                                Name = trophy.Name,
                                Description = trophy.Description
                            };
                            playerDto.Trophies.Add(trophyDto);
                        }
                        response.Add(playerDto);
                    }
                }
            }
            catch (Exception exc)
            {

            }

            return response;
        }

        /// <inheritdoc />
        public GameDto CreateGame(GameDto game)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <exclude/>
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
