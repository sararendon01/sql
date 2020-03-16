USE srendon4;
ALTER DATABASE srendon4 CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`(
	userId BINARY (16) NOT NULL,
	userEmail VARCHAR (128) NOT NULL,
	userPassword CHAR (97) NOT NULL,
	userPlaylist VARCHAR (25) NOT NULL,
	UNIQUE(userId),
	INDEX(userEmail),
	PRIMARY KEY(userId)
 );

 CREATE TABLE artist(
	artistId BINARY (16) NOT NULL,
 	artistName VARCHAR (32) NOT NULL,
 	artistGenre BINARY (16) NOT NULL,
 	artistSongs VARCHAR (225) NOT NULL,
 	artistPlaylistId BINARY (16) NOT NULL,
 	UNIQUE(artistId),
 	INDEX(artistName),
 	PRIMARY KEY(artistId),
 	FOREIGN KEY(artistPlaylistId) REFERENCES playlist(playlistId)
 );

 /* weak entity*/
 CREATE TABLE playlist(
 	playlistId BINARY(16) NOT NULL,
 	playlistArtistId BINARY(16) NOT NULL,
 	playlistGenre BINARY (16) NOT NULL,
 	playlistTitle VARCHAR (32) NOT NULL,
 	INDEX (playlistId),
	FOREIGN KEY (playlistArtistId) REFERENCES artist(artistId),
	FOREIGN KEY (playlistGenre) REFERENCES artist(artistGenre),
 	PRIMARY KEY (playlistId)
 );