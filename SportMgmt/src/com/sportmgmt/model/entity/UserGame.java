package com.sportmgmt.model.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER_GAME")
public class UserGame {
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="USER_GAME_ID")
	private Integer userGameId;
	
	@Column(name="USER_ID")
	private Integer userId;
	
	@Column(name="GAME_ID")
	private Integer gameId;
	
	@Column(name="USER_TOTAL_POINT")
	private Integer totalPoint;
	
	@Column(name="USER_TEAM_NAME")
	private String teamName;
	
	@Column(name="ADDED_PLAYER_COUNT")
	private Integer addedPlayerCount;
	
	@Column(name="USER_FAV_CLUB_ID")
	private Integer favouiteClubId;
	
	@Column(name="USER_FAV_PLAYER_ID")
	private Integer favoritePlayerId;

	public Integer getUserGameId() {
		return userGameId;
	}

	public void setUserGameId(Integer userGameId) {
		this.userGameId = userGameId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGameId() {
		return gameId;
	}

	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}

	public Integer getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(Integer totalPoint) {
		this.totalPoint = totalPoint;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public Integer getAddedPlayerCount() {
		return addedPlayerCount;
	}

	public void setAddedPlayerCount(Integer addedPlayerCount) {
		this.addedPlayerCount = addedPlayerCount;
	}

	public Integer getFavouiteClubId() {
		return favouiteClubId;
	}

	public void setFavouiteClubId(Integer favouiteClubId) {
		this.favouiteClubId = favouiteClubId;
	}

	public Integer getFavoritePlayerId() {
		return favoritePlayerId;
	}

	public void setFavoritePlayerId(Integer favoritePlayerId) {
		this.favoritePlayerId = favoritePlayerId;
	}

}
