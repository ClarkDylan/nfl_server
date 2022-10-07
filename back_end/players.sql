DROP DATABASE IF EXISTS nfl_data;
CREATE DATABASE nfl_data;

DROP TABLE IF EXISTS player_list;
CREATE TABLE player_list (
  id SERIAL,
  team_id INTEGER,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  team VARCHAR(30),
  position VARCHAR(5),
  is_healthy TEXT DEFAULT 'true'
);


INSERT INTO player_list (team_id, first_name, last_name, team, position, is_healthy) VALUES
(1, 'Tom', 'Brady', 'Buccaneers', 'QB1', 'true'),
(2, 'Aaron', 'Rodgers', 'Packers', 'QB1', 'true'),
(3, 'Josh', 'Allen', 'Bills', 'QB1', 'true'),
(4, 'Justin', 'Herbert', 'Chargers', 'QB1', 'true'),
(5, 'Patrick', 'Mahomes', 'Chiefs', 'QB1', 'true'),
(6, 'Joe', 'Burrow', 'Bengals', 'QB1', 'true'),
(7,'Lamar', 'Jackson', 'Ravens', 'QB1', 'true'),
(8,'Matthew', 'Stafford', 'Rams', 'QB1', 'true'),
(9, 'Dak', 'Prescott', 'Cowgirls', 'QB1', 'true'),
(10, 'Kyler', 'Murray', 'Cardinals', 'QB1', 'true'),
(11, 'Russell', 'Wilson', 'Broncos', 'QB1', 'true'),
(12, 'Derek', 'Carr', 'Raiders', 'QB1', 'true'),
(13, 'Kirk', 'Cousins', 'Vikings', 'QB1', 'true'),
(14, 'Ryan', 'Tannehil', 'Titans', 'QB1', 'true'),
(15, 'Jalen', 'Hurts', 'Eagles', 'QB1', 'true'),
(16, 'Matt', 'Ryan', 'Colts', 'QB1', 'true'),
(17, 'Mac', 'Jones', 'Patriots', 'QB1', 'true'),
(18, 'Jameis', 'Winston', 'Saints', 'QB1', 'true'),
(19, 'Tua', 'Tagovailoa', 'Dolphins', 'QB1', 'false'),
(20, 'Carson', 'Wentz', 'Commanders', 'QB1', 'true'),
(21, 'Jared', 'Goff', 'Lions', 'QB1', 'true'),
(22, 'Baker', 'Mayfield', 'Panthers', 'QB1', 'true'),
(23, 'Trevor', 'Lawrence', 'Jaguars', 'QB1', 'true'),
(24, 'Trey', 'Lance', '49ers', 'QB1', 'true'),
(25, 'Justin', 'Fields', 'Bears', 'QB1', 'true'),
(26, 'Daniel', 'Jones', 'Giants', 'QB1', 'true'),
(27, 'Geno', 'Smith', 'Seahawks', 'QB1', 'true'),
(28, 'Zach', 'Wilson', 'Jets', 'QB1', 'false'),
(29, 'Marcus', 'Mariota', 'Falcons', 'QB1', 'true'),
(30, 'Mitchell', 'Trubisky', 'Steelers', 'QB1', 'true'),
(31, 'Davis', 'Mills', 'Texans', 'QB1', 'true'),
(32, 'Jacoby', 'Brissett', 'Browns', 'QB1', 'true');

ALTER TABLE player_list ADD CONSTRAINT player_list_pkey PRIMARY KEY (id);

DROP TABLE IF EXISTS team_list;
CREATE TABLE team_list(
  id SERIAL,
  name VARCHAR(30),
  conference VARCHAR(10),
  head_coach TEXT
);

INSERT INTO team_list (name, conference, head_coach) VALUES
('Buccaneers', 'NFC South', 'Todd Bowles'),
('Packers', 'NFC North', 'Matt LaFleur'),
('Bills', 'AFC East', 'Sean McDermott'),
('Chargers', 'AFC West', 'Brandon Staley'),
('Cheifs', 'AFC West', 'Andy Reid'),
('Bengals', 'AFC North', 'Zac Taylor'),
('Ravens', 'AFC North', 'John Harbaugh'),
('Rams', 'NFC West', 'Sean McVay'),
('Cowgirls', 'NFC East', 'Mike McCarthy'),
('Cardinals', 'NFC West', 'Kliff Kingsbury'),
('Broncos', 'AFC West', 'Nathaniel Hackkett'),
('Raiders', 'AFC West', 'Josh McDaniels'),
('Vikings', 'NFC North', 'Kevin OConnel'),
('Titans', 'AFC South', 'Mike Vrabel'),
('Eagles', 'NFC East', 'Nick Sirianni'),
('Colts', 'AFC South', 'Frank Reich'),
('Patriots', 'AFC East', 'Bill Belichick'),
('Saints', 'NFC South', 'Dennis Allen'),
('Dolphins', 'AFC East', 'Mike McDaniel'),
('Commanders', 'NFC East', 'Ron Rivera'),
('Lions', 'NFC North', 'Dan Campbell'),
('Panthers', 'NFC South', 'Matt Rhule'),
('Jaguars','AFC South', 'Doug Pederson'),
('49ers', 'NFC West', 'Kyle Shanahan'),
('Bears', 'NFC North', 'Matt Eberflus'),
('Giants', 'NFC East', 'Brian Daboll'),
('Seahawks', 'NFC West', 'Pete Carroll'),
('Jets', 'AFC East', 'Robert Saleh'),
('Falcons', 'NFC South', 'Arthur Smith'),
('Steelers', 'AFC North', 'Mike Tomlin'),
('Texans', 'AFC South', 'Lovie Smith'),
('Brown', 'AFC North', 'Kevin Stefanski');

ALTER TABLE team_list ADD CONSTRAINT team_list_pkey PRIMARY KEY (id);

ALTER TABLE player_list ADD CONSTRAINT player_list_team_id_fkey FOREIGN KEY (team_id) REFERENCES team_list(id);