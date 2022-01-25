create table vs_acteur
(
    id     int         not null
        primary key,
    nom    varchar(45) not null,
    prenom varchar(45) null
);

create table vs_realisateur
(
    id int not null
        primary key
);

create table vs_user
(
    id           int          not null
        primary key,
    email        varchar(200) not null,
    identifiant  varchar(200) not null,
    motDePasse   varchar(200) not null,
    nom          varchar(200) not null,
    prenom       varchar(250) not null,
    dateCreation date         not null,
    photo        varchar(300) not null
);

create table vs_user_preference
(
    id        int         not null
        primary key,
    userId    int         not null,
    genre     varchar(45) null,
    typeVideo varchar(45) null,
    langue    varchar(45) null,
    constraint user_preference_userid
        foreign key (userId) references vs_user (id)
);

create index user_preference_userid_idx
    on vs_user_preference (userId);

create table vs_video
(
    id     int         not null
        primary key,
    genre  varchar(45) null,
    duree  int         not null,
    date   datetime    not null,
    langue varchar(45) not null,
    titre  varchar(45) null,
    lien   varchar(45) null,
    type   varchar(45) null
);

create table vs_notation
(
    id          int           not null
        primary key,
    userId      int           not null,
    videoId     int           not null,
    Note        int           not null,
    Commentaire varchar(1024) null,
    constraint vs_notation_userid
        foreign key (userId) references vs_user (id),
    constraint vs_notation_videoid
        foreign key (videoId) references vs_video (id)
);

create index vs_notation_userid_idx
    on vs_notation (userId);

create index vs_notation_videoid_idx
    on vs_notation (videoId);

create table vs_video_favorite
(
    id      int not null
        primary key,
    userId  int not null,
    videoId int not null,
    constraint video_favorite_userId
        foreign key (userId) references vs_user (id),
    constraint video_favorite_videoId
        foreign key (videoId) references vs_video (id)
);

create index userId_idx
    on vs_video_favorite (userId);

create index video_favorite_videoId_idx
    on vs_video_favorite (videoId);

create table vs_video_visionnee
(
    id      int not null
        primary key,
    userId  int not null,
    videoId int not null,
    constraint video_visionnee_userId
        foreign key (userId) references vs_user (id),
    constraint video_visionnee_videoId
        foreign key (videoId) references vs_video (id)
);

create index video_visionnee_userId_idx
    on vs_video_visionnee (userId);

create index video_visionnee_videoId_idx
    on vs_video_visionnee (videoId);


INSERT INTO `vs_user` VALUES (1,'test1@gmail.fr','test1','test1','test1','test1','2022-01-19','test1.png'),(2,'test2@gmail.fr','test2','test2','test2','test2','2022-01-19','test2.jpeg'),(3,'achir.tinhinane@gmail.com','tachir','tachir','Achir','Tinhinane','2022-01-19','achir.jpeg');
INSERT INTO `vs_user_preference` VALUES (1,1,'action','film','fr'),(2,2,'thriller','film','fr'),(3,3,'doc','animalier','fr');
INSERT INTO `vs_video` VALUES (1,'test1',2,'2022-03-12 00:00:00','fr','film','videos\\movie.mp4',NULL),(2,'test2',30,'2021-05-23 00:00:00','en','doc','videos\\movie.mp4',NULL);
INSERT INTO `vs_video_favorite` VALUES (1,1,1),(2,1,2);
INSERT INTO `vs_video_visionnee` VALUES (1,1,1),(2,1,2);
INSERT INTO `vs_notation` VALUES (1,1,1,4,'tttttt'),(2,1,2,2,'test');
