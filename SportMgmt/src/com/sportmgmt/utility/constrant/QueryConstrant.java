package com.sportmgmt.utility.constrant;

public class QueryConstrant {
public static final String FROM_COUNTRY_STATE_CITY = "FROM CountryStateCity";
public static final String SELECT_ACTIVE_GAME = "FROM Game G WHERE G.isActive =:isActive";
public static final String SELECT_PLAYERS_CLUBD_OF_EVENT = "select * from GAME_CLUB_PLAYER where GAME_ID=:gameId";
public static final String SELECT_USER_PLAYER_LIST = "select gcp.game_club_player_id from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
														+" and gcp.game_id =:gameId";
public static final String SELECT_USER_PLAYER_DETAIL_LIST = "select gcp.game_club_player_id, gcp.playing_position, up.is_playing, up.user_player_id from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId";

public static final String SELECT_TOTAL_PLAYER_BY_POSITION = "select gcp.playing_position, count(*) from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId"
															 +" and gcp.game_id =:gameId group by gcp.playing_position";

public static final String SELECT_USER_TOTAL_PLAYER = "select count(*) from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId";

public static final String SELECT_USER_PLAYER_TOTAL_PRICE = "select sum(gcp.price) from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId";
}
