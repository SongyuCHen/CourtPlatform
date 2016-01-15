package nju.software.courtplatform.help;

public class SystemInfo {
	private String arch; //系统类型：x84，x64
	private String name; //系统名称
	private String vender; //生产厂商
	private String version; //版本
	public String getArch() {
		return arch;
	}
	public void setArch(String arch) {
		this.arch = arch;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVender() {
		return vender;
	}
	public void setVender(String vender) {
		this.vender = vender;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
}
