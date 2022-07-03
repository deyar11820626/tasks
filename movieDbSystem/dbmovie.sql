show databases;
create database dbmovie;
use dbmovie;
create table tblmovie
(
movie_id int not null auto_increment,
movie_title tinytext,
movie_year year,
movie_duration int,
movie_country tinytext,
movie_language tinytext,
movie_release_date date,
CONSTRAINT pk_tblmovie PRIMARY KEY (movie_id)
);
describe tblmovie;
create table tblactor
 (actor_id int not null auto_increment,
  actor_first_name tinytext,
  actor_last_name tinytext,
   actor_gender enum('female','male','other'),
   CONSTRAINT pk_tblactor PRIMARY KEY (actor_id)
 );
 create table tbldirector(
 director_id int not null auto_increment,
 director_first_name tinytext,
 director_last_name tinytext,
 CONSTRAINT pk_tbldirector PRIMARY KEY (director_id)
 );
 create table tblreviewer(
 reviewer_id int not null auto_increment,
 reviewer_name tinytext,
  CONSTRAINT pk_tblreviewer PRIMARY KEY (reviewer_id)
 );
 create table tbltrailer (
  trailer_id int not null auto_increment,
  trailer_link text,
  CONSTRAINT pk_tbltrailer PRIMARY KEY (trailer_id)
  );
  create table tblact(
  movie_id int,
  actor_id int,
  act_role enum('Background',' Recurring character','Side character','Series regular'),
   CONSTRAINT fk_tblact_tblmovie FOREIGN KEY (movie_id)
    REFERENCES tblmovie(movie_id),
     CONSTRAINT fk_tblact_tblactor FOREIGN KEY ( actor_id)
    REFERENCES tblactor(actor_id)
  );
  create table tbldirect(
  director_id int,
  movie_id int,
  CONSTRAINT fk_tbldirect_tbldirector FOREIGN KEY (director_id)
    REFERENCES tbldirector(director_id),
  CONSTRAINT fk_tbldirect_tblmovie FOREIGN KEY (movie_id)
    REFERENCES tblmovie( movie_id)
     
  );
  create table tblreview(
  movie_id int ,
  reviewer_id int,
  review_rating int,
    CONSTRAINT fk_tblreview_tblmovie FOREIGN KEY (movie_id)
    REFERENCES tblmovie(movie_id),
    CONSTRAINT fk_tblreview_tblreviewer FOREIGN KEY (reviewer_id)
    REFERENCES tblreviewer(reviewer_id),
     CONSTRAINT chk_review_rating check (review_rating >0 and review_rating <=10)
  );
  ALTER table tbltrailer
ADD movie_id int;
describe tbltrailer;

ALTER TABLE tbltrailer
ADD CONSTRAINT fk_tbltrailer_tblmovie
FOREIGN KEY (movie_id) REFERENCES tblmovie(movie_id);
