Create database musicProject;
use musicProject;

Create table actor (
	actId int primary key,
    actFname char(20),
    actLname char(20),
    actGender char(1)
);

Create table genres (
	genId int primary key,
    genTitle char(20)
);

Create table director (
	dirId int primary key,
    dirFname char(20),
    dirLname char(20)
);

Create table movie (
	movId int primary key,
    movTitle char(50),
    movYear int,
    movTime int,
    movLang char(50),
    movDateRelease date,
    movReleaseCountry char(5)
);

Create table movieGenres (
	movId int,
    foreign key(movId) references movie(movId),
    genId int,
    foreign key(genId) references genres(genId)
);

Create table movieDirector (
	dirId int,
    foreign key(dirId) references director(dirId),
    movId int,
    foreign key(movId) references movie(movId)
);

Create table reviewer (
	revId int primary key,
    revName char(30)
);

Create table rating (
	movId int,
    foreign key(movId) references movie(movId),
    revId int,
    foreign key(revId) references reviewer(revId),
    revStars decimal(3,1),
    numOfRating int
);

Create table movieCast (
	actId int,
    foreign key(actId) references actor(actId),
    movId int,
    foreign key(movId) references movie(movId),
    roles char(30)
);

Select * from actor;
Select * from director;
Select * from genres;
Select * from movie;
Select * from movieGenres;
Select * from movieDirector;
Select * from rating;
Select * from movieCast;
Select * from reviewer;

