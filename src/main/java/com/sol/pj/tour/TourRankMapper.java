package com.sol.pj.tour;

import java.util.List;

public interface TourRankMapper {
	public int getTourRank(TourRank tr);
	public int countTourRank(TourRank tr);
	public int insertTourRank(TourRank tr);
	public List<TourRank> getTourRankList();
}
