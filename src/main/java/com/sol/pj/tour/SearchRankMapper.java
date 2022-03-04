package com.sol.pj.tour;

import java.util.List;

public interface SearchRankMapper {

	public int getSearchRank(SearchRank sr);
	public int countSearchRank(SearchRank sr);
	public int insertSearchRank(SearchRank sr);
	public List<SearchRank> getSearchRankList();

}
