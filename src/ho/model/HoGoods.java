package ho.model;

public class HoGoods {
	private String GoodsId;
	private String GoodsName;
	private String GoodsCate;
	private String GoodsImg;
	private String GoodsInfo;
	private String GoodsColor;
	private String GoodsSize;
	private int GoodsSoo;
	private int GoodsPrice;
	private int GoodsRentPrice;
	private int GoodsDc;
	
	
	public HoGoods()
	{
		
	}
	
	public HoGoods(String GoodsId,String GoodsName,String GoodsCate,String GoodsImg,String GoodsInfo,String GoodsColor,String GoodsSize,int GoodsSoo,int GoodsPrice,int GoodsRentPrice,int GoodsDc)
	{
	
		this.GoodsId = GoodsId;
		this.GoodsName = GoodsName;
		this.GoodsCate = GoodsCate;
		this.GoodsImg =GoodsImg;
		this.GoodsInfo =GoodsInfo;
		this.GoodsColor =GoodsColor;
		this.GoodsSize =GoodsSize;
		this.GoodsSoo =GoodsSoo;
		this.GoodsPrice =GoodsPrice;
		this.GoodsRentPrice =GoodsRentPrice;
		this.GoodsDc = GoodsDc;
	}
	
	public String getGoodsId() {
		return GoodsId;
	}
	public void setGoodsId(String goodsId) {
		GoodsId = goodsId;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public String getGoodsCate() {
		return GoodsCate;
	}
	public void setGoodsCate(String goodsCate) {
		GoodsCate = goodsCate;
	}
	public String getGoodsImg() {
		return GoodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		GoodsImg = goodsImg;
	}
	public String getGoodsInfo() {
		return GoodsInfo;
	}
	public void setGoodsInfo(String goodsInfo) {
		GoodsInfo = goodsInfo;
	}
	public String getGoodsColor() {
		return GoodsColor;
	}
	public void setGoodsColor(String goodsColor) {
		GoodsColor = goodsColor;
	}
	public int getGoodsSoo() {
		return GoodsSoo;
	}
	public void setGoodsSoo(int goodsSoo) {
		GoodsSoo = goodsSoo;
	}
	public int getGoodsPrice() {
		return GoodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		GoodsPrice = goodsPrice;
	}
	public int getGoodsRentPrice() {
		return GoodsRentPrice;
	}
	public void setGoodsRentPrice(int goodsRentPrice) {
		GoodsRentPrice = goodsRentPrice;
	}

	public String getGoodsSize() {
		return GoodsSize;
	}

	public void setGoodsSize(String goodsSize) {
		GoodsSize = goodsSize;
	}

	public int getGoodsDc() {
		return GoodsDc;
	}

	public void setGoodsDc(int goodsDc) {
		GoodsDc = goodsDc;
	}
}
