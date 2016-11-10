package ho.model;

public class HoBoard {

	private String boardId;
	private int boardNo;
	private int boardGroupNo;
	private int boardOrderNo;
	private String boardDate;
	private int boardHits;
	private String boardWriter;
	private String boardPass;
	private String boardTitle;
	private String boardContent;
	private String boardAnswer;
	private String boardAnswerStatus;
	
	public HoBoard(){
		
	}
	public HoBoard(String boardId,int boardNo,int boardGroupNo,int boardOrderNo,String boardDate,int boardHits,String boardWriter,String boardPass,String boardTitle,String boardContent,String boardAnswer,String boardAnswerStatus)
	{
		this.boardId = boardId;
		this.boardNo = boardNo;
		this.boardGroupNo = boardGroupNo;
		this.boardOrderNo = boardOrderNo;
		this.boardDate = boardDate;
		this.boardHits = boardHits;
		this.boardWriter = boardWriter;
		this.boardPass = boardPass;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardAnswer = boardAnswer;
		this.boardAnswerStatus = boardAnswerStatus;
	}
	public String getBaordId() {
		return boardId;
	}
	public void setBaordId(String boardId) {
		this.boardId = boardId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardGroupNo() {
		return boardGroupNo;
	}
	public void setBoardGroupNo(int boardGroupNo) {
		this.boardGroupNo = boardGroupNo;
	}
	public int getBoardOrderNo() {
		return boardOrderNo;
	}
	public void setBoardOrderNo(int boardOrderNo) {
		this.boardOrderNo = boardOrderNo;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardPass() {
		return boardPass;
	}
	public void setBoardPass(String boardPass) {
		this.boardPass = boardPass;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	public String getBoardAnswer() {
		return boardAnswer;
	}
	public void setBoardAnswer(String boardAnswer) {
		this.boardAnswer = boardAnswer;
	}
	public String getBoardAnswerStatus() {
		return boardAnswerStatus;
	}
	public void setBoardAnswerStatus(String boardAnswerStatus) {
		this.boardAnswerStatus = boardAnswerStatus;
	}
	
	
}
