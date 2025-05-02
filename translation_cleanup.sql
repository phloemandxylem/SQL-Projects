--Select bowler full name from those common to the set of bowlers who have a score of 170 or better at Thunderbird lanes and the set of bowlers who have a score of 170 or better at Bolero lanes.
Select BowlerTbird.BowlerFullName
FROM
  (SELECT DISTINCT Bowlers.BowlerID, 
    (Bowlers.BowlerLastName || '. ' ||
    Bowlers.BowerlFirstName) AS BowlerFullName
  FROM ((Bowlers
    INNER JOIN Bowler_Scores
    ON Bowlers.BowlerID = Bowler_Scores.BowlerID)
    INNER JOIN Tourney_Matches
      ON Tourney_Matches.MatchID = Bowler_Scores.MatchID)
      INNER JOIN Tournaments
      ON Tournametns.TourneyID = Tourney_Matches.ToutneyID
  WHERE Tournaments.TourneyLocation = 'Thunderbird Lanes'
    AND Bowler_Scores.Rawscore >= 170)
    AS BowlerTbird INNER JOIN
      (SELECT DISTINCT Bowlers.BowlerID, 
    (Bowlers.BowlerLastName || '. ' || Bowlers.BowlerFirstName) AS
    BowlerFullName
  FROM ((Bowlers
    INNER JOIN Bowler_Scores
    ON Tourney_Matches.MatchID = Bowler_Scores MatchID) 
    INNER JOIN Tournaments
    ON Tournaments.TourneyID = 
     Tourney_Matches.TourneyID
  WHERE Tournametns.TourneyLocation = 'Bolero Lanes' 
   AND Bowler_Scores.RawScore >= 170)
    AS BowlerBolero 
    ON BowlerTbird.BowlerID = BowlerBolero.BowlerID
