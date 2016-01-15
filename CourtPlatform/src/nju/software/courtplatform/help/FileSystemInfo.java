package nju.software.courtplatform.help;

public class FileSystemInfo {
	private String name;//盘符名称
	private String used;//已使用量
	private String total;//总量
	private String percent;//使用率
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	
}
