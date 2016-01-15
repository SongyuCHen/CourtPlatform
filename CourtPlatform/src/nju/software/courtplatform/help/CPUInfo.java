package nju.software.courtplatform.help;

public class CPUInfo {
	private int CPUnum; //CPU数量
	private String rate; //主频
	private String vender; //品牌
	private String model; //类别、系列
	private String cache; //缓存
	public int getCPUnum() {
		return CPUnum;
	}
	public void setCPUnum(int cPUnum) {
		CPUnum = cPUnum;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getVender() {
		return vender;
	}
	public void setVender(String vender) {
		this.vender = vender;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getCache() {
		return cache;
	}
	public void setCache(String cache) {
		this.cache = cache;
	}
	
}
