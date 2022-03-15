package com.sol.pj.tour;

import java.util.List;

public interface BookmarkMapper {

	public List<Bookmark> getMarkByID(Bookmark b);

	public int setMark(Bookmark b);

	public int deleteMark(Bookmark b);

	public List<Bookmark> getBookmark();
}
