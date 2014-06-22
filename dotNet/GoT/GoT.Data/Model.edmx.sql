
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/22/2014 14:09:02
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
IF OBJECT_ID(N'[dbo].[FK_GameRound]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rounds] DROP CONSTRAINT [FK_GameRound];
GO
IF OBJECT_ID(N'[dbo].[FK_GameGamePlayer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GamePlayers] DROP CONSTRAINT [FK_GameGamePlayer];
GO
IF OBJECT_ID(N'[dbo].[FK_RegionRegionStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegionStatuses] DROP CONSTRAINT [FK_RegionRegionStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_RoundRegionStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegionStatuses] DROP CONSTRAINT [FK_RoundRegionStatus];
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
IF OBJECT_ID(N'[dbo].[FK_HouseHouseCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HouseCards] DROP CONSTRAINT [FK_HouseHouseCard];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerPlayerTrophy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlayerTrophies] DROP CONSTRAINT [FK_PlayerPlayerTrophy];
GO
IF OBJECT_ID(N'[dbo].[FK_TrophyPlayerTrophy]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlayerTrophies] DROP CONSTRAINT [FK_TrophyPlayerTrophy];
GO
IF OBJECT_ID(N'[dbo].[FK_RegionRelationshipRelationshipBridge]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RelationshipBridges] DROP CONSTRAINT [FK_RegionRelationshipRelationshipBridge];
GO
IF OBJECT_ID(N'[dbo].[FK_RoundWesterosCardStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rounds] DROP CONSTRAINT [FK_RoundWesterosCardStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_GamePlayerHouseCardStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HouseCardStatuses] DROP CONSTRAINT [FK_GamePlayerHouseCardStatus];
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
IF OBJECT_ID(N'[dbo].[PlayerTrophies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlayerTrophies];
GO
IF OBJECT_ID(N'[dbo].[RelationshipBridges]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RelationshipBridges];
GO
IF OBJECT_ID(N'[dbo].[WesterosCardStatuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WesterosCardStatuses];
GO
IF OBJECT_ID(N'[dbo].[WesterosCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WesterosCards];
GO
IF OBJECT_ID(N'[dbo].[HouseCardStatuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HouseCardStatuses];
GO
IF OBJECT_ID(N'[dbo].[ErrorLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ErrorLogs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Players'
CREATE TABLE [dbo].[Players] (
    [PlayerId] bigint IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NULL,
    [City] nvarchar(max)  NULL,
    [Country] nvarchar(max)  NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [IsAdmin] bit  NOT NULL
);
GO

-- Creating table 'Houses'
CREATE TABLE [dbo].[Houses] (
    [HouseId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Sigil] varbinary(max)  NULL,
    [CapitalRegionId] bigint  NOT NULL
);
GO

-- Creating table 'Characters'
CREATE TABLE [dbo].[Characters] (
    [CharacterId] bigint  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [NickName] nvarchar(max)  NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [Image] varbinary(max)  NULL,
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
    [HouseCardId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [CombatStrength] int  NOT NULL,
    [SwordCount] int  NOT NULL,
    [TowerCount] int  NOT NULL,
    [CharacterId] bigint  NOT NULL,
    [House_HouseId] int  NOT NULL
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
    [Status] nvarchar(max)  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [CreatedByPlayerId] bigint  NOT NULL
);
GO

-- Creating table 'Rounds'
CREATE TABLE [dbo].[Rounds] (
    [RoundId] bigint IDENTITY(1,1) NOT NULL,
    [RoundNumber] int  NOT NULL,
    [WildlingCount] int  NOT NULL,
    [WildlingAttack] bit  NOT NULL,
    [WildlingVictory] bit  NULL,
    [Game_GameId] bigint  NOT NULL,
    [WesterosCardStatus_WesterosCardStatusId] bigint  NOT NULL
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
    [GamePlayerId] bigint  NOT NULL,
    [FromRegionId] bigint  NOT NULL,
    [ToRegionId] bigint  NOT NULL,
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

-- Creating table 'PlayerTrophies'
CREATE TABLE [dbo].[PlayerTrophies] (
    [PlayerTrophyId] bigint IDENTITY(1,1) NOT NULL,
    [DateAchieved] datetime  NOT NULL,
    [Player_PlayerId] bigint  NOT NULL,
    [Trophy_TrophyId] int  NOT NULL
);
GO

-- Creating table 'RelationshipBridges'
CREATE TABLE [dbo].[RelationshipBridges] (
    [RelationshipBridgeId] bigint IDENTITY(1,1) NOT NULL,
    [BridgeRegionId] bigint  NOT NULL,
    [RegionRelationshipRelationshipBridge_RelationshipBridge_RegionRelationshipId] bigint  NOT NULL
);
GO

-- Creating table 'WesterosCardStatuses'
CREATE TABLE [dbo].[WesterosCardStatuses] (
    [WesterosCardStatusId] bigint IDENTITY(1,1) NOT NULL,
    [DeckOneId] bigint  NOT NULL,
    [DeckTwoId] bigint  NOT NULL,
    [DeckThreeId] bigint  NOT NULL
);
GO

-- Creating table 'WesterosCards'
CREATE TABLE [dbo].[WesterosCards] (
    [WesterosCardId] bigint  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Deck] int  NOT NULL
);
GO

-- Creating table 'HouseCardStatuses'
CREATE TABLE [dbo].[HouseCardStatuses] (
    [HouseCardStatusId] bigint IDENTITY(1,1) NOT NULL,
    [HouseCardId] bigint  NOT NULL,
    [IsAvailable] bit  NOT NULL,
    [GamePlayerHouseCardStatus_HouseCardStatus_GamePlayerId] bigint  NOT NULL
);
GO

-- Creating table 'ErrorLogs'
CREATE TABLE [dbo].[ErrorLogs] (
    [ErrorLogId] bigint IDENTITY(1,1) NOT NULL,
    [Timestamp] datetime  NOT NULL,
    [ErrorCode] nvarchar(max)  NULL,
    [ErrorMessage] nvarchar(max)  NOT NULL,
    [Method] nvarchar(max)  NOT NULL,
    [StackTrace] nvarchar(max)  NULL
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

-- Creating primary key on [PlayerTrophyId] in table 'PlayerTrophies'
ALTER TABLE [dbo].[PlayerTrophies]
ADD CONSTRAINT [PK_PlayerTrophies]
    PRIMARY KEY CLUSTERED ([PlayerTrophyId] ASC);
GO

-- Creating primary key on [RelationshipBridgeId] in table 'RelationshipBridges'
ALTER TABLE [dbo].[RelationshipBridges]
ADD CONSTRAINT [PK_RelationshipBridges]
    PRIMARY KEY CLUSTERED ([RelationshipBridgeId] ASC);
GO

-- Creating primary key on [WesterosCardStatusId] in table 'WesterosCardStatuses'
ALTER TABLE [dbo].[WesterosCardStatuses]
ADD CONSTRAINT [PK_WesterosCardStatuses]
    PRIMARY KEY CLUSTERED ([WesterosCardStatusId] ASC);
GO

-- Creating primary key on [WesterosCardId] in table 'WesterosCards'
ALTER TABLE [dbo].[WesterosCards]
ADD CONSTRAINT [PK_WesterosCards]
    PRIMARY KEY CLUSTERED ([WesterosCardId] ASC);
GO

-- Creating primary key on [HouseCardStatusId] in table 'HouseCardStatuses'
ALTER TABLE [dbo].[HouseCardStatuses]
ADD CONSTRAINT [PK_HouseCardStatuses]
    PRIMARY KEY CLUSTERED ([HouseCardStatusId] ASC);
GO

-- Creating primary key on [ErrorLogId] in table 'ErrorLogs'
ALTER TABLE [dbo].[ErrorLogs]
ADD CONSTRAINT [PK_ErrorLogs]
    PRIMARY KEY CLUSTERED ([ErrorLogId] ASC);
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

-- Creating foreign key on [House_HouseId] in table 'HouseCards'
ALTER TABLE [dbo].[HouseCards]
ADD CONSTRAINT [FK_HouseHouseCard]
    FOREIGN KEY ([House_HouseId])
    REFERENCES [dbo].[Houses]
        ([HouseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HouseHouseCard'
CREATE INDEX [IX_FK_HouseHouseCard]
ON [dbo].[HouseCards]
    ([House_HouseId]);
GO

-- Creating foreign key on [Player_PlayerId] in table 'PlayerTrophies'
ALTER TABLE [dbo].[PlayerTrophies]
ADD CONSTRAINT [FK_PlayerPlayerTrophy]
    FOREIGN KEY ([Player_PlayerId])
    REFERENCES [dbo].[Players]
        ([PlayerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerPlayerTrophy'
CREATE INDEX [IX_FK_PlayerPlayerTrophy]
ON [dbo].[PlayerTrophies]
    ([Player_PlayerId]);
GO

-- Creating foreign key on [Trophy_TrophyId] in table 'PlayerTrophies'
ALTER TABLE [dbo].[PlayerTrophies]
ADD CONSTRAINT [FK_TrophyPlayerTrophy]
    FOREIGN KEY ([Trophy_TrophyId])
    REFERENCES [dbo].[Trophys]
        ([TrophyId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TrophyPlayerTrophy'
CREATE INDEX [IX_FK_TrophyPlayerTrophy]
ON [dbo].[PlayerTrophies]
    ([Trophy_TrophyId]);
GO

-- Creating foreign key on [RegionRelationshipRelationshipBridge_RelationshipBridge_RegionRelationshipId] in table 'RelationshipBridges'
ALTER TABLE [dbo].[RelationshipBridges]
ADD CONSTRAINT [FK_RegionRelationshipRelationshipBridge]
    FOREIGN KEY ([RegionRelationshipRelationshipBridge_RelationshipBridge_RegionRelationshipId])
    REFERENCES [dbo].[RegionRelationships]
        ([RegionRelationshipId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RegionRelationshipRelationshipBridge'
CREATE INDEX [IX_FK_RegionRelationshipRelationshipBridge]
ON [dbo].[RelationshipBridges]
    ([RegionRelationshipRelationshipBridge_RelationshipBridge_RegionRelationshipId]);
GO

-- Creating foreign key on [WesterosCardStatus_WesterosCardStatusId] in table 'Rounds'
ALTER TABLE [dbo].[Rounds]
ADD CONSTRAINT [FK_RoundWesterosCardStatus]
    FOREIGN KEY ([WesterosCardStatus_WesterosCardStatusId])
    REFERENCES [dbo].[WesterosCardStatuses]
        ([WesterosCardStatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoundWesterosCardStatus'
CREATE INDEX [IX_FK_RoundWesterosCardStatus]
ON [dbo].[Rounds]
    ([WesterosCardStatus_WesterosCardStatusId]);
GO

-- Creating foreign key on [GamePlayerHouseCardStatus_HouseCardStatus_GamePlayerId] in table 'HouseCardStatuses'
ALTER TABLE [dbo].[HouseCardStatuses]
ADD CONSTRAINT [FK_GamePlayerHouseCardStatus]
    FOREIGN KEY ([GamePlayerHouseCardStatus_HouseCardStatus_GamePlayerId])
    REFERENCES [dbo].[GamePlayers]
        ([GamePlayerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GamePlayerHouseCardStatus'
CREATE INDEX [IX_FK_GamePlayerHouseCardStatus]
ON [dbo].[HouseCardStatuses]
    ([GamePlayerHouseCardStatus_HouseCardStatus_GamePlayerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------