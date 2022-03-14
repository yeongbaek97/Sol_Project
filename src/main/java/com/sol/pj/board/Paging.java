package com.sol.pj.board;

public class Paging {
	private int totalPost;
	private int startPage;
	private int endPage;
	private int curPage;
	private int lastPage;
	private int start;
	private int end;
	private int boardPage;
	
	public Paging() {
		// TODO Auto-generated constructor stub
	}

	public Paging(int totalPost, int startPage, int endPage, int curPage, int lastPage, int start, int end,
			int boardPage) {
		super();
		this.totalPost = totalPost;
		this.startPage = startPage;
		this.endPage = endPage;
		this.curPage = curPage;
		this.lastPage = lastPage;
		this.start = start;
		this.end = end;
		this.boardPage = boardPage;
	}

	public Paging(int totalPost, int startPage, int endPage, int lastPage, int start, int end, int boardPage) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.lastPage = lastPage;
		this.start = start;
		this.end = end;
		this.boardPage = boardPage;
		this.totalPost = totalPost;
	}

	public int getBoardPage() {
		return boardPage;
	}

	public void setBoardPage(int boardPage) {
		this.boardPage = boardPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	
	
}
