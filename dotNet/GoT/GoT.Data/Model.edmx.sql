
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/16/2014 10:14:38
-- Generated from EDMX file: C:\Data\Repository\GoT\dotNet\GoT\GoT.Data\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GoT];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_HouseCharacter]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Characters] DROP CONSTRAINT [FK_HouseCharacter];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerTrophy_Player]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlayerTrophy] DROP CONSTRAINT [FK_PlayerTrophy_Player];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerTrophy_Trophy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlayerTrophy] DROP CONSTRAINT [FK_PlayerTrophy_Trophy];
GO
IF OBJECT_ID(N'[dbo].[FK_GameRound]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rounds] DROP CONSTRAINT [FK_GameRound];
GO
IF OBJECT_ID(N'[dbo].[FK_GameGamePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GamePlayers] DROP CONSTRAINT [FK_GameGamePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_RegionRegionStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegionStatuses] DROP CONSTRAINT [FK_RegionRegionStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_CharacterHouseCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HouseCards] DROP CONSTRAINT [FK_CharacterHouseCard];
GO
IF OBJECT_ID(N'[dbo].[FK_RoundRegionStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegionStatuses] DROP CONSTRAINT [FK_RoundRegionStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_GamePlayerMove]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Moves] DROP CONSTRAINT [FK_GamePlayerMove];
GO
IF OBJECT_ID(N'[dbo].[FK_RoundMove]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Moves] DROP CONSTRAINT [FK_RoundMove];
GO
IF OBJECT_ID(N'[dbo].[FK_RoundInfluenceTrackStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InfluenceTrackStatuses] DROP CONSTRAINT [FK_RoundInfluenceTrackStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_GameGameResult]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GameResults] DROP CONSTRAINT [FK_GameGameResult];
GO
IF OBJECT_ID(N'[dbo].[FK_GamePlayerGameResult]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GameResults] DROP CONSTRAINT [FK_GamePlayerGameResult];
GO
IF OBJECT_ID(N'[dbo].[FK_RegionPort]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ports] DROP CONSTRAINT [FK_RegionPort];
GO
IF OBJECT_ID(N'[dbo].[FK_RegionRegionRelationship]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegionRelationships] DROP CONSTRAINT [FK_RegionRegionRelationship];
GO
IF OBJECT_ID(N'[dbo].[FK_RegionStatusPort]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegionStatuses] DROP CONSTRAINT [FK_RegionStatusPort];
GO
IF OBJECT_ID(N'[dbo].[FK_TriviaTriviaAlternative]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TriviaAlternatives] DROP CONSTRAINT [FK_TriviaTriviaAlternative];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Players]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players];
GO
IF OBJECT_ID(N'[dbo].[Houses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Houses];
GO
IF OBJECT_ID(N'[dbo].[Characters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Characters];
GO
IF OBJECT_ID(N'[dbo].[Regions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Regions];
GO
IF OBJECT_ID(N'[dbo].[HouseCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HouseCards];
GO
IF OBJECT_ID(N'[dbo].[Trophys]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Trophys];
GO
IF OBJECT_ID(N'[dbo].[Games]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games];
GO
IF OBJECT_ID(N'[dbo].[Rounds]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rounds];
GO
IF OBJECT_ID(N'[dbo].[RegionStatuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegionStatuses];
GO
IF OBJECT_ID(N'[dbo].[Moves]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Moves];
GO
IF OBJECT_ID(N'[dbo].[InfluenceTrackStatuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InfluenceTrackStatuses];
GO
IF OBJECT_ID(N'[dbo].[GamePlayers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GamePlayers];
GO
IF OBJECT_ID(N'[dbo].[GameResults]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GameResults];
GO
IF OBJECT_ID(N'[dbo].[Ports]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ports];
GO
IF OBJECT_ID(N'[dbo].[RegionRelationships]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegionRelationships];
GO
IF OBJECT_ID(N'[dbo].[Trivias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Trivias];
GO
IF OBJECT_ID(N'[dbo].[DidYouKnows]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DidYouKnows];
GO
IF OBJECT_ID(N'[dbo].[TriviaAlternatives]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TriviaAlternatives];
GO
IF OBJECT_ID(N'[dbo].[PlayerTrophy]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlayerTrophy];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Players'
CREATE TABLE [dbo].[Players] (
    [PlayerId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NULL,
    [City] nvarchar(max)  NULL,
    [Country] nvarchar(max)  NULL
);
GO

-- Creating table 'Houses'
CREATE TABLE [dbo].[Houses] (
    [HouseId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Sigil] varbinary(max)  NULL,
    [CapitalRegionId] bigint  NOT NULL
);
GO

-- Creating table 'Characters'
CREATE TABLE [dbo].[Characters] (
    [CharacterId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [NickName] nvarchar(max)  NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [House_HouseId] int  NOT NULL
);
GO

-- Creating table 'Regions'
CREATE TABLE [dbo].[Regions] (
    [RegionId] bigint  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [SupplyCount] int  NOT NULL,
    [IsStronghold] bit  NOT NULL,
    [IsCastle] bit  NOT NULL,
    [MinimumUnitsToEnter] int  NOT NULL,
    [DefenseCount] int  NULL,
    [ConsolidatePowerCount] int  NOT NULL,
    [IsOcean] bit  NOT NULL
);
GO

-- Creating table 'HouseCards'
CREATE TABLE [dbo].[HouseCards] (
    [HouseCardId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [CombatStrength] int  NOT NULL,
    [Speciality] nvarchar(max)  NULL,
    [SwordCount] int  NOT NULL,
    [TowerCount] int  NOT NULL,
    [Character_CharacterId] int  NOT NULL
);
GO

-- Creating table 'Trophys'
CREATE TABLE [dbo].[Trophys] (
    [TrophyId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Games'
CREATE TABLE [dbo].[Games] (
    [GameId] bigint IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Mode] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rounds'
CREATE TABLE [dbo].[Rounds] (
    [RoundId] bigint IDENTITY(1,1) NOT NULL,
    [RoundNumber] int  NOT NULL,
    [WildlingCount] int  NOT NULL,
    [Restriction] nvarchar(max)  NOT NULL,
    [WildlingAttack] bit  NOT NULL,
    [WildlingVictory] bit  NULL,
    [Game_GameId] bigint  NOT NULL
);
GO

-- Creating table 'RegionStatuses'
CREATE TABLE [dbo].[RegionStatuses] (
    [RegionStatusId] bigint IDENTITY(1,1) NOT NULL,
    [OrderToken] nvarchar(max)  NOT NULL,
    [FootmanCount] int  NOT NULL,
    [KnightCount] int  NOT NULL,
    [ShipCount] int  NOT NULL,
    [SiegeCount] int  NOT NULL,
    [ControlledByGamePlayerId] bigint  NOT NULL,
    [Region_RegionId] bigint  NOT NULL,
    [Round_RoundId] bigint  NOT NULL,
    [Port_PortId] bigint  NULL
);
GO

-- Creating table 'Moves'
CREATE TABLE [dbo].[Moves] (
    [MoveId] bigint IDENTITY(1,1) NOT NULL,
    [AttackerFootmanCount] int  NOT NULL,
    [AttackerKnightCount] int  NOT NULL,
    [AttackerShipCount] int  NOT NULL,
    [AttackerSiegeCount] int  NOT NULL,
    [AttackerBattleCardStrength] int  NULL,
    [DefenderBattleCardStrength] int  NULL,
    [AttackerVictory] bit  NOT NULL,
    [AttackerHouseCardId] bigint  NULL,
    [DefenderHouseCardId] bigint  NULL,
    [AttackerGamePlayerId] bigint  NOT NULL,
    [FromRegionId] bigint  NOT NULL,
    [ToRegionId] bigint  NOT NULL,
    [GamePlayerMove_Move_GamePlayerId] bigint  NOT NULL,
    [Round_RoundId] bigint  NOT NULL
);
GO

-- Creating table 'InfluenceTrackStatuses'
CREATE TABLE [dbo].[InfluenceTrackStatuses] (
    [InfluenceTrackId] bigint IDENTITY(1,1) NOT NULL,
    [IronThronePosition] int  NOT NULL,
    [FiefdomPosition] int  NOT NULL,
    [KingsCourtPosition] int  NOT NULL,
    [GamePlayerId] bigint  NOT NULL,
    [Round_RoundId] bigint  NOT NULL
);
GO

-- Creating table 'GamePlayers'
CREATE TABLE [dbo].[GamePlayers] (
    [GamePlayerId] bigint IDENTITY(1,1) NOT NULL,
    [HouseId] bigint  NOT NULL,
    [PlayerId] bigint  NOT NULL,
    [Game_GameId] bigint  NOT NULL
);
GO

-- Creating table 'GameResults'
CREATE TABLE [dbo].[GameResults] (
    [GameResultId] bigint IDENTITY(1,1) NOT NULL,
    [Place] int  NOT NULL,
    [GameGameResult_GameResult_GameId] bigint  NOT NULL,
    [GamePlayer_GamePlayerId] bigint  NOT NULL
);
GO

-- Creating table 'Ports'
CREATE TABLE [dbo].[Ports] (
    [PortId] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Region_RegionId] bigint  NOT NULL
);
GO

-- Creating table 'RegionRelationships'
CREATE TABLE [dbo].[RegionRelationships] (
    [RegionRelationshipId] bigint IDENTITY(1,1) NOT NULL,
    [DestinationRegionId] bigint  NOT NULL,
    [BridgeRegionId] bigint  NOT NULL,
    [SourceRegion_RegionId] bigint  NOT NULL
);
GO

-- Creating table 'Trivias'
CREATE TABLE [dbo].[Trivias] (
    [TriviaId] bigint IDENTITY(1,1) NOT NULL,
    [QuestionText] nvarchar(max)  NOT NULL,
    [AnswerText] nvarchar(max)  NULL
);
GO

-- Creating table 'DidYouKnows'
CREATE TABLE [dbo].[DidYouKnows] (
    [DidYouKnowId] bigint IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TriviaAlternatives'
CREATE TABLE [dbo].[TriviaAlternatives] (
    [TriviaAlternativeId] bigint IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [IsCorrect] bit  NOT NULL,
    [Trivia_TriviaId] bigint  NOT NULL
);
GO

-- Creating table 'PlayerTrophy'
CREATE TABLE [dbo].[PlayerTrophy] (
    [Player_PlayerId] int  NOT NULL,
    [Trophys_TrophyId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PlayerId] in table 'Players'
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [PK_Players]
    PRIMARY KEY CLUSTERED ([PlayerId] ASC);
GO

-- Creating primary key on [HouseId] in table 'Houses'
ALTER TABLE [dbo].[Houses]
ADD CONSTRAINT [PK_Houses]
    PRIMARY KEY CLUSTERED ([HouseId] ASC);
GO

-- Creating primary key on [CharacterId] in table 'Characters'
ALTER TABLE [dbo].[Characters]
ADD CONSTRAINT [PK_Characters]
    PRIMARY KEY CLUSTERED ([CharacterId] ASC);
GO

-- Creating primary key on [RegionId] in table 'Regions'
ALTER TABLE [dbo].[Regions]
ADD CONSTRAINT [PK_Regions]
    PRIMARY KEY CLUSTERED ([RegionId] ASC);
GO

-- Creating primary key on [HouseCardId] in table 'HouseCards'
ALTER TABLE [dbo].[HouseCards]
ADD CONSTRAINT [PK_HouseCards]
    PRIMARY KEY CLUSTERED ([HouseCardId] ASC);
GO

-- Creating primary key on [TrophyId] in table 'Trophys'
ALTER TABLE [dbo].[Trophys]
ADD CONSTRAINT [PK_Trophys]
    PRIMARY KEY CLUSTERED ([TrophyId] ASC);
GO

-- Creating primary key on [GameId] in table 'Games'
ALTER TABLE [dbo].[Games]
ADD CONSTRAINT [PK_Games]
    PRIMARY KEY CLUSTERED ([GameId] ASC);
GO

-- Creating primary key on [RoundId] in table 'Rounds'
ALTER TABLE [dbo].[Rounds]
ADD CONSTRAINT [PK_Rounds]
    PRIMARY KEY CLUSTERED ([RoundId] ASC);
GO

-- Creating primary key on [RegionStatusId] in table 'RegionStatuses'
ALTER TABLE [dbo].[RegionStatuses]
ADD CONSTRAINT [PK_RegionStatuses]
    PRIMARY KEY CLUSTERED ([RegionStatusId] ASC);
GO

-- Creating primary key on [MoveId] in table 'Moves'
ALTER TABLE [dbo].[Moves]
ADD CONSTRAINT [PK_Moves]
    PRIMARY KEY CLUSTERED ([MoveId] ASC);
GO

-- Creating primary key on [InfluenceTrackId] in table 'InfluenceTrackStatuses'
ALTER TABLE [dbo].[InfluenceTrackStatuses]
ADD CONSTRAINT [PK_InfluenceTrackStatuses]
    PRIMARY KEY CLUSTERED ([InfluenceTrackId] ASC);
GO

-- Creating primary key on [GamePlayerId] in table 'GamePlayers'
ALTER TABLE [dbo].[GamePlayers]
ADD CONSTRAINT [PK_GamePlayers]
    PRIMARY KEY CLUSTERED ([GamePlayerId] ASC);
GO

-- Creating primary key on [GameResultId] in table 'GameResults'
ALTER TABLE [dbo].[GameResults]
ADD CONSTRAINT [PK_GameResults]
    PRIMARY KEY CLUSTERED ([GameResultId] ASC);
GO

-- Creating primary key on [PortId] in table 'Ports'
ALTER TABLE [dbo].[Ports]
ADD CONSTRAINT [PK_Ports]
    PRIMARY KEY CLUSTERED ([PortId] ASC);
GO

-- Creating primary key on [RegionRelationshipId] in table 'RegionRelationships'
ALTER TABLE [dbo].[RegionRelationships]
ADD CONSTRAINT [PK_RegionRelationships]
    PRIMARY KEY CLUSTERED ([RegionRelationshipId] ASC);
GO

-- Creating primary key on [TriviaId] in table 'Trivias'
ALTER TABLE [dbo].[Trivias]
ADD CONSTRAINT [PK_Trivias]
    PRIMARY KEY CLUSTERED ([TriviaId] ASC);
GO

-- Creating primary key on [DidYouKnowId] in table 'DidYouKnows'
ALTER TABLE [dbo].[DidYouKnows]
ADD CONSTRAINT [PK_DidYouKnows]
    PRIMARY KEY CLUSTERED ([DidYouKnowId] ASC);
GO

-- Creating primary key on [TriviaAlternativeId] in table 'TriviaAlternatives'
ALTER TABLE [dbo].[TriviaAlternatives]
ADD CONSTRAINT [PK_TriviaAlternatives]
    PRIMARY KEY CLUSTERED ([TriviaAlternativeId] ASC);
GO

-- Creating primary key on [Player_PlayerId], [Trophys_TrophyId] in table 'PlayerTrophy'
ALTER TABLE [dbo].[PlayerTrophy]
ADD CONSTRAINT [PK_PlayerTrophy]
    PRIMARY KEY NONCLUSTERED ([Player_PlayerId], [Trophys_TrophyId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [House_HouseId] in table 'Characters'
ALTER TABLE [dbo].[Characters]
ADD CONSTRAINT [FK_HouseCharacter]
    FOREIGN KEY ([House_HouseId])
    REFERENCES [dbo].[Houses]
        ([HouseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HouseCharacter'
CREATE INDEX [IX_FK_HouseCharacter]
ON [dbo].[Characters]
    ([House_HouseId]);
GO

-- Creating foreign key on [Player_PlayerId] in table 'PlayerTrophy'
ALTER TABLE [dbo].[PlayerTrophy]
ADD CONSTRAINT [FK_PlayerTrophy_Player]
    FOREIGN KEY ([Player_PlayerId])
    REFERENCES [dbo].[Players]
        ([PlayerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Trophys_TrophyId] in table 'PlayerTrophy'
ALTER TABLE [dbo].[PlayerTrophy]
ADD CONSTRAINT [FK_PlayerTrophy_Trophy]
    FOREIGN KEY ([Trophys_TrophyId])
    REFERENCES [dbo].[Trophys]
        ([TrophyId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerTrophy_Trophy'
CREATE INDEX [IX_FK_PlayerTrophy_Trophy]
ON [dbo].[PlayerTrophy]
    ([Trophys_TrophyId]);
GO

-- Creating foreign key on [Game_GameId] in table 'Rounds'
ALTER TABLE [dbo].[Rounds]
ADD CONSTRAINT [FK_GameRound]
    FOREIGN KEY ([Game_GameId])
    REFERENCES [dbo].[Games]
        ([GameId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameRound'
CREATE INDEX [IX_FK_GameRound]
ON [dbo].[Rounds]
    ([Game_GameId]);
GO

-- Creating foreign key on [Game_GameId] in table 'GamePlayers'
ALTER TABLE [dbo].[GamePlayers]
ADD CONSTRAINT [FK_GameGamePlayer]
    FOREIGN KEY ([Game_GameId])
    REFERENCES [dbo].[Games]
        ([GameId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameGamePlayer'
CREATE INDEX [IX_FK_GameGamePlayer]
ON [dbo].[GamePlayers]
    ([Game_GameId]);
GO

-- Creating foreign key on [Region_RegionId] in table 'RegionStatuses'
ALTER TABLE [dbo].[RegionStatuses]
ADD CONSTRAINT [FK_RegionRegionStatus]
    FOREIGN KEY ([Region_RegionId])
    REFERENCES [dbo].[Regions]
        ([RegionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RegionRegionStatus'
CREATE INDEX [IX_FK_RegionRegionStatus]
ON [dbo].[RegionStatuses]
    ([Region_RegionId]);
GO

-- Creating foreign key on [Character_CharacterId] in table 'HouseCards'
ALTER TABLE [dbo].[HouseCards]
ADD CONSTRAINT [FK_CharacterHouseCard]
    FOREIGN KEY ([Character_CharacterId])
    REFERENCES [dbo].[Characters]
        ([CharacterId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CharacterHouseCard'
CREATE INDEX [IX_FK_CharacterHouseCard]
ON [dbo].[HouseCards]
    ([Character_CharacterId]);
GO

-- Creating foreign key on [Round_RoundId] in table 'RegionStatuses'
ALTER TABLE [dbo].[RegionStatuses]
ADD CONSTRAINT [FK_RoundRegionStatus]
    FOREIGN KEY ([Round_RoundId])
    REFERENCES [dbo].[Rounds]
        ([RoundId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoundRegionStatus'
CREATE INDEX [IX_FK_RoundRegionStatus]
ON [dbo].[RegionStatuses]
    ([Round_RoundId]);
GO

-- Creating foreign key on [GamePlayerMove_Move_GamePlayerId] in table 'Moves'
ALTER TABLE [dbo].[Moves]
ADD CONSTRAINT [FK_GamePlayerMove]
    FOREIGN KEY ([GamePlayerMove_Move_GamePlayerId])
    REFERENCES [dbo].[GamePlayers]
        ([GamePlayerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GamePlayerMove'
CREATE INDEX [IX_FK_GamePlayerMove]
ON [dbo].[Moves]
    ([GamePlayerMove_Move_GamePlayerId]);
GO

-- Creating foreign key on [Round_RoundId] in table 'Moves'
ALTER TABLE [dbo].[Moves]
ADD CONSTRAINT [FK_RoundMove]
    FOREIGN KEY ([Round_RoundId])
    REFERENCES [dbo].[Rounds]
        ([RoundId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoundMove'
CREATE INDEX [IX_FK_RoundMove]
ON [dbo].[Moves]
    ([Round_RoundId]);
GO

-- Creating foreign key on [Round_RoundId] in table 'InfluenceTrackStatuses'
ALTER TABLE [dbo].[InfluenceTrackStatuses]
ADD CONSTRAINT [FK_RoundInfluenceTrackStatus]
    FOREIGN KEY ([Round_RoundId])
    REFERENCES [dbo].[Rounds]
        ([RoundId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoundInfluenceTrackStatus'
CREATE INDEX [IX_FK_RoundInfluenceTrackStatus]
ON [dbo].[InfluenceTrackStatuses]
    ([Round_RoundId]);
GO

-- Creating foreign key on [GameGameResult_GameResult_GameId] in table 'GameResults'
ALTER TABLE [dbo].[GameResults]
ADD CONSTRAINT [FK_GameGameResult]
    FOREIGN KEY ([GameGameResult_GameResult_GameId])
    REFERENCES [dbo].[Games]
        ([GameId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameGameResult'
CREATE INDEX [IX_FK_GameGameResult]
ON [dbo].[GameResults]
    ([GameGameResult_GameResult_GameId]);
GO

-- Creating foreign key on [GamePlayer_GamePlayerId] in table 'GameResults'
ALTER TABLE [dbo].[GameResults]
ADD CONSTRAINT [FK_GamePlayerGameResult]
    FOREIGN KEY ([GamePlayer_GamePlayerId])
    REFERENCES [dbo].[GamePlayers]
        ([GamePlayerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GamePlayerGameResult'
CREATE INDEX [IX_FK_GamePlayerGameResult]
ON [dbo].[GameResults]
    ([GamePlayer_GamePlayerId]);
GO

-- Creating foreign key on [Region_RegionId] in table 'Ports'
ALTER TABLE [dbo].[Ports]
ADD CONSTRAINT [FK_RegionPort]
    FOREIGN KEY ([Region_RegionId])
    REFERENCES [dbo].[Regions]
        ([RegionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RegionPort'
CREATE INDEX [IX_FK_RegionPort]
ON [dbo].[Ports]
    ([Region_RegionId]);
GO

-- Creating foreign key on [SourceRegion_RegionId] in table 'RegionRelationships'
ALTER TABLE [dbo].[RegionRelationships]
ADD CONSTRAINT [FK_RegionRegionRelationship]
    FOREIGN KEY ([SourceRegion_RegionId])
    REFERENCES [dbo].[Regions]
        ([RegionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RegionRegionRelationship'
CREATE INDEX [IX_FK_RegionRegionRelationship]
ON [dbo].[RegionRelationships]
    ([SourceRegion_RegionId]);
GO

-- Creating foreign key on [Port_PortId] in table 'RegionStatuses'
ALTER TABLE [dbo].[RegionStatuses]
ADD CONSTRAINT [FK_RegionStatusPort]
    FOREIGN KEY ([Port_PortId])
    REFERENCES [dbo].[Ports]
        ([PortId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RegionStatusPort'
CREATE INDEX [IX_FK_RegionStatusPort]
ON [dbo].[RegionStatuses]
    ([Port_PortId]);
GO

-- Creating foreign key on [Trivia_TriviaId] in table 'TriviaAlternatives'
ALTER TABLE [dbo].[TriviaAlternatives]
ADD CONSTRAINT [FK_TriviaTriviaAlternative]
    FOREIGN KEY ([Trivia_TriviaId])
    REFERENCES [dbo].[Trivias]
        ([TriviaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TriviaTriviaAlternative'
CREATE INDEX [IX_FK_TriviaTriviaAlternative]
ON [dbo].[TriviaAlternatives]
    ([Trivia_TriviaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------