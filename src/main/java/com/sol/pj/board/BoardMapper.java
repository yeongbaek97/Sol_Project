package com.sol.pj.board;

import java.util.List;


public interface BoardMapper {

	int writePost(Board b);

	List<Board> getPost(Paging p);

	Board getDetailPost(Board b);

	int writeComment(Comment c);

	List<Comment> getComments(Comment c);

	void commentInc(Board b);

	void commentDec(Board b);
	
	void viewCount(Board b);

	void deletePost(Board b);

	void modifyPost(Board b);

	void deleteComment(Comment c);

	void modifyComment(Comment c);

	int getTotalPost();

	void testdb();


}
