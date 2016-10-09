package com.sportmgmt.utility.constrant;

public class QueryConstrant {
public static final String FROM_COUNTRY_STATE_CITY = "FROM CountryStateCity";
public static final String SELECT_ACTIVE_GAME = "FROM Game G WHERE G.isActive =:isActive";
public static final String SELECT_MATCH_BY_GAME = "FROM Match M WHERE M.game =:game";
public static final String SELECT_POINT_BY_GAME = "FROM Point P WHERE P.gameId =:gameId";
public static final String SELECT_PLAYERS_CLUBD_OF_EVENT = "select * from GAME_CLUB_PLAYER where GAME_ID=:gameId";
public static final String SELECT_USER_PLAYER_LIST = "select gcp.game_club_player_id from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
														+" and gcp.game_id =:gameId";
public static final String SELECT_USER_PLAYER_DETAIL_LIST = "select gcp.game_club_player_id, gcp.playing_position, up.is_playing, up.user_player_id,up.player_category,up.seq_num from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId";

public static final String SELECT_TOTAL_PLAYER_BY_POSITION = "select gcp.playing_position, count(*) from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId"
															 +" and gcp.game_id =:gameId group by gcp.playing_position";

public static final String SELECT_TOTAL_PLAYING_PLAYER_BY_POSITION = "select gcp.playing_position, count(*) from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId"
		 +" and gcp.game_id =:gameId and up.is_playing=:isPlaying group by gcp.playing_position";

public static final String SELECT_USER_TOTAL_PLAYER = "select count(*) from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId";

public static final String SELECT_USER_TOTAL_ACTIVE_PLAYER = "select count(*) from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId and up.is_playing=:isPlaying";

public static final String SELECT_USER_PLAYER_TOTAL_PRICE = "select sum(gcp.price) from GAME_CLUB_PLAYER gcp, USER_PLAYER up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =:userId" 
		+" and gcp.game_id =:gameId";

public static final String INSERT_DEFAULT_USER_PLAN = "INSERT INTO USER_PLAN(USER_ID,PLAN_ID,USER_PLAN_DESC,IS_ACTIVE,BALANCE_AMOUNT,PLAN_CURRENCY) VALUES"+
		" (:userId,(SELECT PLAN_ID FROM LEAGUE_PLANS WHERE PLAN_NAME = 'DEFAULT' AND IS_ACTIVE = 'Y'),'Free plan on registration','Y',(SELECT PLAN_AMOUNT FROM LEAGUE_PLANS WHERE"+ 
		" PLAN_NAME = 'DEFAULT' AND IS_ACTIVE = 'Y'),(SELECT PLAN_CURRENCY FROM LEAGUE_PLANS WHERE PLAN_NAME = 'DEFAULT' AND IS_ACTIVE = 'Y'))";

public static final String FETCH_CURRENT_GAME_WEEK = "select game_week_id,start_date from GAME_WEEK where start_date <= :date and end_date >= :date and game_id = :gameId";
public static final String FETCH_START_GAME_WEEK = "select game_week_id,start_date from GAME_WEEK where start_date = (select min(start_date) from GAME_WEEK where start_date > :date and game_id=:gameId) ";
public static final String FETCH_START_MATCH_TIME_OF_GAME_WEEK = "select start_time from MATCH_DETAIL where start_time = (select min(start_time) from MATCH_DETAIL where game_week_id = :gameWeekId)";
public static final String FETCH_END_MATCH_TIME_OF_GAME_WEEK = "select start_time from MATCH_DETAIL where end_time = (select max(end_time) from MATCH_DETAIL where game_week_id = :gameWeekId)";
public static final String FETCH_SORTED_GAME_WEEK = "select game_week_id from GAME_WEEK order by start_date";

}