Insert into movie values
(901,'Vertigo',1958,128,'English','1958-08-24','UK'),
(902, 'The Innocents', 1961, 100, 'English', '1962-02-19', 'SW'),
(903, 'Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
(904, 'The Deer Hunter', 1978, 183, 'English', '1979-03-08', 'UK'),
(905, 'Amadeus', 1984, 160, 'English', '1985-01-07', 'UK'),
(906, 'Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
(907, 'Eyes Wide Shut', 1999, 159, 'English', NULL, 'UK'),
(908, 'The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
(909, 'Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
(910, 'Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
(911, 'Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
(912, 'Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
(913, 'The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
(914, 'American Beauty', 1999, 122, 'English', NULL, 'UK'),
(915, 'Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
(916, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
(917, 'Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
(918, 'Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
(919, 'The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
(920, 'Donnie Darko', 2001, 113, 'English', NULL, 'UK'),
(921, 'Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
(922, 'Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
(923, 'Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
(924, 'Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
(926, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
(927, 'Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
(928, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK'),
(925, 'Braveheart', 1995, 178, 'English', '1995-09-08', 'UK');

Insert into rating values
(901, 9001, 8.4, 263575),
(902, 9002, 7.9, 20207),
(903, 9003, 8.3, 202778),
(906, 9005, 8.2, 484746),
(924, 9006, 7.3, NULL),
(908, 9007, 8.6, 779489),
(909, 9008, NULL, 227235),
(910, 9009, 3, 195961),
(911, 9010, 8.1, 203875),
(912, 9011, 8.4, NULL),
(914, 9013, 7, 862618),
(915, 9001, 7.7, 830095),
(916, 9014, 4, 642132),
(925, 9015, 7.7, 81328),
(918, 9016, NULL, 580301),
(920, 9017, 8.1, 609451),
(921, 9018, 8, 667758),
(922, 9019, 8.4, 511613),
(923, 9020, 6.7, 13091);

# 1) Write a SQL query to find the name and year of the movies. Return movie title, movie year.

Select movTitle, movYear from movie;

# 2) Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

Select movYear from movie
where movTitle = 'American Beauty';

# 3) Write a SQL query to find the movie that was released in 1999. Return movie title.

Select movTitle from movie
where movYear = 1999;

# 4) Write a SQL query to find those movies, which were released before 1998. Return movie title.

Select movTitle from movie
where movYear < 1998;

# 5) Write a SQL query to find the name of all reviewers and movies together in a single list.

Select revName from reviewer where revName is not null
Union
Select movTitle from movie;

# 6) Write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name.

Select revName from reviewer
inner join rating on reviewer.revId = rating.revId
where rating.revStars >= 7
and reviewer.revName is not null;

# 7) Write a SQL query to find the movies without any rating. Return movie title.

Select movTitle from movie
where movId not in (Select movId from rating);

# 8) Write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.

Select movTitle from movie
where movId in (905,907,917);

# 9) Write a SQL query to find the movie titles that contain the word 'Boogie Nights'. Sort the result-set in ascending order by movie year.
# 	 Return movie ID, movie title and movie release year.

Select movId, movTitle, movYear from movie
where movTitle like '%Boogie Nights%'
order by movYear;

# 10) Write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID.

Select actId from actor
where actFname = 'Woody' and actLname = 'Allen';

# 11) Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.

# Using joins

Select actor.actId, actor.actFname, actor.actLname, actor.actGender from actor
inner join movieCast on actor.actId = movieCast.actId
inner join movie on movie.movId = movieCast.movId
where movie.movTitle = 'Annie Hall';

# Using subqueries
Select * from actor where actId in (
Select actId from movieCast where movId in (
Select movId from movie where movTitle = 'Annie Hall'));

# 12) Write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. Return director first name, last name.

Select dirFname, dirLname from director where dirId in (
Select dirId from movieDirector where movId in (
Select movId from movieCast where roles = Any (
Select roles from movieCast where movId in (
Select movId from movie
where movTitle = 'Eyes Wide Shut'))));

# 13) Write a SQL query to find those movies that have been released in countries other than the United Kingdom.
# Return movie title, movie year, movie time, and date of release, releasing country.

Select movTitle, movYear, movTime, movDateRelease, movReleaseCountry from movie
where movReleaseCountry not in ('UK');

# 14) Write a SQL query to find for movies whose reviewer is unknown. Return movie title, year, release date, director first name, last name, actor first name, last name.

Select movTitle, movYear, movDateRelease, dirFname, dirLname, actFname, actLname
from movie m, movieDirector md, director d, actor a, movieCast mc, reviewer re, rating ra
where m.movId = md.movId
and md.dirId = d.dirId
and m.movId = mc.movId
and mc.actId = a.actId
and m.movId = ra.movId
and ra.revId = re.revId
and re.revName is Null;

# 15) Write a SQL query to find those movies directed by the director whose first name is Woddy and last name is Allen. Return movie title.

Select movTitle from movie m 
inner join movieDirector md on m.movId = md.movId
inner join director d on md.dirId = d.dirId
where d.dirFname = 'Woody' and d.dirLname = 'Allen';

# 16) Write a SQL query to determine those years in which there was at least one movie that received a rating of at least three stars.
# Sort the result-set in ascending order by movie year. Return movie year.

Select distinct movYear from movie where movId in (
Select movId from rating
where revStars >= 3)
order by movYear;

# 17) Write a SQL query to search for movies that do not have any ratings. Return movie title.

Select distinct movTitle from movie where movId not in (
Select movId from rating);

# 18) Write a SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.

Select revName from reviewer
where revId in (
	Select revId from rating
    where revStars is null);

# 19) Write a SQL query to find movies that have been reviewed by a reviewer and received a rating.
# Sort the result-set in ascending order by reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.

Select revName, movTitle, revStars from 
rating r, reviewer re, movie m
where m.movId = r.movId
and r.revId = re.revId
and r.revStars is not null
and re.revName is not null
order by revName, movTitle, revStars;

# 20) Write a SQL query to find those movies, which have received highest number of stars.
# Group the result set on movie title and sorts the result-set in ascending order by movie title. Return movie title and maximum number of review stars.

Select movTitle, max(revStars) from movie m 
inner join rating r on m.movId = r.movId
and r.revStars is not null
group by movTitle
order by movTitle;

# 21) Write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.

Select distinct revName from reviewer r
inner join rating ra on r.revId = ra.revId
inner join movie m on ra.movId = m.movId
where movTitle = 'American Beauty';

# 22) Write a SQL query to find the movies with the lowest ratings. Return reviewer name, movie title, and number of stars for those movies.

Select re.revName, m.movTitle, r.revStars from movie m
inner join rating r on r.movId = m.movId
inner join reviewer re on re.revId = r.revId
where r.revStars = (Select min(revStars) from rating);

# 23) Write a SQL query to find the movies directed by 'James Cameron'. Return movie title.

Select movTitle from movie m
inner join movieDirector md on m.movId = md.movId
inner join director d on d.dirId = md.dirId
where d.dirFname = 'James' and d.dirLname = 'Cameron';

# 24) Write a query in SQL to find the movies in which one or more actors appeared in more than one film.

Select movTitle from movie m
inner join movieCast mc on mc.movId = m.movId
inner join actor a on a.actId = mc.actId
where a.actId in 
	(Select actId from movieCast
	 group by actId
     having count(actId) > 1);

# 25) Write a SQL query to find all reviewers whose ratings contain a NULL value. Return reviewer name.

Select revName from reviewer re
inner join rating r on r.revId = re.revId
where r.revStars is Null;

# 26) Write a SQL query to find out who was cast in the movie 'Annie Hall'. Return actor first name, last name and role.

Select actFname, actLname, roles from actor a
inner join movieCast mc on mc.actId = a.actId
inner join movie m on m.movId = mc.movId
where m.movTitle = 'Annie Hall';

# 27) Write a SQL query to find the director who directed a movie that featured a role in 'Eyes Wide Shut'. Return director first name, last name and movie title.

Select dirFname, dirLname, movTitle from director d
inner join movieDirector md on md.dirId = d.dirId
inner join movie m on m.movId = md.movId
inner join movieCast mc on mc.movId = m.movId
where mc.roles is not null and m.movTitle = 'Eyes Wide Shut';

# 28) Write a SQL query to find the director of a movie that cast a role as Sean Maguire. Return director first name, last name and movie title.

Select dirFname, dirLname, movTitle from director d
inner join movieDirector md on md.dirId = d.dirId
inner join movie m on m.movId = md.movId
inner join movieCast mc on mc.movId = m.movId
where mc.roles = 'Sean Maguire';

# 29) Write a SQL query to find out which actors have not appeared in any movies between 1990 and 2000 (Begin and end values are included.).
# Return actor first name, last name, movie title and release year.

Select actFname, actLname, movTitle, movYear from actor a
inner join movieCast mc on mc.actId = a.actId
inner join movie m on m.movId = mc.movId
where m.movYear not between 1990 and 2000;

# 30) Write a SQL query to find the directors who have directed films in a variety of genres. Group the result set on director first name, last name and generic title.
# Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.

Select dirFname, dirLname, count(g.genId) from director d
inner join movieDirector md on md.dirId = d.dirId
inner join movieGenres mg on mg.movId = md.movId
inner join genres g on g.genId = mg.genId
group by d.dirFname, d.dirLname, g.genTitle
order by d.dirFname, d.dirLname;

# 31) Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

Select movTitle, movYear, genTitle from movie m
inner join movieGenres mg on mg.movId = m.movId
inner join genres g on g.genId = mg.genId;

# 32) Write a SQL query to find all the movies with year, genres, and name of the director.

Select movTitle, movYear, genTitle, dirFname, dirLname from movie m
inner join movieGenres mg on mg.movId = m.movId
inner join genres g on g.genId = mg.genId
inner join movieDirector md on md.movId = m.movId
inner join director d on d.dirId = md.dirId;

# 33) Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release.
# Return movie title, release year, date of release, duration, and first and last name of the director.

Select movTitle, movYear, movDateRelease, movTime, dirFname, dirLname from movie m
inner join movieDirector md on md.movId = m.movId
inner join director d on d.dirId = md.dirId
where m.movDateRelease < '1989-01-01'
order by m.movDateRelease desc;

# 34) Write a SQL query to calculate the average movie length and count the number of movies in each genre.
# Return genre title, average time and number of movies for each genre.

Select genTitle, avg(movTime), count(genTitle) from movie m
inner join movieGenres mg on mg.movId = m.movId
inner join genres g on g.genId = mg.genId
group by g.genTitle;