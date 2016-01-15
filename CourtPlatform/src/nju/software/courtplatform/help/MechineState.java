package nju.software.courtplatform.help;

import java.util.ArrayList;


public class MechineState {
	private CPUInfo cpuInfo;
	private MemoryInfo memoryInfo;
	private SystemInfo systemInfo;
	private ArrayList<FileSystemInfo> fileSystems = new ArrayList<FileSystemInfo>();
	public CPUInfo getCpuInfo() {
		return cpuInfo;
	}
	public void setCpuInfo(CPUInfo cpuInfo) {
		this.cpuInfo = cpuInfo;
	}
	public MemoryInfo getMemoryInfo() {
		return memoryInfo;
	}
	public void setMemoryInfo(MemoryInfo memoryInfo) {
		this.memoryInfo = memoryInfo;
	}
	public SystemInfo getSystemInfo() {
		return systemInfo;
	}
	public void setSystemInfo(SystemInfo systemInfo) {
		this.systemInfo = systemInfo;
	}
	public ArrayList<FileSystemInfo> getFileSystems() {
		return fileSystems;
	}
	public void setFileSystems(ArrayList<FileSystemInfo> fileSystems) {
		this.fileSystems = fileSystems;
	}
}
