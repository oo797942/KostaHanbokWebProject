package ho.model;

public class HoMember {
	// member field
	private String memId;
	private String memPass;
	private String memName;
	private String memTel;
	private String memEmail;
	private String memBirth;
	private String memAddr;
	private String memAddrNo;
	private String memHeight;
	private String memBust;
	private String memShoulder;
	private String memCoin;
	private String memExp;

	public String getMemAddrNo() {
		return memAddrNo;
	}

	public void setMemAddrNo(String memAddrNo) {
		this.memAddrNo = memAddrNo;
	}

	public String getMemExp() {
		return memExp;
	}

	public void setMemExp(String memExp) {
		this.memExp = memExp;
	}

	// constructor method
	public HoMember() {

	}

	public HoMember(String memId, String memPass, String memName, String memTel, String memEmail, String memBirth,
			String memAddr, String memHeight, String memBust, String memShoulder, String memCoin) {
		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memTel = memTel;
		this.memEmail = memEmail;
		this.memBirth = memBirth;
		this.memAddr = memAddr;
		this.memHeight = memHeight;
		this.memBust = memBust;
		this.memShoulder = memShoulder;
		this.memCoin = memCoin;

	}

	// setter and getter
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemAddr() {
		return memAddr;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemHeight() {
		return memHeight;
	}

	public void setMemHeight(String memHeight) {
		this.memHeight = memHeight;
	}

	public String getMemBust() {
		return memBust;
	}

	public void setMemBust(String memBust) {
		this.memBust = memBust;
	}

	public String getMemShoulder() {
		return memShoulder;
	}

	public void setMemShoulder(String memShoulder) {
		this.memShoulder = memShoulder;
	}

	public String getMemCoin() {
		return memCoin;
	}

	public void setMemCoin(String memCoin) {
		this.memCoin = memCoin;
	}
}
