/*Query01*/

/*Finds names of the political party, its leader, candidate, seat, and the number of votes gained by each candidate.*/


Select p.PartyName,p.PartyLeader,cd.CandidateId,c.CandidateName,cd.SeatName,
cd.GainedVotes 
from parties p,winningcandidates cd, candidates c 
where p.PartyId=cd.PartyId and c.CandidateId = cd.CandidateId;

/*Query 02*/
/*total numbers of males and females within each political party,sorted in descending order by the total count of males*/

select p.PartyName,p.PartyId,sum(pp.male) as TotalMales,sum(pp.female) as TotalFemales 
from parties p,partypositions pp 
where p.PartyId=pp.PartyId 
group by p.PartyName 
order by TotalMales DESC;


/*Query 03*/
/*finds the total number of males and females in a specific party (party ID 3).*/

select p.PartyName,p.PartyId,sum(pp.male) as TotalMales,sum(pp.female) as TotalFemales 
from parties p,partypositions pp 
where p.PartyId=pp.PartyId 
group by p.PartyName 
having p.partyId =3;


/*Query 04*/
/*finds the total number of votes gained by each party*/

SELECT 
    p.PartyName,
(
        SELECT 
            SUM(wc.GainedVotes)
        FROM 
            winningcandidates wc
        WHERE 
            wc.PartyId = p.PartyId
    ) AS total_gained_votes
FROM 
    parties p; 


/*Query 05*/
/*
Retrives seat name, Gained votes, Polled votes, Rejected Votes for all the parties. even if not participating (Null)*/

select p.PartyId,p.PartyName,p.Isparticipating,cd.SeatName,cd.PolledVotes,cd.RejectedVotes,cd.GainedVotes 
from parties p 
left join winningcandidates cd 
on p.PartyId = cd.PartyId;


/*Query 06*/
/*This query retrieves the party ID, party name, and corresponding party symbol for each party.*/

select p.PartyId, p.PartyName, ps.PartySymbol 
from partysymbols ps, parties p 
where p.SymbolCode = ps.SymbolCode;

/*Query 07*/
/*Finds all those candidates whose number of gained votes exceed average number of gained votes across all candidates*/

SELECT c.CandidateName,cd.GainedVotes 
FROM candidates c,winningcandidates cd 
WHERE cd.GainedVotes > (SELECT avg(cd.GainedVotes) FROM winningcandidates cd) and c.CandidateId = cd.CandidateId;


/*Query 08*/
/*finds total number of seats by each party including male and female seats.*/

select p.PartyName ,sum(male)+sum(female) as TotalSeats 
from partypositions pp,parties p 
where p.PartyId = pp.PartyId 
group by PartyName;

/*Query 09*/
/*count of winning candidates for each party that gained more than 70,000 votes,and display who have more than 2 winning candidates*/

SELECT p.partyName, COUNT(cd.CandidateId) AS winners_count 
FROM parties p JOIN winningcandidates cd ON p.PartyId = cd.PartyId 
WHERE cd.GainedVotes > 70000 
GROUP BY p.partyName 
HAVING COUNT(cd.CandidateId) > 2 
ORDER BY winners_count DESC;


/*Query 10*/
/*finds how many candidates are associated with each party*/

SELECT PartyId, PartyName,
(
SELECT COUNT(*) 
FROM winningcandidates 
WHERE winningcandidates.PartyId = parties.PartyId
) AS candidate_count FROM parties;
