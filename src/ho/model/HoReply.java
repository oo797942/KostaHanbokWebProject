package ho.model;

public class HoReply {
	
private int ReplyNo;
private String ReplySangpum;
private String ReplyId;
private String ReplyDate;
private String ReplyContent;

public HoReply(){
	
}

public HoReply(int ReplyNo,String ReplySangpum,String ReplyId,String ReplyDate,String ReplyContent){
	this.ReplyNo = ReplyNo;
	this.ReplySangpum = ReplySangpum;
	this.ReplyId =ReplyId;
	this.ReplyDate =ReplyDate;
	this.ReplyContent =ReplyContent;
}

public int getReplyNo() {
	return ReplyNo;
}
public void setReplyNo(int replyNo) {
	ReplyNo = replyNo;
}
public String getReplySangpum() {
	return ReplySangpum;
}
public void setReplySangpum(String replySangpum) {
	ReplySangpum = replySangpum;
}
public String getReplyId() {
	return ReplyId;
}
public void setReplyId(String replyId) {
	ReplyId = replyId;
}
public String getReplyDate() {
	return ReplyDate;
}
public void setReplyDate(String replyDate) {
	ReplyDate = replyDate;
}
public String getReplyContent() {
	return ReplyContent;
}
public void setReplyContent(String replyContent) {
	ReplyContent = replyContent;
}

}
