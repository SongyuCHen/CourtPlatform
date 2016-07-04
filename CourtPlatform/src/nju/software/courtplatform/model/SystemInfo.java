package nju.software.courtplatform.model;

public class SystemInfo {
	private int bh;
	
	private int serverbh;
	
	private String arch;
	
	private String sysname;
	
	private String vender;
	
	private String version;

	public int getBh() {
		return bh;
	}

	public void setBh(int bh) {
		this.bh = bh;
	}

	public int getServerbh() {
		return serverbh;
	}

	public void setServerbh(int serverbh) {
		this.serverbh = serverbh;
	}

	public String getArch() {
		return arch;
	}

	public void setArch(String arch) {
		this.arch = arch;
	}

	public String getSysname() {
		return sysname;
	}

	public void setSysname(String sysname) {
		this.sysname = sysname;
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
