CREATE database GeneralElections24;
use GeneralElections24;
 CREATE TABLE PartySymbols(SymbolCode int PRIMARY KEY, PartySymbol CHAR(50) UNIQUE NOT NULL);
 CREATE TABLE Parties(PartyID int PRIMARY KEY, PartyName CHAR(50) UNIQUE NOT NULL, PartyLeader CHAR(25) NOT NULL,
	SymbolCode int UNIQUE NOT NULL, IsParticipating BOOL NOT NULL, FOREIGN KEY (SymbolCode) REFERENCES PartySymbols(SymbolCode));
 CREATE TABLE Candidates(CandidateID int PRIMARY KEY, CandidateName CHAR(25) NOT NULL);
 CREATE TABLE WinningCandidates(PartyID int, CandidateID int, SeatName CHAR(50) UNIQUE, 
 	PolledVotes int NOT NULL, RejectedVotes int NOT NULL, GainedVotes int NOT NULL, 
	FOREIGN KEY(PartyID) REFERENCES Parties(PartyID), FOREIGN KEY(CandidateID) REFERENCES Candidates(CandidateID),
	CONSTRAINT PK_WinningCandidates PRIMARY KEY(PartyID,CandidateID) );
 CREATE TABLE PartyPositions(PartyID int, TerritoryIdentity CHAR(50), Male int NOT NULL,
	Female int NOT NULL, FOREIGN KEY(PartyID) REFERENCES Parties(PartyID), 
	CONSTRAINT PK_PartyPositions PRIMARY KEY(PartyID,TerritoryIdentity));
 CREATE TABLE ProvincewiseVoters(ProvinceName CHAR(25) PRIMARY KEY, MaleVoters INT NOT NULL, FemaleVoters int NOT NULL);
 CREATE TABLE SeatsDistribution(ProvinceName CHAR(25) PRIMARY KEY, PronceSeats INT NOT NULL);





 


  